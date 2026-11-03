# GitHub Profile Setup

This folder is a ready-to-publish GitHub **profile README** repo. Three steps and it's live.

```
README.md                      the profile itself
assets/banner.svg              custom hero banner (plain SVG, editable)
.github/workflows/snake.yml    daily contribution snake generator
setup.ps1                      fills in your details
```

## 1. Create the special repo

GitHub shows a profile README only when the repository name **exactly matches** your username.

1. Create a new **public** repo named `YOUR_USERNAME` (e.g. user `octocat` → repo `octocat`).
2. Tick **Add a README file** (any content — it gets replaced).
3. That's it. The README now renders at the top of `https://github.com/YOUR_USERNAME`.

## 2. Fill in your details

From this folder:

```powershell
.\setup.ps1
```

It asks for your username, name, email, LinkedIn, X, and portfolio, then rewrites every placeholder in `README.md` and `assets/banner.svg`.

Manual route — find & replace:

| Placeholder | Replace with |
| :--- | :--- |
| `YOUR_USERNAME` | your GitHub handle |
| `Your Name` | your display name |
| `YOUR_LINKEDIN` | LinkedIn slug (`jean-dupont`) |
| `YOUR_X` | X/Twitter handle |
| `YOUR_EMAIL` | your email |
| `YOUR_PORTFOLIO` | your site host (`mysite.dev`, no `https://`) |
| `PROJECT_ONE` … `PROJECT_FOUR` | your repo names |

Then make the four project cards in **Featured projects** say something real. Each card is 5 lines — heading, one-sentence pitch, tech tags, demo link, source link. Delete the cards you don't need and keep the grid balanced (2×2, 1×2, or a single card is fine).

## 3. Push

```powershell
git init
git add .
git commit -m "Add profile README"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/YOUR_USERNAME.git
git push -u origin main
```

Finally, open **Actions → Generate Snake → Run workflow** once. It publishes an `output` branch holding the snake SVGs that the README already points at, and refreshes them daily after that.

## Why these services

Every image in the README was checked before shipping:

| Service | What it draws |
| :--- | :--- |
| `readme-typing-svg.demolab.com` | animated typing headline |
| `skillicons.dev` + `img.shields.io` | tech icons and badges |
| `github-profile-summary-cards.vercel.app` | stats, per-language, commit-time cards |
| `streak-stats.demolab.com` | current / longest streak |
| `komarev.com` | profile view counter |
| `capsule-render.vercel.app` | waving footer |

`github-readme-stats.vercel.app`, `github-profile-trophy`, and `github-readme-activity-graph` were **left out on purpose** — at build time they answered `503` / `402` (public instances get rate-limited). If you want them later:

```md
<!-- top languages -->
<img src="https://github-readme-stats.vercel.app/api/top-langs/?username=YOUR_USERNAME&layout=compact&theme=tokyonight&hide_border=true" />

<!-- pinned repo card -->
<img src="https://github-readme-stats.vercel.app/api/pin/?username=YOUR_USERNAME&repo=REPO_NAME&theme=tokyonight&hide_border=true" />

<!-- trophies -->
<img src="https://github-profile-trophy.vercel.app/?username=YOUR_USERNAME&theme=tokyonight&no-frame=true" />
```

Test the URL in a browser tab first — if it renders there, it renders in the README.

## Notes

- **Snake missing?** The `output` branch doesn't exist until the workflow runs. Check **Actions** is enabled and the run has `contents: write` (already configured).
- **Productive-time card** is set to `utcOffset=5.5` (IST). Change it to your own offset.
- **Colors** are inline in the query strings: `58A6FF` blue, `A371F7` purple, `3FB950` green, `0D1117` background. Swap the hex values to re-theme everything.
- **Banner** is SVG text — edit `assets/banner.svg` to change the name, subtitle, or the tech chips.
- **Relative image paths** (`./assets/banner.svg`) mean the banner only renders once the `assets` folder is pushed with the README. Don't add it to `.gitignore`.
