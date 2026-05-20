# Summary: Phase 1, Plan 1 — Project Setup & Hosting

**Status:** Complete
**Completed:** 2026-05-20

## What Was Built

- `.gitignore` and `vercel.json` added to project root
- Code pushed to GitHub: https://github.com/radko-desgn/rideready
- App deployed to Vercel: https://rideready-two.vercel.app
- Supabase project created: https://vhvfbsqivfmqcmqhibpq.supabase.co
- Supabase JS SDK loaded via CDN in index.html
- Supabase client initialised with project URL + anon key

## Decisions Made

- Switched git remote from SSH to HTTPS (SSH keys not configured on this machine)
- Vercel account created with alternate email due to auth issues with primary email
- Supabase anon key embedded directly in index.html (safe — protected by RLS in Phase 2)

## Acceptance Criteria

- [x] AC-1: App live at https://rideready-two.vercel.app
- [x] AC-2: Supabase SDK loaded, `supabaseClient` defined in console
- [x] AC-3: Client initialised with project credentials

## Ready For

Phase 2 — User Auth (Supabase)
