#!/bin/sh
# Publish countdown site to https://github.com/fongathan/countdown-july-9
set -e
REPO="fongathan/countdown-july-9"
ROOT="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT"

export PATH="$HOME/.local/bin:$PATH"
GH="$(command -v gh)"
if [ -z "$GH" ]; then
  echo "Run ./github-login.sh first (installs gh without Homebrew)."
  exit 1
fi

"$GH" auth status >/dev/null 2>&1 || {
  echo "Log in first: gh auth login"
  exit 1
}

if ! "$GH" repo view "$REPO" >/dev/null 2>&1; then
  "$GH" repo create "$REPO" --public --source=. --remote=origin --description "Taylor Swift-themed countdown to July 9, 2026" --push
else
  git push -u origin main 2>/dev/null || git push -u origin master 2>/dev/null || git push origin HEAD
fi

"$GH" repo edit "$REPO" --enable-pages --pages-branch main --pages-path /
echo ""
echo "Done. Enable Pages if needed: https://github.com/$REPO/settings/pages"
echo "Site URL: https://fongathan.github.io/countdown-july-9/"
