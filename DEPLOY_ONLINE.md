# 一步一步部署到网上（含在线排行榜）

按下面顺序做，就能把游戏部署到网上，并让所有人看到**同一份在线排行榜**。

---

## 中国用户建议（必读）

- **部署站点**：优先用 **GitHub Pages**（方式 A）或 **Cloudflare Pages**（方式 D），国内多数情况可访问、**无需 VPN**。不要用 Vercel，国内常需 VPN 或不稳定。
- **说明**：**Gitee 码云 Pages 已于 2024 年下线**，仓库里不再有「服务 → Gitee Pages」。代码仍可放在 Gitee 托管，但**部署**请用 GitHub Pages 或 Cloudflare Pages。
- **在线排行榜（Supabase）**：Supabase 服务器在国外，国内注册或打开若较慢可多刷新；游戏部署好后，国内玩家打开你的游戏链接一般能正常玩，排行榜可能略慢一两秒属正常。若完全打不开 Supabase，可不填 URL 和 Key，游戏照玩，排行榜仅本地保存。

---

## 第一步：注册 Supabase（免费，用来存排行榜）

1. 打开浏览器，访问：**https://supabase.com**（国外服务，国内打开慢可多等几秒或换时间段）。
2. 点击右上角 **Start your project**，用 GitHub 或邮箱注册并登录。
3. 登录后点击 **New Project**：
   - **Name**：随便填，例如 `daily-work-game`
   - **Database Password**：设一个密码并**记住**（以后改设置会用到）
   - **Region**：选 **Singapore**（离中国近，延迟较低）
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

## 第五步：把项目放到代码托管（GitHub 或 Gitee）

**部署必须用 GitHub 或导入到 Cloudflare**：Gitee 只能托管代码，不能做静态站发布（Gitee Pages 已下线）。推荐把代码推到 **GitHub**，第六步用 **GitHub Pages**（方式 A）或 **Cloudflare Pages**（方式 D）。

### 选项 1：GitHub（推荐，部署用方式 A 或 D）

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

### 选项 2：Gitee 码云（仅托管代码，部署仍需 GitHub 或 Cloudflare）

1. 注册并登录 **https://gitee.com** ，右上角 **+** → **新建仓库**，仓库名填 `daily-work-game`，选 **公开**，不勾选「使用 Readme 文件初始化」，点 **创建**。
2. 在终端进入游戏文件夹，执行（把 `你的gitee用户名` 换成你的 Gitee 用户名）：

   ```bash
   cd "你的游戏所在文件夹路径"
   git init
   git add index.html readme.md DEPLOY.md DEPLOY_ONLINE.md supabase_leaderboard.sql
   git commit -m "Daily Work game with online leaderboard"
   git branch -M main
   git remote add origin https://gitee.com/你的gitee用户名/daily-work-game.git
   git push -u origin main
   ```

3. **Gitee 没有 Pages 了**，要发布网站请把同一份代码再推到 **GitHub**（新增一个 remote 并 push），然后第六步用 **方式 A（GitHub Pages）** 或 **方式 D（Cloudflare Pages）** 部署。

---

## 第六步：选一种方式部署到网上

任选其一即可。**中国用户请优先用方式 A（GitHub Pages）或方式 D（Cloudflare Pages），国内多数情况无需 VPN。**

### 方式 A：GitHub Pages（国内可用，无需 VPN）

1. 在 GitHub 上打开你的 **daily-work-game** 仓库。
2. 点 **Settings** → 左侧 **Pages**。
3. 在 **Source** 里选 **Deploy from a branch**。
4. **Branch** 选 **main**，**Folder** 选 **/ (root)**，点 **Save**。
5. **重要**：确保仓库根目录有 **`.nojekyll`** 文件（空文件即可），用来禁用 Jekyll，否则可能显示 "Hello World" 而不是游戏。如果没有，在本地创建 `.nojekyll`（空文件），然后：
   ```bash
   git add .nojekyll
   git commit -m "Add .nojekyll to disable Jekyll"
   git push
   ```
6. 等 1～2 分钟，你的游戏地址是：  
   **https://你的用户名.github.io/daily-work-game/**  
   （注意：访问的是 `github.io` 域名，不是仓库页面 `github.com`）  
   国内访问一般可用，排行榜在线。

### 方式 B：Netlify

1. 打开 **https://netlify.com**，用 GitHub 登录。
2. 点击 **Add new site** → **Import an existing project**，选 **GitHub**，授权后选择 **daily-work-game** 仓库。
3. **Branch** 选 `main`，**Build settings** 不用改（发布目录留空即可），点 **Deploy site**。
4. 部署完成后会有一个地址，例如：  
   **https://xxxxx.netlify.app**  
   点进去即可玩游戏，排行榜在线。

### 方式 C：Vercel（不推荐国内用户）

国内访问 Vercel 常需 VPN 或不稳定，**中国用户请用方式 A 或 D**。

1. 打开 **https://vercel.com**，用 GitHub 登录。
2. 点击 **Add New…** → **Project**。
3. 在列表里选中你刚创建的 **daily-work-game** 仓库，点 **Import**。
4. **Project Name** 不用改，直接点 **Deploy**。
5. 等几十秒，部署完成后会给你一个地址，例如：  
   **https://daily-work-game.vercel.app**

### 方式 D：Cloudflare Pages（推荐，国内多可访问、无需 VPN）

1. 打开 **https://dash.cloudflare.com** 并登录（无账号可免费注册）。
2. 左侧选 **Workers & Pages** → **Create** → **Pages** → **Connect to Git**。
3. 选 **GitHub**（或 GitHub 授权），选中 **daily-work-game** 仓库，点 **Begin setup**。
4. 在 **Build configuration** 里**务必**这样设（本项目是纯静态，没有构建步骤，否则会报 deploy 错误）：
   - **Framework preset**：选 **None**（不要选 Vue/React 等）。
   - **Build command**：**留空**（不要填 `npm run build`）。
   - **Deploy command**：如果**必须填**，填 `echo "Deploying static site"`（不要填 `npx wrangler deploy`，那是给 Workers 用的，会报错）。如果允许留空就留空。
   - **Build output directory**：**留空**（表示用仓库根目录）。
   - **Path**：填 `/` 或留空；**Branch** 选 **main**。
5. 点 **Save and Deploy**。等 1～2 分钟，会给你一个地址，例如：  
   **https://daily-work-game.xxx.pages.dev**  
   国内多数情况可访问，无需 VPN；在线排行榜照常可用。

6. **绑定自定义域名**（可选）：  
   如果域名在 Cloudflare 管理：
   - 在 Pages 项目页面点 **Custom domains** → **Set up a custom domain**。
   - 输入你的域名（如 `game.yourdomain.com` 或 `yourdomain.com`），点 **Continue**。
   - Cloudflare 会自动添加 DNS 记录（CNAME），等几分钟生效即可。
   
   如果域名不在 Cloudflare：
   - 在域名 DNS 管理里添加 **CNAME** 记录：
     - **Name**：`game`（或 `@` 表示根域名）
     - **Value**：`daily-work-game.pages.dev`（你的 Pages 地址）
   - 然后在 Pages 项目里点 **Custom domains** → **Set up a custom domain**，输入域名，Cloudflare 会验证 DNS 记录。

**说明**：Gitee 码云 **Pages 已于 2024 年下线**，仓库里不再有「服务 → Gitee Pages」。若你代码在 Gitee，可把同一项目再推到 GitHub 后用本页方式 A 或 D 部署。

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

- **中国用户 / 找不到 Gitee Pages？**  
  **Gitee Pages 已于 2024 年下线**，所以仓库里没有「服务 → Gitee Pages」。请改用 **GitHub Pages**（第六步方式 A）或 **Cloudflare Pages**（方式 D）部署。

- **报错 "Failed: error occurred while running deploy command"？**  
  本游戏是**纯静态 HTML**，没有构建步骤。请检查部署平台的 **Build 设置**：  
  - **Cloudflare Pages**（最常见问题）：
    - **Framework preset** 选 **None**。
    - **Build command**：**留空**（不要填任何东西）。
    - **Deploy command**：如果界面**要求必填**，填 `echo "Deploying static site"`（不要填 `npx wrangler deploy`，那是给 Cloudflare Workers 用的，会报错）。如果允许留空就留空。
    - **Build output directory**：留空。
    - **Path**：填 `/` 或留空。
    改完后点 **Save**，然后在 **Deployments** 里点 **Retry** 或重新部署。  
  - **Netlify**：在 Site settings → Build & deploy → Build 里，**Build command** 留空，**Publish directory** 填 `/` 或留空。  
  - **Vercel**：导入时 Framework 选 **Other** 或 **None**，不要选 Next/Nuxt 等；Build 命令留空。  
  改完后在对应平台点 **Retry** 或 **Redeploy**。

- **GitHub Pages 显示 "Hello World" 而不是游戏？**  
  这是因为 GitHub Pages 默认启用了 Jekyll。解决：
  1. 在项目根目录创建 **`.nojekyll`** 文件（空文件即可，我已经帮你创建了）。
  2. 推送这个文件到 GitHub：
     ```bash
     git add .nojekyll
     git commit -m "Add .nojekyll to disable Jekyll"
     git push
     ```
  3. 等 1～2 分钟，刷新你的 Pages 地址（`https://你的用户名.github.io/daily-work-game/`）。
  4. 确认访问的是 **`github.io`** 域名，不是仓库页面 `github.com`。

- **Cloudflare Pages 报错 "An internal error prevented the form from submitting"？**  
  这是 Cloudflare 的临时错误。可以尝试：
  1. **刷新页面**，重新填写配置再提交。
  2. **清除浏览器缓存**，或换一个浏览器/无痕模式试试。
  3. **稍等几分钟**再试（可能是 Cloudflare 服务器临时问题）。
  4. **改用 GitHub Pages**（方式 A，更简单，不需要这些 Build 配置，推荐）：在 GitHub 仓库里点 **Settings → Pages**，Source 选 **Deploy from a branch**，Branch 选 **main**，Folder 选 **/ (root)**，点 **Save** 即可。等 1～2 分钟就能访问。
