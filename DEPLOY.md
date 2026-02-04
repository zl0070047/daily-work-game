# Deploy “Daily Work – Fight the Boss & Earn Money” online

The game is static (one `index.html`). You can deploy it to any static host. Below are three free options.

---

## 1. GitHub Pages

1. Create a **GitHub** account if you don’t have one.
2. Create a **new repository** (e.g. `daily-work-game`). Do not add a README if the folder already has files.
3. In your project folder, run:
   ```bash
   git init
   git add index.html readme.md DEPLOY.md
   git commit -m "Add game"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/daily-work-game.git
   git push -u origin main
   ```
   Replace `YOUR_USERNAME` and `daily-work-game` with your GitHub username and repo name.
4. On GitHub: **Settings → Pages**.
5. Under **Source**, choose **Deploy from a branch**.
6. Branch: **main** (or **master**), folder: **/ (root)**. Save.
7. After 1–2 minutes, the game is at:  
   **https://YOUR_USERNAME.github.io/daily-work-game/**

---

## 2. Vercel

1. Sign in at [vercel.com](https://vercel.com) (GitHub login is fine).
2. Click **Add New… → Project**.
3. **Import** your Git repository (push the game to GitHub first, then connect it), or use **Upload** and drag the folder with `index.html`.
4. Click **Deploy**. No build settings needed.
5. Your game URL: **https://your-project-name.vercel.app**

---

## 3. Netlify

1. Sign in at [netlify.com](https://netlify.com).
2. **Add new site → Deploy manually**: drag the folder that contains `index.html` into the upload area.  
   Or **Import from Git** and connect your GitHub repo.
3. Deploy. The site URL will be like **https://random-name.netlify.app**. You can change it in **Site settings → Domain management**.

---

## Notes

- **Leaderboard**: Stored in the browser (localStorage). Each player’s device keeps its own top 10. To have one shared leaderboard for everyone, you’d need a backend (e.g. Firebase or Supabase).
- **HTTPS**: GitHub Pages, Vercel, and Netlify serve over HTTPS by default, so the game runs the same as locally.
