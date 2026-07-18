# NEON BLOCKS

모바일과 PC에서 바로 실행되는 네온 낙하 블록 퍼즐 게임이다.

## 게임 기능

- 모바일 보드 직접 스와이프 조작
- 탭 회전, 아래 플릭 하드 드롭, 위 스와이프 홀드
- 10×20 보드와 7-bag 블록 생성
- 벽차기 회전, 고스트, 홀드, 다음 블록 표시
- 점수, 최고점수, 라인, 레벨
- 콤보, Back-to-Back, Perfect Clear
- 줄 삭제 플래시, 파티클, 화면 흔들림, 진동 피드백
- 일시정지와 재시작
- 외부 라이브러리·이미지·폰트 없음

## 로컬 실행

`index.html`을 브라우저로 열거나 아래 명령을 실행한다.

```bash
python3 -m http.server 8000
```

브라우저에서 `http://localhost:8000`으로 접속한다.

## GitHub 자동 배포

GitHub CLI 로그인이 된 컴퓨터에서 다음을 실행한다.

```bash
chmod +x push_to_github.sh
./push_to_github.sh
```

생성 대상:

- 저장소: `gt10300407/neon-blocks-for-you`
- 공개 주소: `https://gt10300407.github.io/neon-blocks-for-you/`

## PC 키보드

- `←` `→`: 이동
- `↓`: 소프트 드롭
- `Z` / `X` 또는 `↑`: 회전
- `Space`: 하드 드롭
- `C`: 홀드
- `P`: 일시정지
- `R`: 재시작
