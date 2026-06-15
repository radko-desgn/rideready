# Summary: Phase 3, Plan 1 — Cloud-Synced Saves

**Status:** Complete
**Completed:** 2026-05-22

## What Was Built

- `saves` table in Supabase with Row Level Security (users see only their own rows)
- `renderSaves()` rewritten as async — queries Supabase, caches results in `cachedSaves`
- `confirmSave()` INSERT (new) or UPDATE (edit) via Supabase with `user_id` from `currentUser`
- `deleteSave(id)` calls Supabase DELETE by UUID
- `startEditName(id)` reads from `cachedSaves` (no extra DB call)
- `onAuthStateChange` sets `currentUser = session.user` and triggers `renderSaves()` on login
- `localStorage` removed for saves; theme and weight-pin remain in localStorage

## Decisions Made

- Full model object reconstructed on load via `findModel(brand, modelName, type)` — model data lives in `suspensionData`, not Supabase
- `damping_snapshot` JSONB stores only computed PSI + damping clicks (not the full model object)
- UUID IDs quoted in onclick handlers to parse correctly as strings
- `cachedSaves` array kept in sync after every mutation so `updateSaveTrigger()` works without extra DB calls

## Acceptance Criteria

- [x] AC-1: Saves persist in Supabase per user — same saves appear on refresh and on other devices
- [x] AC-2: Max 3 saves enforced — 4th save is blocked
- [x] AC-3: RLS enforced — users only see their own rows
- [x] AC-4: Edit and delete work against Supabase and persist on refresh

## Ready For

Phase 4 — Polish & Launch
