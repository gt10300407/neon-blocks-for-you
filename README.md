# 유진공주 테트리스 v3.9

iPhone Safari에서 스와이프 조작 중 나타나는 텍스트 선택 확대경을 제거한 버전이다.

## v3.9 변경

- 스와이프 패드의 실제 안내 텍스트 완전 제거
- 좌우 화살표를 글자가 아닌 CSS 도형으로 변경
- 중앙 안내도 텍스트 대신 선택 불가능한 그래픽 표시로 변경
- 게임 전체 하위 요소와 의사 요소까지 `user-select: none` 강제 적용
- iOS 길게 누르기 메뉴와 사용자 드래그 추가 차단
- Safari가 Selection 객체를 생성하면 즉시 해제
- v3.8의 스와이프 방향 잠금 유지
- v3.7의 25초 AUTO FEVER, 최고기록, 18종 도형 유지

조작 방법은 시작 화면에서만 안내하며, 실제 플레이 중 조작 패드에는 선택 가능한 글자가 존재하지 않는다.

## GitHub 업데이트

```bash
cd ~/Downloads/neon-blocks-for-you-git-update-https-v3-9
bash push_neon_blocks_v3_9.sh
```

확인 주소:

```text
https://gt10300407.github.io/neon-blocks-for-you/?v=3.9
```
