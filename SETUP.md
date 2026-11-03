# GitHub Profile — source

This folder is the source for **https://github.com/udaysaireddy18/udaysaireddy18**, the repo GitHub renders at the top of the profile.

The playable game and landing page live in a second repo, **`udaysaireddy18.github.io`**, so they get clean URLs:

| URL | Serves |
| :--- | :--- |
| `https://udaysaireddy18.github.io/` | landing page / link hub |
| `https://udaysaireddy18.github.io/dino/` | the Dino Run game |

```
README.md                  the profile
assets/hero.svg            animated hero banner (pixel dino scene)
assets/dino-preview.svg    animated preview used in the README card
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

Game / site — in `..\udaysaireddy18.github.io`:

```powershell
git add -A
git commit -m "Update site"
git push
```

Pages rebuilds on every push to `main` (roughly 30–60 seconds).

## The game

`dino/index.html` in the site repo is self-contained: no images, no libraries, no build step. Open it straight from disk and it plays — same as the original offline page.

**Mechanics** — jump physics (gravity `0.70`, impulse `12.4`), speed ramps from 6 to ~12.5 px/frame, cacti spawn with a minimum 36-frame gap so every obstacle is clearable, pterodactyls appear after 240 points and are dodged by ducking, day/night inverts every 500 points, high score in `localStorage`.

The dino, bird and cactus shapes are ASCII sprite grids (`#` = body) shared by the SVG art and the game, so edits stay consistent. `window.__dino` exposes a small debug API (`state`, `score`, `nearest`, `threat`, `jump()`, `duck()`) that a headless test drives to check collisions and spacing — the run that shipped survived 60 simulated seconds at 2259 points.

## Editing the README

Placeholders were already replaced. If you fork this for another account, run `.\setup.ps1` — it swaps `YOUR_USERNAME`, `Your Name`, `YOUR_EMAIL`, `YOUR_LINKEDIN`, `YOUR_X`, `YOUR_PORTFOLIO` in `README.md` and `assets/hero.svg`.

## Services used

| Service | What it draws |
| :--- | :--- |
| `readme-typing-svg.demolab.com` | animated typing headline |
| `skillicons.dev` + `img.shields.io` | tech icons and badges |
| `github-profile-summary-cards.vercel.app` | summary and per-language cards |
| `streak-stats.demolab.com` | current / longest streak |
| `komarev.com` | profile view counter |
| `capsule-render.vercel.app` | waving footer |

`github-readme-stats`, `github-profile-trophy` and the activity graph are **not** used — their public instances answered `503` / `402` when this was built. Add them back only if the URL renders in a browser tab first.

## Notes

- **Pages for this repo is disabled on purpose.** GitHub only serves a user site from a repo named `<username>.github.io`; the profile repo would have been stuck at `/udaysaireddy18/`.
- **Banner edits** are plain SVG — the dino is a set of `<rect>`s generated from the sprite grid, so text and colors are editable by hand.
- **Colors:** `58A6FF` blue, `A371F7` purple, `3FB950` green, `0D1117` background everywhere.
