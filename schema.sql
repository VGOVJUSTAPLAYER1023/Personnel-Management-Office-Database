-- D1 / SQLite schema for Military Roleplay Dashboard
-- Run with: wrangler d1 execute mil-rp-db --file=schema.sql

CREATE TABLE IF NOT EXISTS members (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  roblox_username TEXT NOT NULL UNIQUE,
  roblox_id TEXT,
  discord_username TEXT,
  discord_id TEXT UNIQUE,
  rank TEXT NOT NULL DEFAULT 'Recruit',
  points INTEGER NOT NULL DEFAULT 0,
  status TEXT NOT NULL DEFAULT 'Active',
  division TEXT DEFAULT 'Infantry',
  join_date TEXT DEFAULT (datetime('now')),
  last_seen TEXT,
  notes TEXT,
  created_at TEXT DEFAULT (datetime('now')),
  updated_at TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS ranks (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL UNIQUE,
  level INTEGER NOT NULL,
  points_required INTEGER DEFAULT 0,
  color TEXT DEFAULT '#4a7c59'
);

CREATE TABLE IF NOT EXISTS activity_log (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  member_id INTEGER,
  action TEXT NOT NULL,
  points_change INTEGER DEFAULT 0,
  performed_by TEXT,
  created_at TEXT DEFAULT (datetime('now')),
  FOREIGN KEY (member_id) REFERENCES members(id)
);

INSERT OR IGNORE INTO ranks (name, level, points_required, color) VALUES
  ('Recruit', 1, 0, '#6b7280'),
  ('Private', 2, 50, '#4b5563'),
  ('Private First Class', 3, 120, '#374151'),
  ('Corporal', 4, 250, '#1f2937'),
  ('Sergeant', 5, 400, '#065f46'),
  ('Staff Sergeant', 6, 600, '#047857'),
  ('Sergeant First Class', 7, 900, '#059669'),
  ('Master Sergeant', 8, 1300, '#10b981'),
  ('First Sergeant', 9, 1800, '#34d399'),
  ('Sergeant Major', 10, 2500, '#6ee7b7'),
  ('Lieutenant', 11, 3200, '#3b82f6'),
  ('Captain', 12, 4500, '#2563eb'),
  ('Major', 13, 6000, '#1d4ed8'),
  ('Colonel', 14, 8000, '#1e40af'),
  ('General', 15, 12000, '#f59e0b');

INSERT OR IGNORE INTO members (roblox_username, roblox_id, discord_username, discord_id, rank, points, status, division) VALUES
  ('ExampleSoldier1', '123456789', 'SoldierOne#0001', '111111111111111111', 'Sergeant', 450, 'Active', 'Infantry'),
  ('ExamplePilot', '987654321', 'AcePilot#0420', '222222222222222222', 'Lieutenant', 3400, 'Active', 'Aviation'),
  ('NewRecruit99', '555555555', 'FreshMeat#9999', '333333333333333333', 'Recruit', 10, 'Active', 'Infantry');
