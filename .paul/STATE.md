# Project State

## Project Reference

See: .paul/PROJECT.md (updated 2026-06-15)

**Core value:** Riders can know exactly what suspension settings to use depending on terrain, weight, and suspension model — and verify/correct their sag on the trail.
**Current focus:** v0.2 Core Differentiators — Troubleshoot Tab (Phase 6)

## Current Position

Milestone: v0.2 Core Differentiators
Phase: 6 of 7 (Troubleshoot Tab) — Not started
Plan: None
Status: Ready to plan
Last activity: 2026-06-15 — Phase 5 complete, transitioned to Phase 6

Progress:
- v0.2 Core Differentiators: [███░░░░░░░] 33%
- Phase 6: [░░░░░░░░░░] 0%

## Loop Position

Current loop state:
```
PLAN ──▶ APPLY ──▶ UNIFY
  ○        ○        ○     [Phase 6 — awaiting /paul:plan]
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
| Damping recs already shipped | v0.2 audit | Phase dropped — buildDampingHTML() fully implemented |
| Skills Foundation moved to last | v0.2 planning | Build features first, document after |
| Shocks: % only in sag chip | Phase 5-01 | No stroke_mm in data; mm needs per-bike leverage ratio |
| Fork sag mm uses travel_mm[last] | Phase 5-01 | Max travel value — consistent for all riders |
| Global modal for sag verify | Phase 5-01 | Single #sag-modal-backdrop, data-* attrs carry per-type content |
| PSI correction rate: 1 PSI/1% | Phase 5-02 | Roadmap spec; rough but consistent and easy to understand |

### Deferred Issues

None.

### Blockers/Concerns

None.

### Git State

Last commit: a1c7ac4
Branch: ux/improvements
Feature branches merged: none

## Session Continuity

Last session: 2026-06-15
Stopped at: Phase 5 complete — sag verify + PSI corrector fully functional; transitioned to Phase 6
Next action: /paul:plan for Phase 6 (Troubleshoot Tab)
Resume file: .paul/ROADMAP.md

---
*STATE.md — Updated after every significant action*
