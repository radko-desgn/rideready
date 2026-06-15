# Research: Comparable Calculation Apps — UI Patterns

**Date:** 2026-06-08
**Source:** Training knowledge synthesis (WebSearch unavailable)
**Scope:** Sports/gear calculation apps — how they display results, handle saved setups, surface modifiers

---

## Key patterns by sector

### Native mobile (iOS / Android)
- Card = atomic unit. Name top-left, secondary meta below, primary numbers large, secondary small
- Inline rename via tap-to-edit (auto-select-all text on focus)
- Swipe-left to reveal Delete — no modal needed if undo toast available
- Slot indicator as pill at top of list ("2 of 5 slots used")
- Load vs. View: button label should say "Load into Calculator" not just "Load"

### Web apps / PWA
- Touch targets minimum 48×48dp (WCAG 2.5.5) — 32px action buttons are too small
- Skeleton cards on load (3 placeholders before Supabase resolves) — eliminates layout jump
- Optimistic delete (remove card immediately, re-insert on API failure)
- Empty state needs: icon + title + subtitle + CTA button ("Go to Setup")
- Sub-tab switcher benefit from animated sliding indicator (CSS transform transition)

### Data-dense sports apps (Strava, Wahoo, Garmin, Karoo)
- Metrics row: 2–3 columns of large numbers, tiny label below, divider between rows
- Colour coding is semantically locked per component — never swap for aesthetics
- Range bar should show position within recommended range, not % of max
- Abbreviated model names on card, full name on press-and-hold
- Relative timestamp under name ("Last loaded Jun 1") adds trust

### Constraint-driven UX (max-3 / slot-based)
- Slot metaphor > list metaphor for N≤3. Destiny 2 loadouts, Figma pinned pages use this
- Always render all 3 slots — empty ones as dashed-border placeholders
- "Replace which?" bottom sheet when all slots full — much better than error message
- "Active slot" indicator (green pill, dot, filled icon) shows what's currently loaded
- Distinct visual anchor per slot: coloured left-edge stripe, emoji tag, or colour picker

### Micro-interactions
- Save: scale-down button press + card slides in (200–250ms)
- Delete: `translateX(100%) + opacity:0` then height collapse — prevents sibling jump
- Load button: shows "Loaded ✓" for 1 second
- Nav badge: scale-bounce animation on count change
- Haptic feedback via `navigator.vibrate()` (10ms save, double pulse delete)
