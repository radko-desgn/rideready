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

**Status:** Complete
**Phases:** 3 of 3

Theme: The features that make RideReady more than a calculator — sag verification riders can do on the trail, a cheat sheet for when something feels wrong, and Claude skill setup to speed up all future dev.

| Phase | Name | Plans | Status | Completed |
|-------|------|-------|--------|-----------|
| 5 | Target Sag & Verification | 2/2 | ✅ Complete | 2026-06-15 |
| 6 | Troubleshoot Tab | 1/1 | ✅ Complete | 2026-06-15 |
| 7 | Skills Foundation | 1/1 | ✅ Complete | 2026-06-15 |

### Phase 5: Target Sag & Verification ✅

Focus: After PSI calc, show target sag as % (by ride style) and in mm (calculated from travel/stroke). Add collapsible "Verify your sag" 3-step guide. Mini-adjuster: rider enters measured sag mm → app suggests PSI correction (~1 PSI per 1% sag deviation).
Plans: 2/2 complete

### Phase 6: Troubleshoot Tab ✅

Focus: "Suspension Feel" tab (4th nav item) with 6 expandable symptom cards — "Harsh on small bumps", "Bottoms out", "Dives under braking", "Feels dead / packs down", "Rear kicks on square edges", "Vague front end in corners". Each symptom shows 3 ordered fixes with component badge (Fork/Shock/Both). Trail-side cheat sheet — works offline.
Note: Contextual numbers (pendingCalc injection) deferred as optional enhancement.
Plans: 1/1 complete

### Phase 7: Skills Foundation ✅

Focus: Create `suspension-data` Claude Code skill (formulas, sag targets, damping conventions, tyre data extracted from codebase), generate `CLAUDE.md` from final codebase, scaffold `seo-pages` skill for later. Done last so it reflects the finished product accurately.
Plans: 1/1 complete

---

## Milestone: v0.3 Retention & Growth (Planned)

| Phase | Name | Status |
|-------|------|--------|
| 8 | Setup History & Bracketing Log | ✅ Complete |
| 9 | Guest Mode | ✅ Complete |
| 10 | Onboarding | Planning |
| 11 | PWA + Offline Mode | Not started |

> Imperial Units Toggle removed from scope — app uses kg/mm only.

---

## Milestone: v0.4 Discovery & Community (Planned)

| Phase | Name | Status |
|-------|------|--------|
| 11 | SEO Landing Pages per Model | Not started |
| 12 | Community Setups | Not started |

---

### Phase 9: Guest Mode ✅

Focus: "Continue as guest" on the auth screen. Full calculator access without an account. Save entry points gated with sign-in prompts. Saved tab and Settings tab adapted for guest context. Session clears on browser close (sessionStorage).
Plans: 1/1 complete

---

*Roadmap updated: 2026-06-15*
