# Daily Work – Fight the Boss & Earn Money

A browser-based platform game: **jump** (with double jump), **collect money** (cash/banknotes), and **defeat the boss** by stomping on their head. You can set the **enemy name** and **number of levels** (default 10) before starting.

---

## Start screen

Before playing you can set:

- **Your name** – Shown on the leaderboard when you finish a run. Default: **Player**.
- **Enemy name** – The name used in the hint text (e.g. “Jump on the Boss’s head”). Default: **Boss**.
- **Number of levels** – How many levels to play (1–99). Default: **10**.

Click **Start Game** to begin. The **Leaderboard (Top 10)** on the start screen shows the best scores (stored in your browser).

---

## How to play

1. **Jump & double jump** – **Space**, **W**, or **↑** to jump. You can **jump again once in the air** (double jump). Jump height is limited so you cannot leave the top of the screen.
2. **Collect money** – Touch the **cash / banknotes** to collect them. The bar above the canvas shows money collected / total for the level.
3. **Defeat the boss** – **Jump on the boss’s head** to defeat them. If you touch them from the side, you lose one life.

- **Goal** – Collect all money to finish the level; then press **Space** or **Enter** for the next level. Complete all levels to win.
- **Lives** – You have 3 lives. Losing all lives is game over; press **R** to restart.
- **Restart** – After game over or after beating all levels, press **R** to play again.

---

## Controls

| Action        | Keys                          |
|---------------|--------------------------------|
| Move left     | A or Left arrow                |
| Move right    | D or Right arrow               |
| Jump / double jump | Space, W, or Up arrow    |
| Next level    | Space or Enter (after level complete) |
| Restart       | R (after game over or all levels beat) |

---

## Level design

- **Level count** – Set at start (default 10). Each level has more money to collect.
- **Enemy** – Level 1: 3 enemies, speed 3. Each level: +2 enemies, +1 speed (e.g. level 10: 21 enemies, speed 12).

---

## Leaderboard

- **Score** = levels completed × 10,000 + money collected (higher is better).
- **Local**: If you don’t set up Supabase, the top 10 are saved in your browser (localStorage).
- **Online**: If you set **Supabase** URL and anon key in `index.html`, the leaderboard is shared for everyone (see **DEPLOY_ONLINE.md** for step-by-step deploy + online ranking).
- After **Game Over** or **You beat all levels!**, the overlay shows the top 5; your result is added to the leaderboard automatically.

---

## How to run

- Open **`index.html`** in a modern browser (Chrome, Edge, Safari). No install needed.

---

## Deploy online

The game is a single HTML file (+ optional readme). You can host it for free:

1. **GitHub Pages** – Push the project to a GitHub repo, go to **Settings → Pages**, choose “Deploy from a branch”, select branch (e.g. `main`) and folder **root** or the folder that contains `index.html`, save. Your game will be at `https://<username>.github.io/<repo>/`.
2. **Vercel** – Sign in at [vercel.com](https://vercel.com), click “Add New Project”, import your Git repo or upload the folder. Deploy. You get a URL like `https://<project>.vercel.app`.
3. **Netlify** – Sign in at [netlify.com](https://netlify.com), drag the project folder into “Deploy manually”, or connect a Git repo. You get a URL like `https://<name>.netlify.app`.

- **DEPLOY.md** – static deploy (GitHub Pages / Vercel / Netlify), leaderboard stays local.
- **DEPLOY_ONLINE.md** – 一步一步部署到网上并启用**在线排行榜**（用 Supabase 存数据）。

---

## Technical notes

- Single HTML file with inline CSS and JavaScript, Canvas for graphics.
- **Jump boundary** – The player cannot jump above the top of the play area; position is clamped so the character stays on screen.
- **Leaderboard** – Use Supabase (free) for a shared online leaderboard: set `SUPABASE_URL` and `SUPABASE_ANON_KEY` in `index.html` and run `supabase_leaderboard.sql` in Supabase. See **DEPLOY_ONLINE.md**.

Files: `index.html`, `readme.md`, `DEPLOY.md`, `DEPLOY_ONLINE.md` (一步一步部署+在线排行), `supabase_leaderboard.sql` (Supabase 表结构).
