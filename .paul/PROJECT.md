# RideReady

## What This Is

A mobile-first web application that calculates MTB suspension pressure and damping settings based on rider weight, suspension model, and riding style/terrain. Riders can create an account, save up to 3 setups, and access their settings anywhere.

## Core Value

Riders can know exactly what suspension settings to use depending on the terrain, their weight, and their suspension model — and verify/correct their sag on the trail without guessing.

## Current State

| Attribute | Value |
|-----------|-------|
| Type | Application |
| Version | 0.3.0 |
| Status | In Progress (v0.3 Retention & Growth) |
| Last Updated | 2026-06-15 |

## Requirements

### Core Features

- Calculate suspension pressure and damping settings by selecting model + weight + terrain/ride style
- User account creation with email (collected for marketing)
- Save up to 3 suspension setups per user profile
- View, edit, and delete saved setups
- Mobile-first UI, optimised for outdoor/trail use
- Trail-side sag verification with PSI correction

### Validated (Shipped)

- ✓ Suspension pressure calculator (fork + shock, PSI/bar toggle) — Phase 1
- ✓ Custom dropdowns for model selection (RockShox, Fox, DVO, Öhlins, Manitou) — Phase 1
- ✓ Ride style selector (XC/Trail, All Mountain, Enduro/DH) — Phase 1
- ✓ Damping setup display per model — Phase 1
- ✓ Save up to 3 calculations locally (localStorage) — Phase 1
- ✓ Edit saved setups (name, weight, models, ride style) — Phase 1
- ✓ Light/dark theme toggle — Phase 1
- ✓ Saved weight feature — Phase 1
- ✓ Tyre pressure calculator with brand/model selection and modifiers — Phase 4
- ✓ User auth (Supabase email + password) — Phase 2
- ✓ Cloud-synced saved settings (Supabase DB) — Phase 3
- ✓ Email collection on signup — Phase 2
- ✓ Target sag chip with mm range for forks (% and mm) — Phase 5
- ✓ Sag verify guide modal (3-step, fork + shock) — Phase 5
- ✓ PSI corrector in sag modal (live oninput, 1 PSI/1% deviation) — Phase 5
- ✓ "Suspension Feel" tab — 6 symptom cards with component badges (Fork/Shock/Both) and ordered fixes — Phase 6
- ✓ CLAUDE.md codebase guide, /suspension-data skill, /seo-pages skill — Phase 7
- ✓ Ride history log per saved setup (PSI tried + feel rating, Supabase-backed) — Phase 8 (hidden pending soft launch)
- ✓ Guest mode — try the full calculator without an account; save entry points gated with sign-in prompt — Phase 9

### Active (In Progress)

None.

### Planned (Next)

- Onboarding overlay (3-step, shown once on first use) — Phase 10
- PWA + Offline Mode — Phase 11
- Contextual suspension numbers in Fix It tab (pendingCalc injection) — optional Phase 6 enhancement (deferred)

### Out of Scope

- iOS/Android native app
- Social/sharing features
- Paid tiers (for now)
- Imperial Units Toggle — dropped from v0.3 scope (app uses kg/mm only)

## Target Users

**Primary:** MTB riders (trail, all-mountain, enduro)
- Rides regularly, owns quality suspension
- Uses phone on the trail
- Wants correct settings fast, without guessing

## Constraints

### Technical Constraints

- Free hosting only (Vercel)
- Free database/auth tier (Supabase)
- Mobile-only design priority
- Single-file app (vanilla JS, no build tools) — all logic in index.html

### Business Constraints

- No hard deadline
- Solo project
- Email list to be used for future marketing (Mailchimp / Klaviyo export)

## Key Decisions

| Decision | Rationale | Date | Status |
|----------|-----------|------|--------|
| Supabase for auth + DB | Free tier, no backend server needed, email export built-in | 2026-05-20 | Active |
| Vercel for hosting | Free, deploys from GitHub, zero config | 2026-05-20 | Active |
| Keep vanilla JS | Existing codebase is a single HTML file, no build tools | 2026-05-20 | Active |
| Tyre saves in localStorage | No DB schema needed for tyre data | 2026-06-14 | Active |
| Figma sprite for bike part icons | mask-image + currentColor approach | 2026-06-14 | Active |
| Shocks: % only in sag chip | No stroke_mm in data; mm needs per-bike leverage ratio | 2026-06-15 | Active |
| Fork sag mm uses travel_mm[last] | Max travel value — consistent for all riders | 2026-06-15 | Active |
| Global modal for sag verify | Single #sag-modal-backdrop, data-* attrs carry per-type content | 2026-06-15 | Active |
| PSI correction rate: 1 PSI/1% | Roadmap spec; rough but consistent and easy for riders | 2026-06-15 | Active |
| Fix It title: "Suspension Feel" | More descriptive than "Fix It" — sets context before rider taps | 2026-06-15 | Active |
| Component badge on symptom cards | Fork/Rear Shock/Both visible in collapsed state — rider knows which part before reading | 2026-06-15 | Active |
| sessionStorage for guest flag | Intentional session scope — guest mode clears on browser close, no persistent anonymous state | 2026-06-15 | Active |
| Account settings group hidden for guests | Log out and Delete account are meaningless for guests — hide the whole group, not just the user card | 2026-06-15 | Active |

## Success Metrics

| Metric | Target | Current | Status |
|--------|--------|---------|--------|
| Registered riders | 30 | 0 | Not started |
| Saved setups created | 60+ | 0 | Not started |
| Emails collected | 30 | 0 | Not started |

## Tech Stack / Tools

| Layer | Technology | Notes |
|-------|------------|-------|
| Frontend | Vanilla JS + HTML/CSS | Single-file app |
| Auth | Supabase Auth | Email/password, email collected on signup |
| Database | Supabase PostgreSQL | Saved settings per user |
| Hosting | Vercel | Free tier, GitHub deploy |
| Email marketing | TBD (Mailchimp / Klaviyo) | Export from Supabase |

---
*PROJECT.md — Updated when requirements or context change*
*Last updated: 2026-06-15 after Phase 9*
