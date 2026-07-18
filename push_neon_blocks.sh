#!/usr/bin/env bash
set -euo pipefail

# 스크립트를 어느 위치에서 실행해도 이 폴더를 기준으로 작업한다.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

OWNER="gt10300407"
REPO="neon-blocks-for-you"
BRANCH="main"
EMAIL="zhidaole407@gmail.com"
REMOTE_URL="https://github.com/${OWNER}/${REPO}.git"

command -v git >/dev/null 2>&1 || {
  echo "ERROR: git이 설치되어 있지 않아."
  exit 1
}

command -v gh >/dev/null 2>&1 || {
  echo "ERROR: GitHub CLI(gh)가 설치되어 있지 않아."
  echo "설치: brew install gh"
  exit 1
}

# 핵심: git config보다 git init을 먼저 실행한다.
if [ ! -d .git ]; then
  git init -b "$BRANCH"
fi

git config user.name "$OWNER"
git config user.email "$EMAIL"
git branch -M "$BRANCH"

# 로그인되지 않았다면 이 스크립트 안에서 브라우저 로그인을 시작한다.
if ! gh auth status --hostname github.com >/dev/null 2>&1; then
  echo "GitHub 브라우저 로그인을 시작한다."
  gh auth login --hostname github.com --git-protocol https --web
fi

gh auth setup-git --hostname github.com >/dev/null

# 저장소가 없으면 공개 저장소를 만든다.
if ! gh repo view "${OWNER}/${REPO}" >/dev/null 2>&1; then
  gh repo create "${OWNER}/${REPO}" \
    --public \
    --description "Neon mobile falling-block puzzle game"
fi

if git remote get-url origin >/dev/null 2>&1; then
  git remote set-url origin "$REMOTE_URL"
else
  git remote add origin "$REMOTE_URL"
fi

git add -A

if ! git rev-parse --verify HEAD >/dev/null 2>&1; then
  git commit -m "feat: launch neon blocks mobile game"
elif ! git diff --cached --quiet; then
  git commit -m "feat: update neon blocks mobile game"
else
  echo "새로 커밋할 변경사항은 없어. 기존 커밋을 푸시한다."
fi

git push -u origin "$BRANCH"

# GitHub Pages를 main 브랜치 루트로 활성화한다.
if gh api "repos/${OWNER}/${REPO}/pages" >/dev/null 2>&1; then
  gh api --method PUT "repos/${OWNER}/${REPO}/pages" --input - <<JSON >/dev/null
{
  "source": {
    "branch": "${BRANCH}",
    "path": "/"
  }
}
JSON
else
  gh api --method POST "repos/${OWNER}/${REPO}/pages" --input - <<JSON >/dev/null
{
  "source": {
    "branch": "${BRANCH}",
    "path": "/"
  }
}
JSON
fi

echo
echo "=============================================="
echo "완료"
echo "저장소: https://github.com/${OWNER}/${REPO}"
echo "게임 주소: https://${OWNER}.github.io/${REPO}/"
echo "=============================================="
