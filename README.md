# Military RP Command Dashboard

A modern web dashboard for managing **Roblox** + **Discord** accounts, ranks, points, status, and divisions for Military Roleplay communities.

Designed for **GitHub + Cloudflare Pages + Cloudflare D1** (serverless SQLite).

## Features

- 📋 Member roster (Roblox username/ID + Discord username/ID)
- ⭐ Points system
- 🎖️ Full military rank structure (Recruit → General)
- 🏷️ Status tracking (Active / Inactive / On Leave / Banned)
- 🪖 Divisions (Infantry, Aviation, Armor, Special Forces, Support)
- 🔍 Search & filters
- 📝 Activity log
- ✏️ Add / Edit / Delete members
- 🌙 Dark military-themed UI

## Quick Start (Demo Mode)

1. Open `public/index.html` in a browser **or**
2. Serve the `public` folder with any static server:
   ```bash
   npx serve public
   ```
3. Data is stored in the browser's `localStorage` (Demo Mode).

## Deploy to Cloudflare Pages (Recommended)

### 1. Push to GitHub
```bash
git init
git add .
git commit -m "Initial Military RP Dashboard"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/mil-rp-dashboard.git
git push -u origin main
```

### 2. Create Cloudflare Pages project
1. Go to [Cloudflare Dashboard → Pages](https://dash.cloudflare.com/)
2. **Create a project** → Connect to Git → select your repo
3. Build settings:
   - Framework preset: **None**
   - Build command: *(leave empty)*
   - Build output directory: `public`
4. Deploy

### 3. Create D1 Database
```bash
# Install wrangler if needed
npm install -g wrangler
wrangler login

# Create the database
wrangler d1 create mil-rp-db
```
Copy the `database_id` that is printed.

### 4. Bind D1 to your Pages project
- In Cloudflare Pages → your project → **Settings** → **Functions** → **D1 database bindings**
- Variable name: `DB`
- Database: select `mil-rp-db`

Or edit `wrangler.toml` and add:
```toml
[[d1_databases]]
binding = "DB"
database_name = "mil-rp-db"
database_id = "YOUR_DATABASE_ID"
```

### 5. Run the schema
```bash
wrangler d1 execute mil-rp-db --file=schema.sql
```

### 6. (Optional) Switch frontend to live API
In `public/app.js` change:
```js
const DEMO_MODE = false;
```
Then redeploy. The frontend will call `/api/members` etc.

## Project Structure

```
mil-rp-dashboard/
├── public/
│   ├── index.html      # Main UI
│   ├── styles.css      # Dark military theme
│   └── app.js          # Frontend logic (demo + API ready)
├── functions/
│   └── api/
│       └── members.js  # Example Pages Function (GET/POST)
├── schema.sql          # D1 / SQLite schema + seed data
├── wrangler.toml       # Cloudflare config
└── README.md
```

## Customization

- **Ranks**: Edit the `RANKS` array in `app.js` and the `ranks` table in `schema.sql`
- **Divisions**: Update the `<select>` options in `index.html`
- **Colors / Theme**: Change CSS variables at the top of `styles.css`
- **Auth**: Add Discord OAuth or Cloudflare Access later for staff-only access

## Next Steps You Can Add

- Discord OAuth login (staff only)
- Automatic Roblox avatar / profile lookup
- Points history charts
- Promotion / demotion buttons with confirmation
- Export roster to CSV
- Webhooks to Discord when someone is promoted

---

Built for Military Roleplay communities.  
Deploy free on Cloudflare Pages.
