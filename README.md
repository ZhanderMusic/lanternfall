# Lanternfall

A tower defense roguelike with incremental progression. Moths, beetles, wisps and worse come down the forest trail at night. Hang lanterns to stop them, pick a boon after every wave, and bring embers home to grow stronger for the next run.

**Play:** https://zhandermusic.github.io/lanternfall/

## Install it as an app

- **iPhone / iPad (Safari):** open the link, tap the Share button, then **Add to Home Screen**.
- **Android (Chrome):** open the link, then tap **Install app** (or menu ⋮ → **Add to Home screen**).
- **Desktop (Chrome / Edge):** open the link and click the install icon in the address bar.

Once installed it runs full screen and works offline.

## Features

- 12 lanterns, including 3 Season 1 exclusives (Moonwell, Hollow Bell, Eclipse)
- 21 worlds, each with its own look, rule twist and new foe, grouped into collections
- Campaign (20 waves) and Endless mode, where the world shifts every 5 waves
- Limited-time events with their own world, currency and free 25-tier pass (Halloween: the Hollow Harvest)
- Randomly generated trails every run
- Boons in five rarities earned with boon XP, 67 camp upgrades, two upgrade paths per lantern, mastery 1–100 and ascensions
- Player levels, moonstones, a shop with daily featured skins, and a 100-tier Season 1 pass
- Skins from Common to Exotic (plus limited Event skins) with effects that grow with rarity

## Saves

Progress is saved in your browser on each device. To move it between devices (or between this app and the Claude version), use **Settings → Export save** and **Import save**.

## Files

| File | What it is |
|---|---|
| `index.html` | The whole game in one file |
| `manifest.webmanifest` | App name, icons and colors for installing |
| `sw.js` | Service worker: offline play and updates |
| `icons/` | App icons |

## Releasing an update

1. Replace `index.html` with the new version.
2. Change `CACHE` at the top of `sw.js` (for example `lanternfall-v0.8.1`) so installed copies refresh their offline files.
3. Commit to `main`. GitHub Pages republishes within a minute or two.
