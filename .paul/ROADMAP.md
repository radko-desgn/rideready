# Roadmap: RideReady

## Overview

Starting from a working single-file prototype, evolve RideReady into the best MTB suspension tool — calculators, saves, sag verification, and trail-side troubleshooting. Targeting competitive feature parity with SAGLY/TrailHead and a differentiated UX.

---

## Milestone: v0.1 Initial Release ✓

**Status:** Complete
**Phases:** 4 of 4

| Phase | Name | Status | Completed |
|-------|------|--------|-----------|
| 1 | Project Setup & Hosting | Done | 2026-05 |
| 2 | User Auth (Supabase) | Done | 2026-05 |
| 3 | Cloud-Synced Saved Settings | Done | 2026-05 |
| 4 | Polish & Launch | Done | 2026-06 |

---

## Milestone: v0.2 Core Differentiators 🚧

**Status:** In Progress
**Phases:** 2 of 3

Theme: The features that make RideReady more than a calculator — sag verification riders can do on the trail, a cheat sheet for when something feels wrong, and Claude skill setup to speed up all future dev.

| Phase | Name | Plans | Status | Completed |
|-------|------|-------|--------|-----------|
| 5 | Target Sag & Verification | 2/2 | ✅ Complete | 2026-06-15 |
| 6 | Troubleshoot Tab | 1/1 | ✅ Complete | 2026-06-15 |
| 7 | Skills Foundation | TBD | 🔵 Next | - |

### Phase 5: Target Sag & Verification ✅

Focus: After PSI calc, show target sag as % (by ride style) and in mm (calculated from travel/stroke). Add collapsible "Verify your sag" 3-step guide. Mini-adjuster: rider enters measured sag mm → app suggests PSI correction (~1 PSI per 1% sag deviation).
Plans: 2/2 complete

### Phase 6: Troubleshoot Tab ✅

Focus: "Suspension Feel" tab (4th nav item) with 6 expandable symptom cards — "Harsh on small bumps", "Bottoms out", "Dives under braking", "Feels dead / packs down", "Rear kicks on square edges", "Vague front end in corners". Each symptom shows 3 ordered fixes with component badge (Fork/Shock/Both). Trail-side cheat sheet — works offline.
Note: Contextual numbers (pendingCalc injection) deferred as optional enhancement.
Plans: 1/1 complete

### Phase 7: Skills Foundation

Focus: Create `suspension-data` Claude Code skill (formulas, sag targets, damping conventions, tyre data extracted from codebase), generate `CLAUDE.md` from final codebase, scaffold `seo-pages` skill for later. Done last so it reflects the finished product accurately.
Plans: TBD (defined during /paul:plan)

---

## Milestone: v0.3 Retention & Growth (Planned)

| Phase | Name | Status |
|-------|------|--------|
| 8 | Setup History & Bracketing Log | Not started |
| 9 | PWA + Offline Mode | Not started |
| 10 | Imperial Units Toggle | Not started |

---

## Milestone: v0.4 Discovery & Community (Planned)

| Phase | Name | Status |
|-------|------|--------|
| 11 | SEO Landing Pages per Model | Not started |
| 12 | Community Setups | Not started |

---

*Roadmap updated: 2026-06-15*
