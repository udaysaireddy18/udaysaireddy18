# GitHub Profile — source

This folder is the source for **https://github.com/udaysaireddy18/udaysaireddy18**, the repo GitHub renders at the top of the profile.

The live terminal lives in a second repo, **`udaysaireddy18.github.io`**, so it gets a clean URL:

| URL | Serves |
| :--- | :--- |
| `https://github.com/udaysaireddy18` | the profile README |
| `https://udaysaireddy18.github.io/` | interactive terminal site |

```
README.md                  the profile
assets/hero.svg            terminal banner (matrix rain, glitch name)
setup.ps1                  re-fills placeholders if you fork this for another account
SETUP.md                   this file
```

## Republishing

Profile README:

```powershell
git add -A
git commit -m "Update profile"
git push
```

Terminal site — in `..\udaysaireddy18.github.io`:

```powershell
git add -A
git commit -m "Update site"
git push
```

Pages rebuilds on every push to `main` (roughly 30–60 seconds).

## The terminal site

`index.html` in the site repo is a single self-contained file: no images, no libraries, no build step.

Commands: `whoami`, `about`, `projects`, `stack`, `contact`, `matrix`, `ls`, `cat`, `date`, `sudo`, `exit`, `help`, `clear`.

Keyboard: `↑`/`↓` history, `Tab` completion, `Ctrl+L` clear. On mobile the terminal goes full-screen.

The `#matrix` canvas is a plain `<canvas>` rain loop behind the panel; `matrix` toggles its opacity. The command engine is exposed as `window.__shell` so a headless harness can drive it.

## The banner

`assets/hero.svg` is hand-generated SVG:

- terminal chrome, prompt block (`$ whoami`, `$ cat role.txt`), status line
- glitched name — three stacked text layers with RGB-split keyframes
- matrix-rain panel (17 columns, 10-line blocks, 4.2–9.6s per column) clipped to its frame
- scanlines, status bar, blinking caret

Text and colors are editable directly; the rain is a set of `<tspan>` columns inside animated `<g>` wrappers.

## Editing the README

Placeholders were already replaced. If you fork this for another account, run `.\setup.ps1` — it swaps `YOUR_USERNAME`, `Your Name`, `YOUR_EMAIL`, `YOUR_LINKEDIN`, `YOUR_X`, `YOUR_PORTFOLIO` in `README.md` and `assets/hero.svg`.

## Services used

| Service | What it draws |
| :--- | :--- |
| `readme-typing-svg.demolab.com` | animated terminal headline |
| `skillicons.dev` + `img.shields.io` | tech icons and badges |
| `github-profile-summary-cards.vercel.app` | summary and per-language cards (`theme=merko`) |
| `streak-stats.demolab.com` | current / longest streak |
| `komarev.com` | profile view counter |
| `capsule-render.vercel.app` | waving footer |

`github-readme-stats`, `github-profile-trophy` and the activity graph are **not** used — their public instances answered `503` / `402` when this was built. Add them back only if the URL renders in a browser tab first.

`chartreuse-dark` is not a valid summary-card theme (it silently falls back to a white card); `merko` is the dark-green one that actually works.

## Notes

- **Pages for this repo is disabled on purpose.** GitHub only serves a user site from a repo named `<username>.github.io`; the profile repo would have been stuck at `/udaysaireddy18/`.
- **Banner edits** are plain SVG — no build step, no image tooling.
- **Colors:** `3FB950` green, `7EE787` bright green, `050807` background, `14432A` lines.
