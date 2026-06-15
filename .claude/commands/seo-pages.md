# SEO Pages Scaffold

Scaffold SEO landing pages for RideReady (Phase 11). One page per suspension model, optimised for queries like "RockShox Lyrik setup" or "Fox 36 air pressure calculator."

This skill is a planning and scaffold tool — it outputs the page structure and content strategy. Implementation will modify `vercel.json` routing, create static HTML pages (or a page generator), and ensure the app's SPA rewrite doesn't swallow the SEO routes.

---

## What Phase 11 Involves

**Goal:** Capture organic traffic from riders searching for specific fork/shock setup info. These riders are already in the market — they own the fork, they want settings.

**Target queries:**
- `[brand] [model] setup guide`
- `[brand] [model] air pressure calculator`
- `[brand] [model] sag settings`
- `[brand] [model] [year] suspension setup`

**Page type:** Static or pre-rendered. One page per fork model + one per shock model. ~50–80 pages total across all brands.

---

## Routing Strategy

**Current `vercel.json`** has a catch-all rewrite: `/(.*) → /index.html`. This means any `/suspension/rockshox-lyrik` path gets swallowed into the SPA.

**For SEO pages, two options:**

### Option A — Static HTML files (Recommended for Phase 11)
Create `/suspension/[brand]-[model].html` files. Add specific Vercel routes **before** the catch-all to serve these files directly.

```json
// vercel.json addition:
{
  "source": "/suspension/:page",
  "destination": "/suspension/$page.html"
}
// Must appear BEFORE the catch-all /(.*) route
```

**Pros:** Pure static, Vercel serves from CDN edge, no JS required, Googlebot sees full HTML.  
**Cons:** ~80 files to generate/maintain.

### Option B — Edge/serverless render
Use a Vercel Edge Function at `/suspension/[slug]` to render HTML dynamically from `suspensionData`.

**Pros:** One template, data-driven.  
**Cons:** More complex, cold starts, higher cost at scale.

**Recommendation:** Start with Option A (static generation script), move to Option B if content needs personalisation or data updates too frequently.

---

## Page Template

Each SEO page should include:

```html
<!-- /suspension/rockshox-lyrik.html -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>RockShox Lyrik Setup Guide — Air Pressure, Sag & Damping | RideReady</title>
  <meta name="description" content="Set up your RockShox Lyrik correctly. Air pressure calculator by rider weight, target sag range (25–30%), and damping starting points for XC to Enduro.">
  <link rel="canonical" href="https://rideready.app/suspension/rockshox-lyrik">
  <!-- open graph -->
  <meta property="og:title" content="RockShox Lyrik Setup Guide">
  <meta property="og:description" content="...">
</head>
<body>
  <!-- Nav with link back to app -->
  
  <!-- H1: "[Brand] [Model] Suspension Setup Guide" -->
  <!-- Intro: what this fork is, who rides it, why setup matters -->
  
  <!-- Section: Air Pressure by Weight -->
  <!-- Table: weight range → PSI (pulled from pressure_chart) -->
  <!-- CTA: "Calculate your exact PSI → [open app]" -->
  
  <!-- Section: Target Sag -->
  <!-- sag_percent range, what it means, how to measure -->
  
  <!-- Section: Damping Starting Points -->
  <!-- Rebound, compression clicks by weight range (from damping data) -->
  
  <!-- Section: Common Problems -->
  <!-- Link to Suspension Feel tab in app -->
  
  <!-- Section: About RideReady -->
  <!-- Trust + conversion: free, mobile, works on trail -->
  
  <!-- Footer -->
</body>
</html>
```

---

## Content Strategy

### Title formula
`[Brand] [Model] Setup Guide — Air Pressure, Sag & Damping | RideReady`

### Meta description formula
`Set up your [Brand] [Model] correctly. Air pressure by rider weight, target sag ([min]–[max]%), and damping starting points from XC to Enduro.`

### URL slug formula
`/suspension/[brand-lowercase]-[model-lowercase-hyphenated]`

Examples:
- `/suspension/rockshox-lyrik`
- `/suspension/rockshox-pike`
- `/suspension/fox-36`
- `/suspension/fox-float-x2`
- `/suspension/dvo-diamond`
- `/suspension/ohlins-rxf-36`

### Internal linking
- Every page links to the app with UTM: `/?utm_source=seo&utm_medium=organic&utm_campaign=[slug]`
- Pages cross-link to related models (e.g. Lyrik → Zeb, Pike → Lyrik)
- Homepage links to top 5–10 pages

---

## Implementation Steps

When Phase 11 is planned and approved, the APPLY steps will be:

1. **Write page generator script** (`scripts/generate-seo-pages.js`) — iterates `suspensionData`, outputs one HTML file per model to `/suspension/`

2. **Update `vercel.json`** — add `/suspension/:page` route before the catch-all

3. **Write the template** — static HTML with CSS matching app theme (or a minimal stylesheet), tables from pressure_chart, damping data

4. **Generate all pages** — run the script, commit the output

5. **Add sitemap** (`/sitemap.xml`) — list all `/suspension/*` URLs with `changefreq: monthly`

6. **Add `robots.txt`** — allow all, reference sitemap

7. **Verify Googlebot can see HTML** — use `curl -A Googlebot [url]` to confirm no JS-only rendering

---

## Data Available for Pages

From `suspensionData` in `index.html` (~line 2750):

| Data | Available | Notes |
|------|-----------|-------|
| Model name | Yes | `model` field |
| Brand | Yes | Parent key |
| Pressure chart | Yes | All models |
| Target sag % | Yes | All models |
| Max PSI | Yes | All models |
| Travel options | Yes | Forks — `travel_mm[]` |
| Air spring type | Yes | `air_spring` |
| Damper name | Yes | If `damping` exists |
| Click starting points | Yes | If `damping` exists |
| Year/model generation | No | Not in data — use display name only |
| Weight | No | Rider-provided in app |

---

## Analytics / Conversion Tracking

Add to each SEO page before `</head>`:
```html
<!-- Same Plausible/analytics snippet as index.html if used -->
```

CTA click events to track:
- `seo_cta_click` — rider clicks "Calculate my PSI" from SEO page
- Track `utm_campaign=[slug]` to know which model page converts best

---

## Notes on Single-File Constraint

The current `suspensionData` lives inside `index.html`. For the page generator to access it cleanly:
- Extract `suspensionData` to `suspension-data.json` (already partially done — `mtb_suspension_data.json` in root is a reference copy; confirm it's in sync before using)
- OR parse it from `index.html` in the generator script (fragile, not recommended)
- OR inline the data in the generator directly

Best path: reconcile `mtb_suspension_data.json` with `suspensionData` in `index.html`, then use the JSON file as the source of truth for both the app and the generator.
