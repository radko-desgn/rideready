# RideReady Feature Summary

Generate a complete, up-to-date feature summary for the RideReady app and write it to `FEATURES.md` in the project root.

## What this command does

1. Read `.paul/PROJECT.md` to get the authoritative list of validated (shipped) features, active work, and planned features
2. Read `.paul/STATE.md` for the current version and milestone status
3. Generate a well-written `FEATURES.md` covering:
   - What RideReady is and who it's for (intro paragraph)
   - All currently shipped features, grouped by category
   - What's being worked on now
   - What's planned next
4. Write the file to `FEATURES.md` at the project root
5. Confirm what was written and note anything that has changed since the last run

## How to keep it current

Run `/features` after any phase completes (after `/paul:unify`) or whenever a significant feature is added or removed. The file always reflects the current state of PROJECT.md — it is generated, not manually maintained.

## Output format for FEATURES.md

Write `FEATURES.md` using this structure:

```markdown
# RideReady — What's Built

> Last updated: [date]  
> Version: [from PROJECT.md Current State table]  
> Status: [from PROJECT.md Current State table]

## What is RideReady?

[2–3 sentence intro: what the app does, who it's for, why it exists. Written for someone discovering the app for the first time. Pull from PROJECT.md "What This Is" and "Core Value" sections.]

## Who is it for?

[1 short paragraph covering the target user from PROJECT.md "Target Users" section. Practical, concrete — e.g. "MTB riders who own quality suspension and want correct settings fast, without guessing."]

## Features

### Suspension Calculator
[List shipped suspension calculator features from Validated section]

### Tyre Pressure
[List shipped tyre features]

### Saves & Account
[List shipped save/auth features]

### Trail-Side Tools
[List Phase 5 + Phase 6 features — sag verification, PSI corrector, Suspension Feel tab]

## In Progress

[Active features from the Active section of PROJECT.md]

## Coming Next

[Planned features — v0.3 items and beyond]

## Tech Stack

[Brief tech summary from PROJECT.md Tech Stack table — one line each]
```

Write real, readable prose for the intro sections. The feature lists can be bullet points. Keep it tight — this file is for humans, not machines.
