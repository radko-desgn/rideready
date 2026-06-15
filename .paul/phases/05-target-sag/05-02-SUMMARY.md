---
phase: 05-target-sag
plan: 02
subsystem: ui
tags: [sag, psi-corrector, modal, fork, shock, live-calculation]

requires:
  - phase: 05-01
    provides: sag modal shell, openSagVerify/closeSagVerify, data-sag-* attrs on ? button

provides:
  - Live PSI corrector inside sag modal (rider enters measured sag → instant PSI adjustment)
  - data-sag-travel-max on ? button for fork mm→% conversion
  - calcSagCorrection() function

affects: Phase 6 (Troubleshoot Tab) — no direct dependency, but sag modal pattern is established

tech-stack:
  added: []
  patterns: [live oninput calculation — no submit button, result updates as user types]

key-files:
  modified: [index.html]

key-decisions:
  - "1 PSI per 1% sag deviation — roadmap spec, simple and consistent for riders"
  - "Live oninput (no Calculate button) — trail-side use, rider needs instant feedback"
  - "travelMax stored on backdrop dataset — avoids re-reading button after modal opens"

patterns-established:
  - "data-* on trigger → stored on modal container → read by calculation function"

duration: ~20min
completed: 2026-06-15T00:00:00Z
---

# Phase 5 Plan 02: PSI Corrector Summary

**Live PSI corrector added to sag modal — rider types measured sag (mm for forks, % for shocks) and instantly sees how much pressure to add or remove.**

## Performance

| Metric | Value |
|--------|-------|
| Duration | ~20 min |
| Completed | 2026-06-15 |
| Tasks | 1 completed |
| Files modified | 1 |

## Acceptance Criteria Results

| Criterion | Status | Notes |
|-----------|--------|-------|
| AC-1: Fork corrector uses mm input | Pass | travelMax from data-sag-travel-max converts mm → %; unit label shows "mm" |
| AC-2: Shock corrector uses % input | Pass | travelMax null → unit label shows "%", measuredPct used directly |
| AC-3: Within-range shows "looks good" | Pass | `measuredPct >= sagMin && <= sagMax` → green "✓ Sag looks good" |
| AC-4: Input cleared on close/reopen | Pass | closeSagVerify() and openSagVerify() both reset input + result |

## Accomplishments

- Sag modal now completes the full trail-side loop: measure → enter → get PSI correction in one screen
- Fork and shock handled with same function — travelMax presence drives the mm/% branch
- Result is ephemeral (not stored) — intentional, trail-side use only

## Files Created/Modified

| File | Change | Purpose |
|------|--------|---------|
| `index.html` | Modified | `data-sag-travel-max` on button; corrector HTML in modal; CSS for input/result; extended openSagVerify + closeSagVerify; new calcSagCorrection() |

## Decisions Made

| Decision | Rationale | Impact |
|----------|-----------|--------|
| 1 PSI per 1% deviation | Roadmap spec; simple rule riders can understand | May be slightly imprecise for some spring curves, but consistent |
| oninput (live) vs button | Trail-side — rider wants instant feedback while typing | No submit button; result shows/hides as value changes |
| travelMax on backdrop dataset | Avoids needing to pass it through multiple calls | calcSagCorrection() reads from backdrop, not re-reads the button |

## Deviations from Plan

None — plan executed exactly as written.

## Next Phase Readiness

**Ready:**
- Phase 5 complete — sag verification + PSI corrector fully functional
- Phase 6 (Troubleshoot Tab) can start — no dependencies on Phase 5 output

**Concerns:**
- PSI correction rate (1 PSI/1%) is approximate; could be refined per model family in future

**Blockers:**
- None

---
*Phase: 05-target-sag, Plan: 02*
*Completed: 2026-06-15*
