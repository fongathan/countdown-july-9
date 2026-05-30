# Publish to fongathan on GitHub (no Homebrew)

Your terminal said `command not found: brew` — that’s normal on this Mac. Use these steps instead.

## 1. Open Terminal in the publish folder

**Do not use `~/Documents`** if you see “Operation not permitted”. Use the full path:

```bash
cd "/Users/jonathan.fong/Library/CloudStorage/OneDrive-TheWaltDisneyCompany/Documents/Jon Alation OMS Cursor work/countdown-site-publish"
```

## 2. Sign in to GitHub

```bash
chmod +x github-login.sh publish-to-github.sh
./github-login.sh
```

- A browser window should open → log in as **fongathan**
- Or copy the **one-time code** from the terminal into: https://github.com/login/device

## 3. Push the site

```bash
./publish-to-github.sh
```

## 4. Turn on GitHub Pages

Open: https://github.com/fongathan/countdown-july-9/settings/pages  

- **Source:** Deploy from branch  
- **Branch:** `main` → `/ (root)` → **Save**

Live URL (after ~1 min): https://fongathan.github.io/countdown-july-9/

---

## If login still fails: use a token (no browser)

1. GitHub → **Settings** → **Developer settings** → **Personal access tokens** → **Tokens (classic)**  
2. **Generate new token** → check **`repo`** → copy the token  
3. Run:

```bash
export PATH="$HOME/.local/bin:$PATH"
echo "PASTE_YOUR_TOKEN_HERE" | gh auth login --with-token
./publish-to-github.sh
```

---

## Optional: add `gh` to PATH permanently

Add this line to `~/.zshrc`:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

Then run `source ~/.zshrc`.
