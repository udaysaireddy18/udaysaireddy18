# GitHub Profile — source

This folder is the source for **https://github.com/udaysaireddy18/udaysaireddy18**, the repo GitHub renders at the top of the profile, plus the playable **Dino Run** game it links to.

```
README.md                  the profile
assets/hero.svg            animated hero banner (pixel dino scene)
assets/dino-preview.svg    animated preview used in the README card
docs/index.html            landing page (GitHub Pages root)
docs/dino/index.html       the playable Dino Run game (single file)
SETUP.md                   this file
setup.ps1                  re-fills placeholders if you fork this for another account
```

Pages publishes from `main` → `/docs`:

| URL | Serves |
| :--- | :--- |
| `https://udaysaireddy18.github.io/` | `docs/index.html` — link hub |
| `https://udaysaireddy18.github.io/dino/` | the game |

## Republishing

```powershell
git add -A
git commit -m "Update profile"
git push
```

Pages rebuilds on every push to `main` (roughly 30–60 seconds).

## The game

`docs/dino/index.html` is self-contained: no images, no libraries, no build step. Open it straight from disk and it plays.

**Mechanics** — jump physics (gravity `0.70`, impulse `12.4`), speed ramps from 6 to ~12.5 px/frame, cacti spawn with a minimum 36-frame gap so every obstacle is clearable, pterodactyls appear after 240 points and are dodged by ducking, day/night inverts every 500 points, high score in `localStorage`.

Regenerate the banner and preview art (same sprites, same geometry):

```powershell
# the generator lives outside the repo; the SVG rects are hand-tuned to the sprite grid
```

The dino, bird and cactus shapes are defined as ASCII sprite grids (`#` = body) in both the SVG and the game, so edits stay consistent.

## Editing the README

Placeholders were already replaced. If you fork this for another account, run `.\setup.ps1` — it swaps `YOUR_USERNAME`, `Your Name`, `YOUR_EMAIL`, `YOUR_LINKEDIN`, `YOUR_X`, `YOUR_PORTFOLIO` in `README.md` and `assets/hero.svg`.

## Services used

| Service | What it draws |
| :--- | :--- |
| `readme-typing-svg.demolab.com` | animated typing headline |
| `skillicons.dev` + `img.shields.io` | tech icons and badges |
| `github-profile-summary-cards.vercel.app` | summary, per-language cards |
| `streak-stats.demolab.com` | current / longest streak |
| `komarev.com` | profile view counter |
| `capsule-render.vercel.app` | waving footer |

`github-readme-stats`, `github-profile-trophy` and the activity graph are **not** used — their public instances answered `503` / `402` when this was built. Add them back only if the URL renders in a browser tab first.

## Notes

- **Pages won't serve `_`-prefixed folders** (Jekyll). Add an empty `.nojekyll` in `docs/` if you ever add one.
- **Game offline:** the page has zero network requests, so it works from `file://` and offline, like the original.
- **Colors:** `58A6FF` blue, `A371F7` purple, `3FB950` green, `0D1117` background everywhere.
