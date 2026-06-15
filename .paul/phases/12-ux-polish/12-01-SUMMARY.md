---
phase: 12-ux-polish
plan: 01
subsystem: ui
tags: [ux, auth, navigation, settings, vanilla-js, css]

requires:
  - phase: 09-guest-mode
    provides: isGuest flag, enterGuestMode(), openAuthFromGuest()
  - phase: 10-onboarding
    provides: stable auth screen baseline

provides:
  - Consistent nav label ("Feel") aligned with "Suspension Feel" section header
  - Auth screen with readable 80px logo and visible guest entry CTA
  - Settings guest banner as CSS component with Log In / Create account buttons

affects: [12-02-save-flow]

tech-stack:
  added: []
  patterns:
    - CSS class for settings guest banner (replaces inline styles)
    - Auth guest row uses .auth-divider pattern already established in the auth form

key-files:
  modified: [index.html]

key-decisions:
  - "Nav label 'Feel' not 'Suspension' — shorter, still descriptive, matches wrench icon tone"
  - "Auth logo 80px not 140px — auth card is compact; 140px is onboarding scale"
  - ".auth-guest-row border-top removed — divider text replaces it, cleaner visual separation"
  - "Settings guest CTA uses two equal-weight buttons (log in / create account) not a single CTA"

patterns-established:
  - ".settings-guest-cta-btn.primary pattern: orange background, black text — reusable for future guest CTAs in other tabs"

duration: 1 session
started: 2026-06-15T00:00:00Z
completed: 2026-06-15T00:00:00Z
---

# Phase 12 Plan 01: UX Polish — Nav, Auth Screen, Settings Guest State

**Three visible UX inconsistencies fixed: nav/content naming aligned, auth screen branded + guest entry promoted to secondary button, Settings guest dead-end replaced with a two-button sign-in prompt.**

## Performance

| Metric | Value |
|--------|-------|
| Duration | 1 session |
| Tasks | 3 auto + 1 checkpoint |
| Files modified | 1 (index.html) |
| Lines changed | ~40 (CSS + HTML) |

## Acceptance Criteria Results

| Criterion | Status | Notes |
|-----------|--------|-------|
| AC-1: Nav and content name aligned | Pass | Nav reads "Feel"; tab header still "Suspension Feel" |
| AC-2: Auth logo readable, guest entry visible | Pass | Logo 80px; "Browse as guest" is outlined secondary button with divider |
| AC-3: Settings — guests see sign-in CTA | Pass | CSS-classed banner with Log In + Create account buttons |

## Accomplishments

- Bottom nav fourth tab renamed "Feel" — no more mismatch with "Suspension Feel" section header
- Auth logo 48px → 80px — brand moment lands better on first visit
- "Continue as guest" dim text link → "Browse as guest" full-width outlined button, separated by an "or continue without an account" divider
- Settings guest banner stripped of all inline styles, rebuilt as `.settings-guest-banner` CSS component with two CTA buttons wired to `openAuthFromGuest('login')` and `openAuthFromGuest('signup')`

## Deviations from Plan

| Type | Count | Impact |
|------|-------|--------|
| Auto-fixed | 1 | Minor — no scope impact |
| Scope additions | 0 | — |
| Deferred | 0 | — |

**Total impact:** One small auto-fix; plan executed as written.

### Auto-fixed

**1. `.auth-guest-row` border-top removed**
- Found during: Task 2
- Issue: Plan added an `.auth-divider` text element above the guest row, making the CSS `border-top: 1px solid var(--border)` on `.auth-guest-row` a visual duplicate
- Fix: Changed `.auth-guest-row` CSS to `margin-top: 4px` only (no border) so divider text is the sole separator
- Verification: Only one visual separator visible in auth screen

## Next Phase Readiness

**Ready:**
- Phase 12 Plan 01 complete — foundation for Plan 02 (save strip + empty states)
- `openAuthFromGuest()` function confirmed working from Settings guest CTAs
- `.settings-guest-cta-btn.primary` CSS pattern available for reuse in Plan 02 if needed

**Concerns:**
- None

**Blockers:**
- None

---
*Phase: 12-ux-polish, Plan: 01*
*Completed: 2026-06-15*
