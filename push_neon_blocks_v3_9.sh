#!/usr/bin/env bash
set -euo pipefail

OWNER="gt10300407"
REPO="neon-blocks-for-you"
BRANCH="main"
SCRIPT_NAME="push_neon_blocks_v3_9.sh"
SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"
TMP_ROOT="$(mktemp -d)"
WORK_DIR="$TMP_ROOT/repo"

cleanup() {
  rm -rf "$TMP_ROOT"
}
trap cleanup EXIT

command -v git >/dev/null 2>&1 || {
  echo "ERROR: git이 설치되어 있지 않아."
  exit 1
}

command -v gh >/dev/null 2>&1 || {
  echo "ERROR: GitHub CLI가 설치되어 있지 않아."
  echo "설치: brew install gh"
  exit 1
}

if ! gh auth status >/dev/null 2>&1; then
  echo "GitHub 로그인을 시작한다."
  gh auth login
fi

if gh repo view "$OWNER/$REPO" >/dev/null 2>&1; then
  echo "기존 저장소를 가져오는 중..."
  gh repo clone "$OWNER/$REPO" "$WORK_DIR"
else
  echo "새 저장소를 준비하는 중..."
  mkdir -p "$WORK_DIR"
  git -C "$WORK_DIR" init -b "$BRANCH"
fi

cp "$SOURCE_DIR/index.html" "$WORK_DIR/index.html"
cp "$SOURCE_DIR/README.md" "$WORK_DIR/README.md"
cp "$SOURCE_DIR/$SCRIPT_NAME" "$WORK_DIR/$SCRIPT_NAME"

git -C "$WORK_DIR" config user.name "$OWNER"
git -C "$WORK_DIR" config user.email "zhidaole407@gmail.com"
git -C "$WORK_DIR" add index.html README.md "$SCRIPT_NAME"

if ! git -C "$WORK_DIR" diff --cached --quiet; then
  git -C "$WORK_DIR" commit -m "fix: remove iOS text loupe from swipe controls"
fi

if gh repo view "$OWNER/$REPO" >/dev/null 2>&1; then
  git -C "$WORK_DIR" push origin "$BRANCH"
else
  (
    cd "$WORK_DIR"
    gh repo create "$OWNER/$REPO" \
      --public \
      --description "유진공주를 위한 모바일 네온 테트리스 게임" \
      --source=. \
      --remote=origin \
      --push
  )
fi

if gh api "repos/$OWNER/$REPO/pages" >/dev/null 2>&1; then
  gh api \
    --method PUT \
    "repos/$OWNER/$REPO/pages" \
    --input - <<JSON >/dev/null
{
  "source": {
    "branch": "$BRANCH",
    "path": "/"
  }
}
JSON
else
  gh api \
    --method POST \
    "repos/$OWNER/$REPO/pages" \
    --input - <<JSON >/dev/null
{
  "source": {
    "branch": "$BRANCH",
    "path": "/"
  }
}
JSON
fi

echo
echo "========================================"
echo "유진공주 테트리스 v3.9 배포 완료"
echo "게임: https://$OWNER.github.io/$REPO/?v=3.9"
echo "저장소: https://github.com/$OWNER/$REPO"
echo "========================================"
