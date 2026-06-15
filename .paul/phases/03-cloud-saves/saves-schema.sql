-- RideReady: saves table + Row Level Security
-- Run this in Supabase SQL Editor

create table saves (
  id uuid default gen_random_uuid() primary key,
  user_id uuid references auth.users(id) on delete cascade not null,
  name text not null,
  fork_brand text,
  fork_model text,
  shock_brand text,
  shock_model text,
  weight_kg numeric,
  ride_style text,
  damping_snapshot jsonb,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- Enable Row Level Security
alter table saves enable row level security;

-- Users can only read their own saves
create policy "Users can view own saves"
  on saves for select
  using (auth.uid() = user_id);

-- Users can only insert their own saves
create policy "Users can insert own saves"
  on saves for insert
  with check (auth.uid() = user_id);

-- Users can only update their own saves
create policy "Users can update own saves"
  on saves for update
  using (auth.uid() = user_id);

-- Users can only delete their own saves
create policy "Users can delete own saves"
  on saves for delete
  using (auth.uid() = user_id);
