#!/bin/sh
# Sign in to github.com as fongathan (no Homebrew required)
export PATH="$HOME/.local/bin:$PATH"

if ! command -v gh >/dev/null 2>&1; then
  echo "Installing GitHub CLI to ~/.local/bin ..."
  mkdir -p "$HOME/.local/bin" "$HOME/.local/share/gh-cli"
  curl -sL -o "$HOME/.local/share/gh-cli/gh.zip" \
    "https://github.com/cli/cli/releases/download/v2.92.0/gh_2.92.0_macOS_arm64.zip"
  unzip -q -o "$HOME/.local/share/gh-cli/gh.zip" -d "$HOME/.local/share/gh-cli"
  cp "$HOME/.local/share/gh-cli/gh_2.92.0_macOS_arm64/bin/gh" "$HOME/.local/bin/gh"
  chmod +x "$HOME/.local/bin/gh"
fi

echo ""
echo "=== GitHub sign-in (github.com) ==="
echo "When prompted, choose:"
echo "  • GitHub.com"
echo "  • HTTPS"
echo "  • Login with a web browser (or paste a token)"
echo ""
echo "Sign in as: fongathan"
echo ""

gh auth login -h github.com -p https -w

echo ""
gh auth status && echo "" && echo "OK — now run: ./publish-to-github.sh"
