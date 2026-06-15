# RideReady — Available Skills

Print a reference of every Claude Code skill available for the RideReady project, grouped by category.

## What to output

Display the following reference exactly:

---

```
════════════════════════════════════════
RIDEREADY SKILLS
════════════════════════════════════════

APP DOCS
  /features               Regenerate FEATURES.md — full feature summary of the
                          current app version. Run after any phase completes.

DOMAIN KNOWLEDGE
  /suspension-data        Load MTB suspension domain knowledge: PSI formulas,
                          sag physics, damping click conventions, data shape,
                          and how to extend suspensionData with new models.

PHASE 11 SCAFFOLD
  /seo-pages              Load the SEO landing pages brief for Phase 11:
                          URL structure, content strategy, routing approach,
                          and pre-work checklist.

PROJECT MANAGEMENT (PAUL)
  /paul:progress          Show milestone progress and suggest the single next action.
  /paul:plan              Create a PLAN.md for the next phase.
  /paul:apply <path>      Execute an approved PLAN.md file.
  /paul:unify <path>      Close the loop — create SUMMARY.md, update state.
  /paul:milestone         Start a new milestone with defined scope and phases.

════════════════════════════════════════
Tip: run /paul:progress to see where you are in the current milestone.
════════════════════════════════════════
```

---

After printing the reference, check `.paul/STATE.md` and append one line:
`Current phase: [phase name] — [status]`
