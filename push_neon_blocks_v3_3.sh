#!/usr/bin/env bash
set -euo pipefail

OWNER="gt10300407"
REPO="neon-blocks-for-you"
EMAIL="zhidaole407@gmail.com"
REMOTE="https://github.com/${OWNER}/${REPO}.git"

cd "$(dirname "$0")"

command -v git >/dev/null 2>&1 || { echo "ERROR: git이 설치되어 있지 않아."; exit 1; }
command -v gh >/dev/null 2>&1 || { echo "ERROR: GitHub CLI가 없어. 먼저 실행: brew install gh"; exit 1; }

if ! gh auth status >/dev/null 2>&1; then
  echo "GitHub 로그인이 필요해. 브라우저 인증을 진행한다."
  gh auth login
fi

if [ ! -d .git ]; then
  git init -b main
fi

git config user.name "$OWNER"
git config user.email "$EMAIL"

if gh repo view "${OWNER}/${REPO}" >/dev/null 2>&1; then
  if git remote get-url origin >/dev/null 2>&1; then
    git remote set-url origin "$REMOTE"
  else
    git remote add origin "$REMOTE"
  fi
  git fetch origin main
  git reset --mixed origin/main
else
  gh repo create "${OWNER}/${REPO}" --public --description "Neon mobile falling-block puzzle game"
  git remote add origin "$REMOTE"
fi

git add index.html README.md push_neon_blocks_v3_3.sh

if git diff --cached --quiet; then
  echo "변경된 파일이 없어. 기존 버전을 그대로 사용한다."
else
  git commit -m "feat: add neon mix shapes and history randomizer"
fi

git branch -M main
git push -u origin main

if gh api "repos/${OWNER}/${REPO}/pages" >/dev/null 2>&1; then
  gh api --method PUT "repos/${OWNER}/${REPO}/pages" --input - <<JSON >/dev/null
{"source":{"branch":"main","path":"/"}}
JSON
else
  gh api --method POST "repos/${OWNER}/${REPO}/pages" --input - <<JSON >/dev/null
{"source":{"branch":"main","path":"/"}}
JSON
fi

echo
echo "=============================================="
echo "배포 완료"
echo "게임: https://${OWNER}.github.io/${REPO}/?v=3.3"
echo "저장소: https://github.com/${OWNER}/${REPO}"
echo "=============================================="
