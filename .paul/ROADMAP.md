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
**Phases:** 1 of 3

Theme: The features that make RideReady more than a calculator — sag verification riders can do on the trail, a cheat sheet for when something feels wrong, and Claude skill setup to speed up all future dev.

| Phase | Name | Plans | Status | Completed |
|-------|------|-------|--------|-----------|
| 5 | Target Sag & Verification | 2/2 | ✅ Complete | 2026-06-15 |
| 6 | Troubleshoot Tab | TBD | 🔵 Next | - |
| 7 | Skills Foundation | TBD | Not started | - |

### Phase 5: Target Sag & Verification ✅

Focus: After PSI calc, show target sag as % (by ride style) and in mm (calculated from travel/stroke). Add collapsible "Verify your sag" 3-step guide. Mini-adjuster: rider enters measured sag mm → app suggests PSI correction (~1 PSI per 1% sag deviation).
Plans: 2/2 complete

### Phase 6: Troubleshoot Tab

Focus: Third tab ("Fix It") with symptom cards — "Harsh on small bumps", "Bottoms out", "Dives under braking", "Feels dead / packs down", "Rear kicks on square edges", "Vague front end in corners". Each symptom maps to 1–3 ordered fixes. If a setup is loaded, fixes reference the rider's actual current numbers. Trail-side cheat sheet — works offline.
Data: JSON symptom→remedies map, easy to extend without touching logic.
Plans: TBD (defined during /paul:plan)

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
