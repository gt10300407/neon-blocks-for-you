# 유진공주 테트리스 v3.11

조작 안내 글자와 화살표를 원래 HTML 표시 방식으로 되돌리고,
v3.10에서 확인된 iPhone 확대경 차단만 유지한 버전이다.

## v3.11 변경

- `← →` 화살표 원래대로 복구
- `SWIPE TO MOVE` 원래대로 복구
- `TAP ROTATE · ↑ HOLD · ↓ DROP` 원래대로 복구
- CSS 생성 문구 방식 제거
- 기존 실제 HTML 안내 글자 방식으로 복원
- `user-select: none`
- `-webkit-touch-callout: none`
- `touchstart`, `touchmove`, `touchend` 기본 동작 차단 유지
- 확대경·복사·선택 메뉴 차단 유지
- 스와이프 방향 잠금, 25초 피버, 기록, 도형 18종 유지

## GitHub 업데이트

```bash
cd ~/Downloads/neon-blocks-for-you-git-update-https-v3-11
bash push_neon_blocks_v3_11.sh
```

확인 주소:

```text
https://gt10300407.github.io/neon-blocks-for-you/?v=3.11
```
