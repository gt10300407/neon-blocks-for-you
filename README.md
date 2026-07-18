# NEON BLOCKS — Overdrive v3

모바일 발열과 조작감을 개선한 네온 낙하 블록 퍼즐 게임이다.

## v3 핵심 변경

- 평상시 30FPS, 효과 순간만 60FPS
- 네온 블록과 게임판 배경을 최초 1회 캐시 후 재사용
- `backdrop-filter` 제거 및 파티클 최대 개수 제한
- 게임판과 분리된 하단 터치패드
- 줄 삭제 히트스톱, 화면 충격, 파티클, 단계별 콤보 사운드
- 점수 체계 확대: 1줄 1,000 / 2줄 3,000 / 3줄 6,000 / 4줄 12,000
- 콤보 배수 및 백투백 보너스
- NEON OVERDRIVE: 8초간 점수 2배, 낙하 속도 완화, 콤보 보호 2회

## 모바일 조작

- 터치패드 좌우 드래그: 이동
- 터치패드 탭: 회전
- 터치패드 아래 드래그: 소프트 드롭
- 터치패드 아래 플릭: 하드 드롭
- 터치패드 위 스와이프: 홀드
- 하단 버튼: HOLD / ROTATE / DRIVE / DROP

## GitHub 업데이트

압축을 Downloads에 풀고 다음 두 줄만 실행한다.

```bash
cd ~/Downloads/neon-blocks-for-you-git-update-https-v3
bash push_neon_blocks_v3.sh
```

게임 주소:

```text
https://gt10300407.github.io/neon-blocks-for-you/
```
