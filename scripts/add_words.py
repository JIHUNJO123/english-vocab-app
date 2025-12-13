#!/usr/bin/env python3
"""
영어 단어장 데이터 생성 스크립트
- Free Dictionary API: 영어 정의, 품사, 예문
- googletrans: 한국어 번역
"""

import json
import requests
import time
import os
from pathlib import Path

# googletrans 설치 필요: pip install googletrans==4.0.0-rc1
try:
    from googletrans import Translator
    translator = Translator()
    HAS_TRANSLATOR = True
except ImportError:
    print("⚠️ googletrans가 설치되지 않았습니다. pip install googletrans==4.0.0-rc1")
    HAS_TRANSLATOR = False

# Free Dictionary API
DICTIONARY_API = "https://api.dictionaryapi.dev/api/v2/entries/en/"

# 추가할 기본 단어 목록 (자주 사용되는 영어 단어)
NEW_WORDS = [
    "abandon", "ability", "absolute", "accept", "accident",
    "accomplish", "accurate", "admit", "advantage", "advice",
    "affect", "afford", "afraid", "agency", "agree",
    "allow", "almost", "alone", "although", "always",
    "amazing", "amount", "ancient", "angry", "announce",
    "anxiety", "appear", "appreciate", "approach", "appropriate",
    "argue", "arrange", "arrive", "article", "assume",
    "attach", "attack", "attempt", "attend", "attention",
    "attitude", "attract", "audience", "author", "available",
    "average", "avoid", "aware", "balance", "basic",
    "beautiful", "become", "before", "begin", "behavior",
    "belong", "benefit", "beside", "between", "beyond",
    "billion", "blame", "block", "blood", "board",
    "border", "bother", "bottom", "brain", "branch",
    "brave", "break", "breathe", "bridge", "brief",
    "bright", "bring", "broad", "brother", "budget",
    "build", "burden", "burn", "bury", "business",
    "calculate", "calm", "campaign", "capable", "capacity",
    "capital", "capture", "career", "careful", "carry",
    "category", "cause", "celebrate", "center", "century",
    "certain", "challenge", "champion", "chance", "change",
    "chapter", "character", "charge", "charity", "cheap",
    "chemical", "chief", "childhood", "choice", "choose",
    "circumstance", "citizen", "claim", "classic", "clean",
    "clear", "climate", "climb", "close", "collect",
    "college", "combine", "comfort", "command", "comment",
    "commit", "common", "communicate", "community", "company",
    "compare", "compete", "complain", "complete", "complex",
    "concentrate", "concept", "concern", "conclude", "condition",
    "conduct", "conference", "confidence", "confirm", "conflict",
    "confuse", "connect", "conscious", "consider", "constant",
    "construct", "consume", "contact", "contain", "content",
    "context", "continue", "contract", "contribute", "control",
    "convenient", "conversation", "convince", "cooperate", "correct",
    "cost", "count", "country", "couple", "courage",
    "course", "court", "cover", "crash", "crazy",
    "creative", "credit", "crisis", "critical", "crowd",
    "crucial", "culture", "curious", "current", "customer"
]


def get_word_data(word: str) -> dict | None:
    """Free Dictionary API에서 단어 정보 가져오기"""
    try:
        response = requests.get(f"{DICTIONARY_API}{word}", timeout=10)
        if response.status_code == 200:
            data = response.json()[0]
            
            # 첫 번째 의미 가져오기
            meanings = data.get("meanings", [])
            if not meanings:
                return None
            
            first_meaning = meanings[0]
            part_of_speech = first_meaning.get("partOfSpeech", "unknown")
            
            definitions = first_meaning.get("definitions", [])
            if not definitions:
                return None
            
            first_def = definitions[0]
            definition = first_def.get("definition", "")
            example = first_def.get("example", "")
            
            # 예문이 없으면 다른 정의에서 찾기
            if not example:
                for meaning in meanings:
                    for defn in meaning.get("definitions", []):
                        if defn.get("example"):
                            example = defn.get("example")
                            break
                    if example:
                        break
            
            # 예문이 여전히 없으면 기본 예문 생성
            if not example:
                example = f"This is an example of {word}."
            
            return {
                "word": word,
                "partOfSpeech": part_of_speech,
                "definition": definition,
                "example": example
            }
        else:
            print(f"  ❌ API 응답 없음: {word}")
            return None
    except Exception as e:
        print(f"  ❌ 오류: {word} - {e}")
        return None


def translate_to_korean(text: str) -> str:
    """영어를 한국어로 번역"""
    if not HAS_TRANSLATOR or not text:
        return ""
    
    try:
        result = translator.translate(text, src='en', dest='ko')
        return result.text
    except Exception as e:
        print(f"  ⚠️ 번역 오류: {e}")
        return ""


def get_level(word: str) -> str:
    """단어 난이도 추정 (간단한 휴리스틱)"""
    # 짧고 흔한 단어는 쉬움
    common_a1 = ["about", "after", "again", "all", "also", "always", "and", "any", "ask", "back", 
                 "bad", "be", "because", "before", "begin", "big", "bring", "but", "by", "call",
                 "can", "come", "could", "day", "do", "down", "each", "end", "even", "few"]
    
    if word.lower() in common_a1:
        return "A1"
    elif len(word) <= 4:
        return "A1"
    elif len(word) <= 6:
        return "A2"
    elif len(word) <= 8:
        return "B1"
    elif len(word) <= 10:
        return "B2"
    else:
        return "C1"


def load_existing_words(filepath: str) -> tuple[list, set]:
    """기존 words.json 로드"""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            words = json.load(f)
            existing = {w['word'].lower() for w in words}
            return words, existing
    except FileNotFoundError:
        return [], set()


def save_words(filepath: str, words: list):
    """words.json 저장"""
    with open(filepath, 'w', encoding='utf-8') as f:
        json.dump(words, f, ensure_ascii=False, indent=2)


def main():
    # 경로 설정
    script_dir = Path(__file__).parent
    words_file = script_dir.parent / "assets" / "data" / "words.json"
    
    print("=" * 50)
    print("🔤 영어 단어장 데이터 생성 스크립트")
    print("=" * 50)
    
    # 기존 단어 로드
    existing_words, existing_set = load_existing_words(words_file)
    next_id = max([w['id'] for w in existing_words], default=0) + 1
    
    print(f"📚 기존 단어 수: {len(existing_words)}")
    print(f"➕ 추가할 단어 후보: {len(NEW_WORDS)}")
    print()
    
    # 중복 제외
    words_to_add = [w for w in NEW_WORDS if w.lower() not in existing_set]
    print(f"🆕 중복 제외 후 추가할 단어: {len(words_to_add)}")
    print()
    
    added_count = 0
    failed_words = []
    
    for i, word in enumerate(words_to_add):
        print(f"[{i+1}/{len(words_to_add)}] {word} 처리 중...")
        
        # API에서 데이터 가져오기
        word_data = get_word_data(word)
        
        if word_data:
            # 한국어 번역
            definition_kr = translate_to_korean(word_data['definition'])
            example_kr = translate_to_korean(word_data['example'])
            
            # 새 단어 데이터 생성
            new_word = {
                "id": next_id,
                "word": word_data['word'],
                "level": get_level(word),
                "partOfSpeech": word_data['partOfSpeech'],
                "definition": word_data['definition'],
                "definitionKr": definition_kr if definition_kr else word_data['definition'],
                "example": word_data['example'],
                "exampleKr": example_kr if example_kr else word_data['example']
            }
            
            existing_words.append(new_word)
            next_id += 1
            added_count += 1
            print(f"  ✅ 추가 완료: {word}")
        else:
            failed_words.append(word)
        
        # API 레이트 리밋 방지
        time.sleep(0.3)
    
    # 저장
    save_words(words_file, existing_words)
    
    print()
    print("=" * 50)
    print(f"✅ 완료!")
    print(f"   - 추가된 단어: {added_count}개")
    print(f"   - 실패한 단어: {len(failed_words)}개")
    print(f"   - 총 단어 수: {len(existing_words)}개")
    
    if failed_words:
        print(f"\n❌ 실패한 단어 목록:")
        print(", ".join(failed_words))


if __name__ == "__main__":
    main()
