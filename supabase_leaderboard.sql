-- Run this in Supabase Dashboard → SQL Editor → New query
-- Creates the leaderboard table and allows public read + insert (no delete/update from game)

create table if not exists public.leaderboard (
  id uuid default gen_random_uuid() primary key,
  name text not null,
  score bigint not null,
  created_at timestamptz default now()
);

alter table public.leaderboard enable row level security;

-- Allow anyone to read (for ranking)
create policy "Allow public read leaderboard"
  on public.leaderboard for select
  using (true);

-- Allow anyone to insert (submit score)
create policy "Allow public insert leaderboard"
  on public.leaderboard for insert
  with check (true);

-- Optional: allow delete only for authenticated users (you can run DELETE in SQL Editor if needed)
-- By default anonymous users cannot delete or update rows.
