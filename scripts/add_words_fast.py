#!/usr/bin/env python3
"""
영어 단어장 대량 데이터 생성 스크립트 (비동기 고속 버전)
- 비동기 병렬 처리로 10배 이상 빠름
- Free Dictionary API + MyMemory 번역 API
"""

import json
import asyncio
import aiohttp
import time
import os
from pathlib import Path
from typing import Optional
import re

# 설정
DICTIONARY_API = "https://api.dictionaryapi.dev/api/v2/entries/en/"
MYMEMORY_API = "https://api.mymemory.translated.net/get"
CONCURRENT_REQUESTS = 30  # 동시 요청 수
BATCH_SIZE = 100  # 저장 배치 크기

# SCOWL 단어 파일 경로 (사용자 다운로드 폴더)
SCOWL_PATH = Path(r"C:\Users\hooni\Downloads\scowl-2020.12.07\final")


def load_scowl_words(max_words: int = 10000) -> list[str]:
    """SCOWL에서 일반 단어만 로드 (proper names, abbreviations 제외)"""
    words = set()
    
    # 일반 단어 파일들만 선택 (american-words.XX)
    word_files = [
        "american-words.10",  # 가장 흔한 단어
        "american-words.20",
        "american-words.35",
        "american-words.40",
        "american-words.50",
        "american-words.55",
        "american-words.60",
        "american-words.70",
        "american-words.80",
    ]
    
    for filename in word_files:
        filepath = SCOWL_PATH / filename
        if filepath.exists():
            with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
                for line in f:
                    word = line.strip().lower()
                    # 필터링: 영문자만, 3글자 이상, 15글자 이하
                    if (word and 
                        word.isalpha() and 
                        3 <= len(word) <= 15 and
                        not word.endswith("'s")):
                        words.add(word)
        
        if len(words) >= max_words:
            break
    
    # 정렬 후 반환
    return sorted(list(words))[:max_words]


async def fetch_definition(session: aiohttp.ClientSession, word: str) -> Optional[dict]:
    """비동기로 단어 정의 가져오기"""
    try:
        async with session.get(f"{DICTIONARY_API}{word}", timeout=aiohttp.ClientTimeout(total=10)) as response:
            if response.status == 200:
                data = await response.json()
                if data and len(data) > 0:
                    entry = data[0]
                    meanings = entry.get("meanings", [])
                    if meanings:
                        first_meaning = meanings[0]
                        definitions = first_meaning.get("definitions", [])
                        if definitions:
                            first_def = definitions[0]
                            definition = first_def.get("definition", "")
                            example = first_def.get("example", "")
                            
                            # 예문이 없으면 다른 곳에서 찾기
                            if not example:
                                for m in meanings:
                                    for d in m.get("definitions", []):
                                        if d.get("example"):
                                            example = d.get("example")
                                            break
                                    if example:
                                        break
                            
                            if not example:
                                example = f"I need to understand the word {word}."
                            
                            return {
                                "word": word,
                                "partOfSpeech": first_meaning.get("partOfSpeech", "unknown"),
                                "definition": definition,
                                "example": example
                            }
    except Exception:
        pass
    return None


async def translate_text(session: aiohttp.ClientSession, text: str) -> str:
    """비동기로 한국어 번역"""
    if not text:
        return ""
    try:
        # 텍스트가 너무 길면 자르기
        text = text[:500]
        params = {
            "q": text,
            "langpair": "en|ko"
        }
        async with session.get(MYMEMORY_API, params=params, timeout=aiohttp.ClientTimeout(total=10)) as response:
            if response.status == 200:
                data = await response.json()
                if data.get("responseStatus") == 200:
                    translated = data.get("responseData", {}).get("translatedText", "")
                    return translated
    except Exception:
        pass
    return text  # 실패시 원문 반환


def get_level(word: str) -> str:
    """단어 난이도 추정"""
    if len(word) <= 4:
        return "A1"
    elif len(word) <= 5:
        return "A2"
    elif len(word) <= 7:
        return "B1"
    elif len(word) <= 9:
        return "B2"
    else:
        return "C1"


async def process_word(session: aiohttp.ClientSession, word: str, word_id: int, semaphore: asyncio.Semaphore) -> Optional[dict]:
    """단어 하나 처리 (정의 + 번역)"""
    async with semaphore:
        # 1. 정의 가져오기
        word_data = await fetch_definition(session, word)
        if not word_data:
            return None
        
        # 2. 한국어 번역
        definition_kr = await translate_text(session, word_data['definition'])
        example_kr = await translate_text(session, word_data['example'])
        
        return {
            "id": word_id,
            "word": word_data['word'],
            "level": get_level(word),
            "partOfSpeech": word_data['partOfSpeech'],
            "definition": word_data['definition'],
            "definitionKr": definition_kr,
            "example": word_data['example'],
            "exampleKr": example_kr
        }


async def process_batch(words: list[str], start_id: int, existing_set: set) -> list[dict]:
    """배치 단위로 단어들 병렬 처리"""
    semaphore = asyncio.Semaphore(CONCURRENT_REQUESTS)
    results = []
    
    connector = aiohttp.TCPConnector(limit=CONCURRENT_REQUESTS, limit_per_host=CONCURRENT_REQUESTS)
    async with aiohttp.ClientSession(connector=connector) as session:
        tasks = []
        current_id = start_id
        
        for word in words:
            if word.lower() not in existing_set:
                tasks.append(process_word(session, word, current_id, semaphore))
                current_id += 1
        
        # 진행 상황 표시하며 처리
        completed = 0
        total = len(tasks)
        
        for coro in asyncio.as_completed(tasks):
            result = await coro
            completed += 1
            if result:
                results.append(result)
            
            if completed % 50 == 0 or completed == total:
                print(f"  진행: {completed}/{total} ({len(results)}개 성공)")
    
    return results


def load_existing_words(filepath: Path) -> tuple[list, set, int]:
    """기존 words.json 로드"""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            words = json.load(f)
            existing = {w['word'].lower() for w in words}
            max_id = max([w['id'] for w in words], default=0)
            return words, existing, max_id
    except FileNotFoundError:
        return [], set(), 0


def save_words(filepath: Path, words: list):
    """words.json 저장"""
    with open(filepath, 'w', encoding='utf-8') as f:
        json.dump(words, f, ensure_ascii=False, indent=2)


async def main():
    print("=" * 60)
    print("🚀 영어 단어장 대량 데이터 생성 (고속 비동기 버전)")
    print("=" * 60)
    
    # 경로 설정
    script_dir = Path(__file__).parent
    words_file = script_dir.parent / "assets" / "data" / "words.json"
    
    # 기존 단어 로드
    existing_words, existing_set, max_id = load_existing_words(words_file)
    print(f"📚 기존 단어 수: {len(existing_words)}")
    
    # 목표 단어 수 입력
    try:
        target_count = int(input("🎯 추가할 단어 수를 입력하세요 (기본 1000): ") or "1000")
    except ValueError:
        target_count = 1000
    
    print(f"\n📖 SCOWL에서 단어 로드 중...")
    scowl_words = load_scowl_words(target_count + len(existing_set))
    
    # 중복 제외
    new_words = [w for w in scowl_words if w.lower() not in existing_set][:target_count]
    print(f"🆕 추가할 단어: {len(new_words)}개")
    
    if not new_words:
        print("추가할 새 단어가 없습니다.")
        return
    
    # 배치 처리
    start_time = time.time()
    all_new_words = []
    
    for i in range(0, len(new_words), BATCH_SIZE):
        batch = new_words[i:i + BATCH_SIZE]
        batch_num = i // BATCH_SIZE + 1
        total_batches = (len(new_words) + BATCH_SIZE - 1) // BATCH_SIZE
        
        print(f"\n📦 배치 {batch_num}/{total_batches} 처리 중 ({len(batch)}개)...")
        
        batch_results = await process_batch(
            batch,
            max_id + len(all_new_words) + 1,
            existing_set
        )
        
        all_new_words.extend(batch_results)
        
        # 중간 저장 (100개마다)
        if len(all_new_words) % 100 == 0:
            temp_words = existing_words + all_new_words
            save_words(words_file, temp_words)
            print(f"  💾 중간 저장 완료 (총 {len(temp_words)}개)")
    
    # 최종 저장
    final_words = existing_words + all_new_words
    save_words(words_file, final_words)
    
    elapsed = time.time() - start_time
    
    print("\n" + "=" * 60)
    print("✅ 완료!")
    print(f"   - 추가된 단어: {len(all_new_words)}개")
    print(f"   - 총 단어 수: {len(final_words)}개")
    print(f"   - 소요 시간: {elapsed:.1f}초 ({elapsed/60:.1f}분)")
    print(f"   - 처리 속도: {len(all_new_words)/elapsed:.1f} 단어/초")
    print("=" * 60)


if __name__ == "__main__":
    asyncio.run(main())
