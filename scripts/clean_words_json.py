#!/usr/bin/env python3
"""
words.json에서 한국어 필드 제거 (영어 원본만 유지)
"""

import json
from pathlib import Path

def main():
    # 경로
    script_dir = Path(__file__).parent
    words_file = script_dir.parent / "assets" / "data" / "words.json"
    
    # 로드
    with open(words_file, 'r', encoding='utf-8') as f:
        words = json.load(f)
    
    print(f"📚 총 {len(words)}개 단어 처리 중...")
    
    # 영어 필드만 유지
    cleaned_words = []
    for word in words:
        cleaned_words.append({
            "id": word["id"],
            "word": word["word"],
            "level": word["level"],
            "partOfSpeech": word["partOfSpeech"],
            "definition": word["definition"],
            "example": word["example"]
        })
    
    # 저장
    with open(words_file, 'w', encoding='utf-8') as f:
        json.dump(cleaned_words, f, ensure_ascii=False, indent=2)
    
    print(f"✅ 완료! {len(cleaned_words)}개 단어 (영어 원본만)")
    
    # 파일 크기 확인
    size_kb = words_file.stat().st_size / 1024
    print(f"📦 파일 크기: {size_kb:.1f} KB")


if __name__ == "__main__":
    main()
