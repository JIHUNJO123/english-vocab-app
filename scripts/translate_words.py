#!/usr/bin/env python3
"""
words.json 한국어 번역 추가 스크립트
- deep-translator 사용 (더 안정적)
"""

import json
from pathlib import Path
import time

# pip install deep-translator
try:
    from deep_translator import GoogleTranslator
    translator = GoogleTranslator(source='en', target='ko')
    HAS_TRANSLATOR = True
except ImportError:
    print("❌ deep-translator가 필요합니다.")
    print("   pip install deep-translator")
    HAS_TRANSLATOR = False


def translate_text(text: str) -> str:
    """영어를 한국어로 번역"""
    if not HAS_TRANSLATOR or not text:
        return text
    try:
        return translator.translate(text)
    except Exception as e:
        print(f"  ⚠️ 번역 실패: {e}")
        return text


def main():
    if not HAS_TRANSLATOR:
        return
    
    # 경로
    script_dir = Path(__file__).parent
    words_file = script_dir.parent / "assets" / "data" / "words.json"
    
    # 로드
    with open(words_file, 'r', encoding='utf-8') as f:
        words = json.load(f)
    
    print(f"📚 총 {len(words)}개 단어 번역 시작...")
    
    # 번역이 필요한 단어만 처리
    count = 0
    for i, word in enumerate(words):
        # 이미 번역된 경우 스킵
        if word["definitionKr"] != word["definition"]:
            continue
        
        # 번역
        word["definitionKr"] = translate_text(word["definition"])
        word["exampleKr"] = translate_text(word["example"])
        count += 1
        
        if count % 10 == 0:
            print(f"  진행: {count}개 번역 완료 ({word['word']})")
        
        # Rate limit 방지
        time.sleep(0.2)
        
        # 중간 저장 (50개마다)
        if count % 50 == 0:
            with open(words_file, 'w', encoding='utf-8') as f:
                json.dump(words, f, ensure_ascii=False, indent=2)
            print(f"  💾 중간 저장 완료")
    
    # 최종 저장
    with open(words_file, 'w', encoding='utf-8') as f:
        json.dump(words, f, ensure_ascii=False, indent=2)
    
    print(f"\n✅ 완료! {count}개 단어 번역됨")


if __name__ == "__main__":
    main()
