# Project State

## Project Reference

See: .paul/PROJECT.md (updated 2026-06-15)

**Core value:** Riders can know exactly what suspension settings to use depending on terrain, weight, and suspension model — and troubleshoot suspension feel on the trail without guessing.
**Current focus:** v0.4 Polish & Growth — Phase 12 (UX Polish) ✅ complete, transitioning to Phase 13

## Current Position

Milestone: v0.4 Polish & Growth
Phase: 13 of 15 — Suspension Data Expansion (Not started)
Plan: None — ready for /paul:plan
Status: Phase 12 closed, ready to begin Phase 13
Last activity: 2026-06-15 — Phase 12 UNIFY complete (Plan 12-02 closed)

Progress:
- v0.4 Polish & Growth: [█████░░░░░] 50%
- Phase 13: [░░░░░░░░░░] 0%

## Loop Position

Current loop state:
```
PLAN ──▶ APPLY ──▶ UNIFY
  ○        ○        ○     [Phase 13 not yet started]
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
| Nav "Feel" (was "Fix It") | Phase 12-01 | Aligns with "Suspension Feel" section header |
| Auth logo 80px (not 140px) | Phase 12-01 | Auth card is compact; 140px is onboarding scale |
| Auth guest row: divider text replaces border-top | Phase 12-01 | Cleaner visual separation; no duplicate border |
| Settings guest: two equal CTAs (log in / create account) | Phase 12-01 | Both paths equally visible for guest conversion |
| Save strip animation: CSS-only @keyframes | Phase 12-02 | No JS needed; class-toggle fires animation naturally |
| Empty slots as <button> elements | Phase 12-02 | Semantic, keyboard-accessible, no extra JS needed |

### Deferred Issues

- Contextual numbers in Suspension Feel tab (inject pendingCalc values) — optional enhancement
- History for tyre saves — localStorage only, not in scope for Phase 8
- History entry limit (no cap currently) — consider capping at 20 entries in future
- History soft launch — button hidden; unhide `#hist-open-btn` when ready
- PWA + Offline Mode — deferred from v0.3

### Blockers/Concerns

None.

### Git State

Last commit: c570ba8 (fix(12-ux-polish): nav naming, auth screen, settings guest UX)
Branch: ux/improvements

## Session Continuity

Last session: 2026-06-15
Stopped at: Phase 12 fully complete (both plans done). Phase 13 Suspension Data Expansion is next.
Next action: /paul:plan for Phase 13 — Suspension Data Expansion
Resume file: .paul/phases/13-suspension-data/

---
*STATE.md — Updated after every significant action*
