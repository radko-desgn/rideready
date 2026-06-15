---
phase: 08-setup-history
plan: 01
subsystem: ui
tags: [supabase, history, modal, jsonb]

requires:
  - phase: 03-cloud-saves
    provides: saves table in Supabase

provides:
  - History JSONB column on saves table
  - History modal (hist-backdrop) with ride log and entry form
  - openHistoryModal / submitHistEntry JS functions

affects: future phases that extend the Saved tab

tech-stack:
  added: []
  patterns: [hist-* CSS prefix for history modal classes, modal follows sag-modal pattern]

key-files:
  modified: [index.html]

key-decisions:
  - "Feel options: Perfect / Too stiff / Too soft — predefined only, no free text"
  - "Storage: JSONB array on saves table (append-only)"
  - "History button hidden post-verification — display:none until ready to ship"

patterns-established:
  - "hist-* CSS prefix for history modal classes (matches sag-modal pattern)"

duration: ~30min
completed: 2026-06-15T00:00:00Z
---

# Phase 8 Plan 01: Setup History & Bracketing Log — Summary

**Ride history modal built and wired to Supabase — button hidden on save cards pending soft launch decision.**

## Acceptance Criteria Results

| Criterion | Status | Notes |
|-----------|--------|-------|
| AC-1: History action on save card | Pass | Button present; hidden via `display:none` by user request post-verification |
| AC-2: History modal displays entries | Pass | Reverse-chrono list, colour-coded feel badges, empty state |
| AC-3: Rider can log a new ride entry | Pass | PSI + component + feel → Supabase; card count updates in place |
| AC-4: History persists across sessions | Pass | JSONB stored in Supabase saves table, fetched on renderSaves() |

## Files Modified

| File | Change |
|------|--------|
| `index.html` | Added ~90 lines CSS (`.hist-*` classes), modal HTML shell, history button in save card template, `history` field in saves mapping, 6 JS functions |

## Decisions Made

| Decision | Rationale |
|----------|-----------|
| Feel options: Perfect / Too stiff / Too soft | Predefined only — fast to tap on trail, no keyboard needed |
| JSONB on saves table | Append-only array; consistent with `damping_snapshot` pattern already in use |
| History button hidden post-verification | Feature complete and tested; hidden with `display:none` until ready to surface to riders |
| Reused `relativeTime()` | Function already existed — no duplicate needed |

## Deviations from Plan

| Type | Detail |
|------|--------|
| Scope addition | History button shows entry count (e.g. "Ride history (2)") — added during implementation, not in plan |
| Post-verify hide | User approved the feature then requested it be hidden; `hist-open-btn { display:none }` added |
| No `relativeDate()` added | `relativeTime()` already existed and covered the same need |

## To Unhide

When ready to ship, change one CSS rule in `index.html`:
```css
/* Before */
.hist-open-btn { display: none; }

/* After */
.hist-open-btn {
  display: flex; align-items: center; justify-content: center; gap: 6px;
  width: 100%; padding: 8px; margin-top: 8px;
  border: 1px solid var(--border); border-radius: 8px;
  background: transparent; color: var(--text-secondary); font-size: 12px; cursor: pointer;
}
.hist-open-btn:hover { border-color: var(--fork-accent); color: var(--fork-accent); }
```

## Next Phase Readiness

**Ready:**
- History infrastructure complete — any future enhancement (edit entry, delete entry, export) can build on the existing functions
- Modal follows established pattern — consistent with sag-modal

**Concerns:**
- History for tyre saves not included (localStorage only) — not in scope, note for future
- No limit on history entries per save — could grow large over time; consider capping at 20 entries in a future plan

**Blockers:** None
