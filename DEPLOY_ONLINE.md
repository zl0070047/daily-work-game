# 一步一步部署到网上（含在线排行榜）

按下面顺序做，就能把游戏部署到网上，并让所有人看到**同一份在线排行榜**。

---

## 第一步：注册 Supabase（免费，用来存排行榜）

1. 打开浏览器，访问：**https://supabase.com**
2. 点击右上角 **Start your project**，用 GitHub 或邮箱注册并登录。
3. 登录后点击 **New Project**：
   - **Name**：随便填，例如 `daily-work-game`
   - **Database Password**：设一个密码并**记住**（以后改设置会用到）
   - **Region**：选离你近的（如 Singapore）
   - 点击 **Create new project**，等一两分钟创建完成。

---

## 第二步：创建排行榜表

1. 在 Supabase 项目里，左侧点 **SQL Editor**。
2. 点 **New query**，把本仓库里的 **`supabase_leaderboard.sql`** 文件内容**全部复制**进去。
3. 点右下角 **Run**（或按 Ctrl+Enter）。
4. 看到 “Success. No rows returned” 就表示表建好了。

---

## 第三步：拿到 Supabase 的 URL 和 Key

1. 在 Supabase 左侧边栏最下方点 **Project Settings**（齿轮图标 ⚙️）。
2. 在设置页左侧再点 **API**。
3. 在页面里找到并复制这两个值（后面会填进游戏里）：

   - **Project URL**  
     在页面靠上的 **Configuration** 区域里，有一行 **Project URL**，复制整段（类似 `https://xxxxxxxx.supabase.co`）。

   - **anon key（公钥）**  
     往下滚动到 **Project API keys** 区域，会看到一列表格或两行 key：
     - 第一行通常写 **anon** 或 **public**，后面有一串很长的字符（以 `eyJ` 开头），复制这串，就是 **SUPABASE_ANON_KEY**。
     - 下面一行是 **service_role**（有时写 secret），**不要**复制这个，不能放在网页里。

   如果界面上没有写 “anon” 两个字，就找 **Project API keys** 里**上面那一行**、很长的那串 key（以 `eyJ` 开头），用那个即可。

---

## 第四步：把 URL 和 Key 填进游戏

1. 用编辑器打开项目里的 **`index.html`**。
2. 在文件里搜索：**`YOUR_SUPABASE_URL`**。
3. 把下面两行的引号里的占位符，换成你在第三步复制的真实值：

   ```javascript
   var SUPABASE_URL = 'https://xxxxxxxx.supabase.co';   // 换成你的 Project URL
   var SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6...';   // 换成你的 anon key
   ```

4. 保存 `index.html`。

---

## 第五步：把项目放到 GitHub（方便后面部署）

1. 如果还没有 GitHub 账号，先去 **https://github.com** 注册。
2. 登录后点击右上角 **+** → **New repository**。
3. **Repository name** 填：`daily-work-game`（或你喜欢的名字）。
4. 选 **Public**，不要勾选 “Add a README”，然后点 **Create repository**。
5. 在电脑上打开终端（或 Cursor 里的终端），进入你的游戏文件夹，执行（把 `你的用户名` 换成你的 GitHub 用户名）：

   ```bash
   cd "你的游戏所在文件夹路径"
   git init
   git add index.html readme.md DEPLOY.md DEPLOY_ONLINE.md supabase_leaderboard.sql
   git commit -m "Daily Work game with online leaderboard"
   git branch -M main
   git remote add origin https://github.com/你的用户名/daily-work-game.git
   git push -u origin main
   ```

   如果提示要登录 GitHub，按提示用浏览器或令牌登录即可。

---

## 第六步：选一种方式部署到网上

任选其一即可。

### 方式 A：Vercel（推荐，最简单）

1. 打开 **https://vercel.com**，用 GitHub 登录。
2. 点击 **Add New…** → **Project**。
3. 在列表里选中你刚创建的 **daily-work-game** 仓库，点 **Import**。
4. **Project Name** 不用改，直接点 **Deploy**。
5. 等几十秒，部署完成后会给你一个地址，例如：  
   **https://daily-work-game.vercel.app**  
   点进去就是你的游戏，排行榜已是**在线**的（所有人看到同一份）。

### 方式 B：Netlify

1. 打开 **https://netlify.com**，用 GitHub 登录。
2. 点击 **Add new site** → **Import an existing project**，选 **GitHub**，授权后选择 **daily-work-game** 仓库。
3. **Branch** 选 `main`，**Build settings** 不用改（发布目录留空即可），点 **Deploy site**。
4. 部署完成后会有一个地址，例如：  
   **https://xxxxx.netlify.app**  
   点进去即可玩游戏，排行榜在线。

### 方式 C：GitHub Pages

1. 在 GitHub 上打开你的 **daily-work-game** 仓库。
2. 点 **Settings** → 左侧 **Pages**。
3. 在 **Source** 里选 **Deploy from a branch**。
4. **Branch** 选 **main**，**Folder** 选 **/ (root)**，点 **Save**。
5. 等 1～2 分钟，你的游戏地址是：  
   **https://你的用户名.github.io/daily-work-game/**  
   排行榜同样是在线的。

---

## 完成之后

- 把上面的游戏链接发给朋友，他们打开就能玩，并且**排行榜是同一份**（在线）。
- 若你改了代码或只改了 `index.html` 里的 Supabase 配置，只需再执行：
  ```bash
  git add .
  git commit -m "update"
  git push
  ```
  Vercel / Netlify 会自动重新部署；GitHub Pages 也会在几分钟内更新。

---

## 常见问题

- **看不到 anon / 不知道复制哪个 key？**  
  在 **Project Settings → API** 页面，往下找到 **Project API keys**。有的版本只显示两把钥匙图标或两行，上面一行是「公开的、可放在网页里」的 key，下面一行是 service_role（不要用）。复制**上面那一行**整串（以 `eyJ` 开头的长字符串）即可，那就是 anon key。

- **排行榜不更新？**  
  检查 `index.html` 里的 `SUPABASE_URL` 和 `SUPABASE_ANON_KEY` 是否和 Supabase 里 **Project URL**、**anon key** 完全一致（没有多余空格）。

- **打开页面是空白？**  
  确认访问的是部署后的链接（如 `https://xxx.vercel.app`），并且仓库里已经包含修改后的 `index.html`（已 push 到 GitHub）。

- **不想用 Supabase？**  
  不填 URL 和 Key（保持 `YOUR_SUPABASE_URL` / `YOUR_SUPABASE_ANON_KEY`），游戏仍可正常玩，排行榜会退成本地（仅自己浏览器可见）。
