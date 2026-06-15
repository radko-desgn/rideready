---
phase: 06-troubleshoot-tab
plan: 01
subsystem: ui
tags: [troubleshoot, accordion, symptom-cards, fix-it-tab, trail-side]

requires:
  - phase: 05-target-sag
    provides: global modal pattern, switchTab() structure, tab-panel/nav-btn system

provides:
  - Fix It 4th tab with 6 expandable symptom cards
  - SYMPTOM_FIXES data array (6 symptoms × 3 fixes + component tags)
  - renderFixitTab() lazy renderer + toggleSymptom() accordion
  - Trail-side suspension troubleshooting cheat sheet (static)

affects: Phase 6-02 (contextual numbers build on SYMPTOM_FIXES and pendingCalc)

tech-stack:
  added: []
  patterns: [lazy tab rendering — guard flag prevents re-render on revisit, one-open accordion via openSymptomId global]

key-files:
  modified: [index.html]

key-decisions:
  - "Title 'Suspension Feel' preferred over 'Fix It' — more descriptive of what the section does"
  - "Component badge (Fork / Rear Shock / Fork & Shock) added at checkpoint — tells rider which part to reach for before reading fixes"
  - "Fixes ordered: quickest/most impactful trailside adjustment first, workshop fix last"
  - "Lazy render with fixitRendered guard — renderFixitTab() only runs once, no re-render on tab revisit"

patterns-established:
  - "SYMPTOM_FIXES data array with component field — extensible without touching render logic"
  - "One-open accordion via openSymptomId — opening a new card closes the previous"

duration: ~25min
completed: 2026-06-15T00:00:00Z
---

# Phase 6 Plan 01: Troubleshoot Tab (Static Cheat Sheet) Summary

**"Suspension Feel" tab added as 4th nav item — 6 expandable symptom cards with component badges and ordered fixes, rendered lazily on first open.**

## Performance

| Metric | Value |
|--------|-------|
| Duration | ~25 min |
| Completed | 2026-06-15 |
| Tasks | 2 completed + 1 checkpoint approved |
| Files modified | 1 |

## Acceptance Criteria Results

| Criterion | Status | Notes |
|-----------|--------|-------|
| AC-1: Fourth tab appears in bottom nav | Pass | `nav-fixit` button between Saved and Settings, equal width (flex: 1) |
| AC-2: Tapping Fix It shows 6 symptom cards | Pass | All 6 collapsed cards visible on first open |
| AC-3: Tapping a symptom expands its fixes | Pass | Accordion: open one → previous closes; toggle on re-tap |
| AC-4: Fix content is accurate and complete | Pass | All 6 symptoms present, 3 ordered fixes each, expanded detail copy |
| AC-5: Tab renders lazily (only on first open) | Pass | `fixitRendered` guard prevents re-render on revisit |

## Accomplishments

- Trail-side cheat sheet tab fully functional — riders can open Fix It mid-ride and get ordered fixes in 2 taps
- Component badges (Fork / Rear Shock / Fork & Shock) added at checkpoint — immediate visual cue for which part to adjust
- Fix copy expanded beyond plan spec: each detail explains *why* the adjustment works, not just what to do
- Accordion UX: opening a symptom auto-closes any previously open card; single scroll position

## Files Created/Modified

| File | Change | Purpose |
|------|--------|---------|
| `index.html` | Modified | CSS (fixit-* rules), HTML (tab panel + nav button), JS (SYMPTOM_FIXES, renderFixitTab, toggleSymptom, switchTab hook) |

## Decisions Made

| Decision | Rationale | Impact |
|----------|-----------|--------|
| Title: "Suspension Feel" not "Fix It" | More descriptive — sets expectation before rider taps a card | Better first impression, especially for new riders unfamiliar with the section |
| Component badge on each card | Rider needs to know "is this my fork or shock?" before reading fixes | Reduced cognitive load — component context visible in collapsed state |
| Fixes ordered: quickest trailside first | Trail-side use means no tools for most fixes — volume spacers come last | Aligns with real-world usage; most riders will fix in 30 seconds, not at a workshop |
| lazy render guard | No reason to rebuild DOM on every tab visit | Avoids unnecessary re-renders in single-file vanilla JS context |

## Deviations from Plan

### Summary

| Type | Count | Impact |
|------|-------|--------|
| Scope additions | 2 | UX improved — added at checkpoint |

### Scope Additions (at checkpoint)

**1. Title changed to "Suspension Feel"**
- **Why:** Rider feedback at checkpoint — "Suspension Feel" more clearly sets context for what's in the tab
- **Impact:** Minor copy change only, no functional impact

**2. Component badges added to each symptom card**
- **Why:** Without "Fork" / "Rear Shock" labels, riders would need to open a card before knowing which component is relevant — especially on a mid-ride screen
- **Implementation:** Added `component` field to SYMPTOM_FIXES; rendered as a small uppercase label below the symptom name; new `.fixit-card-meta`, `.fixit-card-component` CSS classes
- **Impact:** SYMPTOM_FIXES now has a `component` field — 06-02 contextual numbers can use this to filter enrichment by component type

## Next Phase Readiness

**Ready:**
- `SYMPTOM_FIXES` array is the data layer for 06-02 — `component` field already in place
- `pendingCalc` (set after calculate) is available globally for contextual enrichment
- Tab renders correctly, accordion proven to work
- `renderFixitTab()` designed to be extended — contextual numbers can be injected by modifying the fix render inside

**Concerns:**
- `renderFixitTab()` uses `fixitRendered` guard — 06-02 will need to either reset this guard when `pendingCalc` changes, or re-render contextual text without full re-render

**Blockers:**
- None — ready for 06-02 (contextual numbers) or Phase 7 if 06-02 is deprioritised

---
*Phase: 06-troubleshoot-tab, Plan: 01*
*Completed: 2026-06-15*
