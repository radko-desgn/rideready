# Research: Saved Data UI Best Practices (Mobile-First, Small-Slot Systems)

**Date:** 2026-06-08
**Source:** Training knowledge synthesis (WebSearch unavailable)
**Scope:** Saved items / profiles UX — card design, actions, empty states, slot systems, quick-scan

---

## 1. Card design — what to surface
- Name: 16–18px semibold, truncate at one line. Primary differentiator.
- 2–3 key values that differ between setups (not everything). For suspension: fork travel + shock tune.
- Relative timestamp: "Last used 2 days ago"
- Visual accent: colour chip or left-border stripe for pattern-matching
- Optimal card height: 72–88px (name + one row of chips + timestamp)
- With 3 items, don't compress — use generous padding

## 2. Actions: load / rename / delete
- With ≤3 items: inline icon buttons (fully discoverable, no hidden patterns)
- Rename: small pencil icon top-right
- Delete: small trash icon top-right
- Load: prominent full-width CTA button at card bottom ("Load this setup")
- After load: card shows "Active" state — coloured border, filled badge, changed button label

## 3. Empty states
- Formula: simple illustration + action headline ("Save your first setup") + 1–2 line value prop + CTA button
- State capacity explicitly: "You have 3 save slots available"
- Best pattern: show all 3 slots as ghost/dashed cards — slot 1 actionable, 2 and 3 greyed

## 4. Slot-based system
- Ghost placeholder cards > "0 / 3" count badge — communicates capacity visually
- Disable Save button when all 3 slots full; show toast: "Delete one to save a new setup"
- When full and user wants to save: "Replace which setup?" bottom sheet listing 3 options with timestamps
- Count badge in header ("2/3") as secondary info alongside placeholders

## 5. Quick-scan patterns
- Auto-assign colour to each save on creation (cycle palette of 6–8)
- Surface the most differentiating spec value at slightly larger weight
- Keep card order stable — don't reorder by last-used unless opted in

## 6. Destructive actions
- Simple confirmation modal: "Delete 'Trail Setup'? This can't be undone." + Cancel + Delete (red)
- Name the item explicitly — never generic "Are you sure?"
- Undo toast (5 sec) is an alternative if persistence is reliable
- Type-to-confirm is overkill for saved setups — reserve for account deletion only

## 7. Load/Apply action clarity
- Explicit "Load Setup" button = unambiguous (recommended)
- "Currently loaded" state on card is critical feedback — green checkmark, "Active" pill, or border change
- If user has unsaved changes when loading: light confirmation "Loading X will replace current values"
- Don't silently auto-save changes back to a named slot

---

## Priority action list for RideReady saved tab
1. Empty slots as dashed-border placeholders (replaces count badge + empty state)
2. "Replace which?" prompt when all 3 full (replaces error/block)
3. Auto select-all text on name edit focus (one line of JS)
4. Card insert/remove animation (200ms CSS transition)
5. "Currently loaded" indicator on active card
6. Relative timestamp under card name
7. Touch target audit — action buttons need ≥40px
