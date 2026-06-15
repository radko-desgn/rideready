# Project State

## Project Reference

See: .paul/PROJECT.md (updated 2026-06-15)

**Core value:** Riders can know exactly what suspension settings to use depending on terrain, weight, and suspension model — and troubleshoot suspension feel on the trail without guessing.
**Current focus:** v0.3 Retention & Growth — Phase 9 complete, Phase 10 (Onboarding) next

## Current Position

Milestone: v0.3 Retention & Growth
Phase: 10 of 11 — Onboarding (not yet started)
Plan: Not started
Status: Ready to plan Phase 10
Last activity: 2026-06-15 — Phase 9 (Guest Mode) complete and unified

Progress:
- v0.3 Retention & Growth: [██████░░░░] 60%
- Phase 9: [██████████] 100% ✅

## Loop Position

Current loop state:
```
PLAN ──▶ APPLY ──▶ UNIFY
  ✓        ✓        ✓     [Phase 9 complete — ready for Phase 10]
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

### Deferred Issues

- Contextual numbers in Suspension Feel tab (inject pendingCalc values) — optional enhancement
- History for tyre saves — localStorage only, not in scope for Phase 8
- History entry limit (no cap currently) — consider capping at 20 entries in future
- History soft launch — button hidden; unhide `#hist-open-btn` when ready

### Blockers/Concerns

None.

### Git State

Last commit: 88df3d8
Branch: main
Note: Phase 9 + History (Phase 8) changes not yet committed

## Session Continuity

Last session: 2026-06-15
Stopped at: Phase 9 complete. Phase 10 plan exists at .paul/phases/10-onboarding/10-01-PLAN.md
Next action: /paul:apply .paul/phases/10-onboarding/10-01-PLAN.md

---
*STATE.md — Updated after every significant action*
