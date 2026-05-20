# RideReady

## What This Is

A mobile-first web application that calculates MTB suspension pressure and damping settings based on rider weight, suspension model, and riding style/terrain. Riders can create an account, save up to 3 setups, and access their settings anywhere.

## Core Value

Riders can know exactly what suspension settings to use depending on the terrain, their weight, and their suspension model.

## Current State

| Attribute | Value |
|-----------|-------|
| Type | Application |
| Version | 0.0.0 |
| Status | Prototype |
| Last Updated | 2026-05-20 |

## Requirements

### Core Features

- Calculate suspension pressure and damping settings by selecting model + weight + terrain/ride style
- User account creation with email (collected for marketing)
- Save up to 3 suspension setups per user profile
- View, edit, and delete saved setups
- Mobile-first UI, optimised for outdoor/trail use

### Validated (Shipped)

- [x] Suspension pressure calculator (fork + shock, PSI/bar toggle)
- [x] Custom dropdowns for model selection (RockShox, Fox, DVO, Öhlins, Manitou)
- [x] Ride style selector (XC/Trail, All Mountain, Enduro/DH)
- [x] Damping setup display per model
- [x] Save up to 3 calculations locally (localStorage)
- [x] Edit saved setups (name, weight, models, ride style)
- [x] Light/dark theme toggle
- [x] Saved weight feature

### Active (In Progress)

None yet.

### Planned (Next)

- User auth (Supabase email + password)
- Cloud-synced saved settings (Supabase DB)
- Email collection on signup (for marketing)
- Migrate existing localStorage saves to cloud

### Out of Scope

- iOS/Android native app
- Social/sharing features
- Paid tiers (for now)

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
- Suspension model data already embedded in index.html

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

## Success Metrics

| Metric | Target | Current | Status |
|--------|--------|---------|--------|
| Registered riders | 30 | 0 | Not started |
| Saved setups created | 60+ | 0 | Not started |
| Emails collected | 30 | 0 | Not started |

## Tech Stack / Tools

| Layer | Technology | Notes |
|-------|------------|-------|
| Frontend | Vanilla JS + HTML/CSS | Existing single-file app |
| Auth | Supabase Auth | Email/password, email collected on signup |
| Database | Supabase PostgreSQL | Saved settings per user |
| Hosting | Vercel | Free tier, GitHub deploy |
| Email marketing | TBD (Mailchimp / Klaviyo) | Export from Supabase |

---
*PROJECT.md — Updated when requirements or context change*
*Last updated: 2026-05-20*
