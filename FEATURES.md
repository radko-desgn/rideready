# RideSetup — What's Built

> Last updated: 2026-07-05
> Version: 0.4.0
> Status: In Progress (v0.5 Discovery — Phase 14 SEO)

## What is RideSetup?

RideSetup is a mobile-first MTB suspension calculator that takes your weight, fork or shock model, and riding style and gives you a recommended air pressure, target sag, and damping starting points — no guesswork, no spreadsheets. It covers the five major suspension brands (RockShox, Fox, DVO, Öhlins, Manitou) and is designed to be useful on the trail, not just at a desk. The core idea: riders who know exactly what settings to run ride faster and with more confidence.

## Who is it for?

MTB riders who ride regularly, own quality suspension, and are done guessing at settings. The target rider is somewhere between trail and enduro — they care about dialling in their bike, they have their phone on the trail, and they want correct numbers fast. RideSetup works equally well for riders setting up a new fork for the first time and for experienced riders who want a calibrated starting point after changing their weight or terrain.

---

## Features

### Suspension Calculator

- Select fork and/or shock by brand and model (RockShox, Fox, DVO, Öhlins, Manitou)
- Enter rider weight → get recommended air pressure (PSI)
- Ride style selector: XC / Trail, All Mountain, Enduro / DH
- Damping starting points (rebound, LSC, HSC clicks) per model and ride style
- Click adjusters automatically adapt to rider weight
- Damping settings shift based on selected ride style delta

### Tyre Pressure

- Tyre pressure calculator with brand and model selection
- Rider weight input at the top of the tyre form for fast entry
- **Riding style selector** (XC / Trail / Enduro / DH) — auto-syncs to the selected tyre's category, user can override; drives a separate set of front/rear pressure charts per style (up to 12 PSI difference between XC and DH)
- Pressure modifiers: terrain type, rider style, tyre inserts, mullet setup
- Front and rear pressures calculated separately
- Tyre pressure saves (stored locally per device)

### Saves & Account

- Email + password sign-up and login (Supabase Auth)
- Google Sign-In
- **Forgot password flow** — email magic link via Supabase Auth
- Cloud-synced suspension setups — save up to 3 per account
- View, edit, and delete saved setups
- Saved weight carried across sessions
- Ride history log per saved setup: PSI tried and feel rating (Perfect / Too stiff / Too soft) — built, hidden pending soft launch

### Trail-Side Tools

- **Target sag chip** — fork results show sag as % and mm (e.g. 25–30% · 37–45 mm), shock shows % only
- **Sag verify guide** — tap `?` on any sag chip to open a 3-step measurement guide for fork or shock
- **PSI corrector** — inside the verify guide, enter your measured sag to get instant "↑ Add X PSI" or "↓ Remove X PSI" feedback (~1 PSI per 1% deviation)
- **Suspension Feel tab** — 6 expandable symptom cards with Icons8 icons, each with 3 ordered fixes and a component badge (Fork / Rear Shock / Fork & Shock):
  - Harsh on small bumps
  - Bottoms out
  - Dives under braking
  - Feels dead / packs down
  - Rear kicks on square edges
  - Vague front end in corners

  Quickest trailside fix is always listed first. Works fully offline.

### Access & UX

- **Guest mode** — full calculator access without creating an account; save entry points show a sign-in prompt
- **Onboarding** — animated walkthrough shown once on first use: welcome screen → live real-UI demos for fork/shock, tyre, and saves (with ghost cursor and camera-follow animations) → weight + ride style profile setup → chip flow demo. Profile values written to calculator on completion. Skippable, never shown again.
- **Desktop shell layout** — proper multi-panel layout on wider screens
- **Floating-label selectors** — brand and model dropdowns use floating labels
- **Privacy policy** — dedicated privacy.html page
- Light / dark theme toggle (icons adapt to both themes)
- Mobile-first layout, optimised for one-handed trail use
- iOS zoom fix — inputs stay at 16px to prevent auto-zoom

### SEO & Discoverability *(pending merge — PR #9)*

- Optimised title, meta description, Open Graph and Twitter Card tags
- JSON-LD structured data: WebApplication + FAQPage schemas
- Canonical URL
- `robots.txt` (allows all crawlers including AI bots — OAI-SearchBot, PerplexityBot, ClaudeBot)
- `sitemap.xml`
- `llms.txt` for AI search indexing
- Security headers via Vercel (X-Content-Type-Options, X-Frame-Options, Referrer-Policy)
- Google Analytics 4 snippet (GA4 Measurement ID placeholder — needs replacing before tracking activates)

---

## In Progress

- SEO optimisation (PR #9 open — ready to merge to main)

## Coming Next

- **Replace GA4 placeholder** — get Measurement ID from analytics.google.com and update `G-XXXXXXXXXX` in `index.html`
- **SEO Landing Pages per model** (Phase 14) — dedicated pages per suspension model for organic search
- PWA + Offline Mode (Phase 11, deferred) — installable as a home screen app, key calculator features available without a network connection
- Contextual suspension numbers in Suspension Feel tab (inject current pendingCalc values into fix suggestions) — deferred from Phase 6
- Ride history soft launch — unhide the history entry point on save cards

---

## Tech Stack

| Layer | Technology |
|-------|------------|
| Frontend | Vanilla JS + HTML/CSS — single file (`index.html`) |
| Auth | Supabase Auth (email/password + Google OAuth) |
| Database | Supabase PostgreSQL (cloud saves, ride history) |
| Hosting | Vercel (free tier, GitHub deploy) |
| Icons | Icons8 ios11 PNG (Suspension Feel tab), Font Awesome (CDN) |
| Analytics | Google Analytics 4 (snippet present, awaiting Measurement ID) |

---

*Generated by `/features` — re-run after any phase completes to keep this file current.*
