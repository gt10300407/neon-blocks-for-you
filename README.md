# NEON BLOCKS — Neon Mix v3.3

일반 테트리스 7종에 네온 특수 도형 5종을 추가하고, 반복적으로 느껴지던 7-bag 순서를 교체한 버전이다.

## v3.3 변경

- 클래식 도형 7종 유지: I, J, L, O, S, T, Z
- 네온 특수 도형 5종 추가
  - 3칸 막대
  - 3칸 미니 L
  - U 도형
  - V 도형
  - X 도형
- 기존 7-bag 제거
- 최근 4개 도형과 겹치지 않도록 우선 선택하는 History Randomizer 적용
- 특정 클래식 도형이 지나치게 오래 나오지 않는 Drought Protection 적용
- 특수 도형은 첫 7개 이후 약 18% 확률로 등장
- 특수 도형 연속 출현 방지용 4개 쿨다운 적용
- 시작 화면에 `NEON MIX · 12 SHAPES` 표시
- v3.2 한국어 줄바꿈·텍스트 선택 방지 수정 유지

## 랜덤 방식

완전 무작위는 같은 도형이 계속 나오거나 필요한 도형이 오랫동안 안 나올 수 있다.
따라서 v3.3은 고정된 7개 묶음이 아니라 다음 기준을 함께 사용한다.

1. 최근 4개 도형은 우선 제외
2. 오래 나오지 않은 클래식 도형의 확률 증가
3. 12개 이상 나오지 않은 클래식 도형은 강제 보정
4. 특수 도형은 연속으로 나오지 않음

## GitHub 업데이트

압축을 Downloads에 풀고 다음 두 줄만 실행한다.

```bash
cd ~/Downloads/neon-blocks-for-you-git-update-https-v3-3
bash push_neon_blocks_v3_3.sh
```

캐시를 피한 확인 주소:

```text
https://gt10300407.github.io/neon-blocks-for-you/?v=3.3
```
