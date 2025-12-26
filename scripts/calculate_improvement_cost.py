#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
English word 10000 앱의 단어 뜻 개선 비용 및 시간 계산
"""

import json

# GPT-4o mini 가격 (2024년 기준)
# Input: $0.15 per 1M tokens
# Output: $0.60 per 1M tokens

INPUT_PRICE_PER_MILLION = 0.15
OUTPUT_PRICE_PER_MILLION = 0.60

# 단어 데이터 로드
with open('assets/data/words.json', 'r', encoding='utf-8') as f:
    words = json.load(f)

# 샘플 단어로 구조 확인
sample = words[0] if words else {}
num_words = len(words)
num_languages = len(sample.get('translations', {}))

print("\n=== English Word 10000 앱 개선 비용 계산 ===\n")

print(f"데이터베이스 정보:")
print(f"  - 총 단어 수: {num_words:,}개")
print(f"  - 번역 언어 수: {num_languages}개")
print(f"  - 번역 언어: {list(sample.get('translations', {}).keys())}")

# 개선할 항목
# 1. 영어 definition 개선
# 2. 영어 example 개선
# 3. 각 언어별 definition 개선
# 4. 각 언어별 example 개선

improvements_needed = {
    'english_definition': num_words,  # 영어 정의 개선
    'english_example': num_words,     # 영어 예문 개선
    'translated_definition': num_words * num_languages,  # 번역된 정의 개선
    'translated_example': num_words * num_languages,      # 번역된 예문 개선
}

total_improvements = sum(improvements_needed.values())

print(f"\n개선 작업량:")
print(f"  - 영어 definition: {improvements_needed['english_definition']:,}개")
print(f"  - 영어 example: {improvements_needed['english_example']:,}개")
print(f"  - 번역 definition: {improvements_needed['translated_definition']:,}개")
print(f"  - 번역 example: {improvements_needed['translated_example']:,}개")
print(f"  - 총 작업: {total_improvements:,}개")

# 각 작업당 토큰 추정
# 입력: 프롬프트 + 원본 텍스트 (약 150 토큰)
# 출력: 개선된 텍스트 (약 50 토큰)
tokens_per_input = 150
tokens_per_output = 50

total_input_tokens = total_improvements * tokens_per_input
total_output_tokens = total_improvements * tokens_per_output

# 비용 계산
input_cost = (total_input_tokens / 1_000_000) * INPUT_PRICE_PER_MILLION
output_cost = (total_output_tokens / 1_000_000) * OUTPUT_PRICE_PER_MILLION
total_cost = input_cost + output_cost

print(f"\n토큰 사용량:")
print(f"  - 입력 토큰: {total_input_tokens:,} 토큰 ({total_input_tokens/1_000_000:.2f}M)")
print(f"  - 출력 토큰: {total_output_tokens:,} 토큰 ({total_output_tokens/1_000_000:.2f}M)")
print(f"  - 총 토큰: {total_input_tokens + total_output_tokens:,} 토큰 ({(total_input_tokens + total_output_tokens)/1_000_000:.2f}M)")

print(f"\n비용 (GPT-4o mini 가격 기준):")
print(f"  - 입력 비용: ${input_cost:.4f}")
print(f"  - 출력 비용: ${output_cost:.4f}")
print(f"  - 총 비용: ${total_cost:.4f} (약 ${total_cost:.2f} 달러)")
print(f"\n한국 원화 환산 (1 USD = 1,300원 기준):")
print(f"  - 총 비용: 약 {int(total_cost * 1300):,}원")

# 시간 계산
# 병렬 처리 (20개 동시 요청 가정)
# 각 요청당 평균 2초 소요
parallel_workers = 20
time_per_request = 2  # 초
total_requests = total_improvements
sequential_time = total_requests * time_per_request  # 초
parallel_time = sequential_time / parallel_workers  # 초

from datetime import timedelta
estimated_time = timedelta(seconds=int(parallel_time))

print(f"\n예상 소요 시간:")
print(f"  - 병렬 처리 (20개 동시): 약 {str(estimated_time).split('.')[0]}")
print(f"  - 순차 처리: 약 {str(timedelta(seconds=int(sequential_time))).split('.')[0]}")

# 시간당 처리량
improvements_per_hour = (3600 / time_per_request) * parallel_workers
hours_needed = total_improvements / improvements_per_hour

print(f"\n상세 시간 계산:")
print(f"  - 시간당 처리량: 약 {int(improvements_per_hour):,}개/시간")
print(f"  - 예상 소요 시간: 약 {hours_needed:.1f}시간 ({hours_needed*60:.0f}분)")

print(f"\n참고:")
print(f"  - GPT-4o mini는 가장 저렴한 모델입니다")
print(f"  - 실제 비용은 텍스트 길이에 따라 달라질 수 있습니다")
print(f"  - 병렬 처리로 속도를 크게 향상시킬 수 있습니다")


