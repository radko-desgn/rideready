# Project State

## Project Reference

See: .paul/PROJECT.md (updated 2026-06-15)

**Core value:** Riders can know exactly what suspension settings to use depending on terrain, weight, and suspension model — and troubleshoot suspension feel on the trail without guessing.
**Current focus:** v0.4 Polish & Growth — Phase 12 (UX Polish) in planning

## Current Position

Milestone: v0.4 Polish & Growth
Phase: 12 of 15 — UX Polish (Planning)
Plan: 12-01 created, awaiting approval
Status: PLAN created, ready for APPLY
Last activity: 2026-06-15 — Created .paul/phases/12-ux-polish/12-01-PLAN.md

Progress:
- v0.4 Polish & Growth: [░░░░░░░░░░] 0%
- Phase 12: [░░░░░░░░░░] 0%

## Loop Position

Current loop state:
```
PLAN ──▶ APPLY ──▶ UNIFY
  ✓        ○        ○     [Plan 12-01 created, awaiting approval]
```

## Accumulated Context

### Decisions

| Decision | Phase | Impact |
|----------|-------|--------|
| Supabase for auth + DB | Init | Drives phases 2 & 3 |
| Vercel for hosting | Init | Drives phase 1 |
| Stay vanilla JS, no build tools | Init | Keeps all phases in single index.html |
| Tyre saves in localStorage | Phase 4 | No DB schema needed for tyre data |
| Figma sprite for bike part icons | Phase 4 | mask-image + currentColor approach |
| Shocks: % only in sag chip | Phase 5-01 | No stroke_mm in data |
| Fork sag mm uses travel_mm[last] | Phase 5-01 | Max travel value — consistent |
| Global modal for sag verify | Phase 5-01 | Single #sag-modal-backdrop, data-* attrs |
| PSI correction rate: 1 PSI/1% | Phase 5-02 | Rough but consistent |
| Fix It title: "Suspension Feel" | Phase 6-01 | More descriptive |
| Component badge on symptom cards | Phase 6-01 | Fork/Rear Shock/Both visible collapsed |
| Contextual numbers deferred | Phase 6-01 | pendingCalc injection not yet wired |
| Imperial Units Toggle dropped | v0.3 scope | App uses kg/mm only |
| History: predefined feel options only | Phase 8-01 | Perfect / Too stiff / Too soft — no free text |
| History: JSONB on saves table | Phase 8-01 | Append-only array, consistent with damping_snapshot |
| History button hidden post-verify | Phase 8-01 | Feature complete; hidden via display:none until soft launch |
| sessionStorage for guest flag | Phase 9-01 | Guest mode clears on browser close — intentional session scope |
| Account settings group hidden for guests | Phase 9-01 | Log out + Delete account hidden; Appearance stays |
| cachedSaves cleared on guest entry | Phase 9-01 | Prevents prior account data leaking into guest view |
| Onboarding: 4 steps not 3 | Phase 10-01 | Weight/ride-style collection step needed for applyOnbProfile() personalisation |
| Onboarding: animated HTML mockups | Phase 10-01 | Real-data CSS animations build trust; rider familiar with UI before first use |
| Onboarding: Skip = completeOnboarding() | Phase 10-01 | Sets rr_onboarded — prevents re-showing after skip |
| Onboarding animation cycle: 6.3s | Phase 10-01 | Slowed from 4.5s so user can read each element as it appears |
| Nav "Fix It" → "Feel" | Phase 12-01 | Aligns with "Suspension Feel" section header — less confusing for returning riders |
| Auth guest entry: secondary button not text link | Phase 12-01 | Valid entry path should have visible affordance |

### Deferred Issues

- Contextual numbers in Suspension Feel tab (inject pendingCalc values) — optional enhancement
- History for tyre saves — localStorage only, not in scope for Phase 8
- History entry limit (no cap currently) — consider capping at 20 entries in future
- History soft launch — button hidden; unhide `#hist-open-btn` when ready
- PWA + Offline Mode — deferred from v0.3

### Blockers/Concerns

None.

### Git State

Last commit: daa27ae (feat(10-onboarding))
Branch: ux/improvements
Note: Phase 12 Plan 01 changes pending — no new commits yet

## Session Continuity

Last session: 2026-06-15
Stopped at: Phase 12 Plan 01 created. UX audit completed; 6 issues identified, first 3 addressed in this plan.
Next action: Review and approve plan, then run /paul:apply .paul/phases/12-ux-polish/12-01-PLAN.md
Resume file: .paul/phases/12-ux-polish/12-01-PLAN.md

---
*STATE.md — Updated after every significant action*
