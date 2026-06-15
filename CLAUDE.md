# RideReady — Codebase Guide

> For Claude Code sessions. Everything needed to work on RideReady without re-deriving context.

## What This Is

RideReady is a mobile-first MTB suspension calculator — riders enter their weight, fork/shock model, and riding style to get recommended PSI and damping settings. All app logic lives in a single `index.html` file: CSS in `<style>`, HTML in `<body>`, JavaScript in `<script>`. No build tools, no npm, no modules.

---

## File Structure

```
index.html              — entire app (CSS + HTML + JS, ~4700 lines)
CLAUDE.md               — this file
FEATURES.md             — human-readable feature summary (regenerate with /features)
vercel.json             — Vercel SPA rewrite (all routes → index.html)
mtb_suspension_data.json — reference copy of suspensionData (not used by app)
bike-parts.png          — Figma sprite for bike part icons (mask-image approach)
bike-parts-transparent.png — alternate sprite
logo.png                — app logo
.paul/                  — PAUL project management (STATE.md, ROADMAP.md, PROJECT.md, phases/)
.claude/commands/       — Claude Code slash commands (/features, /suspension-data, /seo-pages)
```

---

## Data Model

### `suspensionData` (~line 2750)

Global JSON const. Shape:

```js
suspensionData = {
  version: "2.0",
  brands: {
    rockshox: { forks: [Model, ...], shocks: [Model, ...] },
    fox:      { forks: [...], shocks: [...] },
    dvo:      { forks: [...], shocks: [...] },
    ohlins:   { forks: [...], shocks: [...] },
    manitou:  { forks: [...], shocks: [...] },
  }
}
```

**Model object fields:**

| Field | Type | Notes |
|-------|------|-------|
| `model` | string | Display name, e.g. `"Lyrik"` |
| `series` | string | e.g. `"Trail"`, `"XC"`, `"DH"` |
| `travel_mm` | number[] | Available travel options, e.g. `[140, 150, 160]`. Forks only. |
| `air_spring` | string | e.g. `"DebonAir+"`, `"FLOAT EVOL"` |
| `sag_percent` | `{min, max}` | Target sag range, e.g. `{min:25, max:30}` |
| `max_pressure_psi` | number | Upper safe limit |
| `pressure_chart` | PressureEntry[] | Weight → PSI lookup (see below) |
| `formula_psi` | `"weight_lbs"` \| undefined | If present, overrides pressure_chart |
| `damping` | DampingObj \| undefined | Damping adjuster info |
| `volume_spacers_supported` | boolean | Optional |
| `secondary_chamber` | object | Optional — Öhlins, DVO Topaz dual-valve models |
| `setup_notes` | string | Optional — model-specific notes shown in UI |

**PressureEntry:**
```js
{ min_kg: 60, max_kg: 70, min_psi: 85, max_psi: 95 }
// Interpolate linearly within range
```

**DampingObj:**
```js
{
  damper: "Charger 3",           // display name
  rebound?:     ClickAdjuster,
  rebound_lsr?: ClickAdjuster,   // low-speed rebound
  rebound_hsr?: ClickAdjuster,   // high-speed rebound
  lsc?:         ClickAdjuster,   // low-speed compression
  hsc?:         ClickAdjuster,   // high-speed compression
  compression?: { label: string }, // mode label only (e.g. "Open / Pedal / Lock")
  ride_style_adjust?: {
    xc_trail:    { rebound?: delta, lsc?: delta, hsc?: delta },
    all_mountain: { ... },
    enduro_dh:   { ... },
  }
}
```

**ClickAdjuster:**
```js
{
  starting_clicks: [
    { min_kg: 60, max_kg: 80, clicks: 8 },
    ...
  ],
  total_clicks: 18
}
```

**Damper names in the dataset** (from all brands):
- RockShox: Charger 2/2.1, Charger 3, Motion Control, Motion Control Silver/Gold, Kwik-Toggle/TPC, Kwik-Toggle/Motion Control, ABS+ DH, ABS+ Jump Stack, Thru Shaft, Thru Shaft/RCT3, RCT3, Coil
- Fox: GRIP, GRIP2, GRIP2 (Factory/Performance Elite), FIT4, FLOAT DPS, FLOAT X, FLOAT X2, DHX/VAN RC, FLOAT DHX Air
- DVO: D1/D1 SL, D1 SL (DH), VTT-6P (Expert)/TPC+ (Pro), IPA, IPA+HSC, IPA (Incremental Platform Adjust), Jade X/Standard, T3
- Öhlins: Öhlins 36mm TTX Air Cartridge, Öhlins TTX Air Cartridge, TTX Twin-Tube (3 variants)
- Manitou: TPC (Expert)/TPC+ (Pro)

### `tyreData` (~line 2630)

```js
tyreData = {
  brands: {
    maxxis: { models: ["Assegai", "Minion DHF", ...] },
    ...
  },
  modifiers: {
    terrain: { hardpack: -3, mixed: 0, loam: +2, ... },
    rider_style: { ... },
    insert: { none: 0, insert: -3 },
    mullet: { ... }
  }
}
```

### `SYMPTOM_FIXES` (~line 3497)

```js
[{
  id: 'harsh-bumps',
  label: 'Harsh on small bumps',
  icon: 'fa-road-spikes',        // Font Awesome class
  component: 'Fork & Shock',     // 'Fork' | 'Rear Shock' | 'Fork & Shock'
  fixes: [
    { title: 'Reduce high-speed compression (HSC)', detail: '...' },
    ...  // 3 fixes per symptom, ordered: quickest trailside first
  ]
}]
// 6 entries total
```

### `BRAND_LABELS` (~line 2755) and `RS_LABELS` (~line 3180)

```js
const BRAND_LABELS = { rockshox: 'RockShox', fox: 'Fox', dvo: 'DVO', ohlins: 'Öhlins', manitou: 'Manitou' };
const RS_LABELS = { xc_trail: 'XC / Trail', all_mountain: 'All Mountain', enduro_dh: 'Enduro / DH' };
```

---

## Key Functions

### Calculator

| Function | Line | Description |
|----------|------|-------------|
| `calculate()` | ~3082 | Main entry point — reads form, calls `buildResultHTML()`, sets `pendingCalc` |
| `buildResultHTML(brand, model, weightKg, type)` | ~2841 | Builds full result card HTML including sag chip + ? button |
| `computePSI(model, weightKg)` | ~3133 | Returns PSI number — uses `formula_psi` if present, else `interpolatePSI()` |
| `interpolatePSI(chart, weightKg)` | ~2826 | Linear interpolation within matching pressure_chart weight range |
| `buildDampingHTML(model, weightKg, type)` | ~3203 | Builds damping section HTML with all click adjusters |
| `getClicksForWeight(startingClicks, weightKg)` | ~3189 | Finds base clicks for a given weight from ClickAdjuster |
| `applyStyleDelta(clicks, total, delta)` | ~3198 | Applies ride style delta to base clicks, clamped to 0–total |
| `computeDampingSnapshot(model, weightKg)` | ~3140 | Returns compact `{ damper, rebound, lsc, hsc, rideStyle, ... }` for saving |

### Tab System

| Function | Line | Description |
|----------|------|-------------|
| `switchTab(tab)` | ~4025 | Activates `#tab-{tab}` + `#nav-{tab}`; calls `renderSaves()` or `renderFixitTab()` if needed |
| `renderFixitTab()` | ~4036 | Lazy render — populates `#fixit-inner` from `SYMPTOM_FIXES`; runs once (`fixitRendered` guard) |
| `toggleSymptom(id)` | ~4073 | One-open accordion for Fix It cards; closes previous via `openSymptomId` |

**Tabs:** `setup` | `saved` | `fixit` | `settings`
Each tab: `#tab-{name}` panel + `#nav-{name}` button. `.tab-panel.active` and `.nav-btn.active` toggled by `switchTab()`.

**Setup sub-tabs:** `switchSetupSubTab('suspension' | 'tyres')`
**Saved sub-tabs:** `switchSavedSubTab('suspension' | 'tyres')`

### Sag Modal

| Function | Line | Description |
|----------|------|-------------|
| `openSagVerify(btn)` | ~2967 | Reads `data-sag-*` attrs from trigger button, populates modal, opens it |
| `closeSagVerify()` | ~2988 | Removes `.open`, resets corrector input/result |
| `calcSagCorrection()` | ~2996 | Live PSI correction: `deviation = measuredPct - targetMid`; `correction = round(deviation)` |

Trigger button `data-*` attrs: `sag-min`, `sag-max`, `sag-mm` (forks only), `sag-travel-max` (forks only).
Modal backdrop ID: `#sag-modal-backdrop`. Content target: `#sag-modal-body`.

### Saves

| Function | Line | Description |
|----------|------|-------------|
| `renderSaves()` | ~3849 | Async — fetches from Supabase, renders suspension save cards |
| `renderTyreSaves()` | ~4631 | Renders tyre save cards from localStorage |

---

## Global State

| Variable | Line | Type | Description |
|----------|------|------|-------------|
| `pendingCalc` | ~3494 | object \| null | Set after `calculate()` — `{ weightKg, rideStyle, fork?: {brand, model, psi, damping}, shock?: {...} }` |
| `currentUser` | ~3495 | object \| null | Supabase user object; set in `onAuthStateChange` |
| `cachedSaves` | ~3565 | array | Suspension saves fetched from DB |
| `currentRideStyle` | ~3179 | string | `'xc_trail'` \| `'all_mountain'` \| `'enduro_dh'` |
| `fixitRendered` | ~4035 | boolean | Guard — `renderFixitTab()` runs only once |
| `openSymptomId` | ~4072 | string \| null | Currently expanded Fix It accordion card ID |
| `loadedSaveId` | ~3371 | string \| null | Suspension save ID currently loaded into the calculator |
| `editingId` | ~3781 | string \| null | Save ID currently being edited |

---

## Patterns

### Modal Pattern (established Phase 5)
```
Static HTML shell with a single ID (#sag-modal-backdrop)
  ↓
Trigger button has data-* attrs (sag-min, sag-max, sag-mm, sag-travel-max)
  ↓
openX(btn) reads btn.dataset.*, populates modal innerHTML, stores on backdrop.dataset, adds .open class
  ↓
closeX() removes .open, resets inputs
```
Follow this pattern for any new modals — do not create per-card modal instances.

### Lazy Tab Render
```js
let tabRendered = false;
function renderTab() {
  if (tabRendered) return;
  tabRendered = true;
  // ... build DOM
}
```
Used by `renderFixitTab()`. Apply to any new tab with non-trivial DOM.

### Ride Style Delta Calculation
```js
const base = getClicksForWeight(adjuster.starting_clicks, weightKg);
const delta = d.ride_style_adjust?.[currentRideStyle]?.[key] || 0;
const result = applyStyleDelta(base, adjuster.total_clicks, delta);
// Positive delta = more damping; negative = less
```

### PSI Formula Override
```js
if (model.formula_psi === 'weight_lbs') return Math.round(weightKg * 2.2046);
// Otherwise: interpolatePSI(model.pressure_chart, weightKg)
```
Always check for `formula_psi` before using pressure_chart.

---

## Supabase

- Client init: ~line 2626 — `supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY)`
- Auth listener: `supabaseClient.auth.onAuthStateChange(...)` — sets `currentUser`, calls `applyAuthState()`
- Saves table schema:

```js
{
  id:               uuid (PK),
  user_id:          uuid (FK → auth.users),
  name:             string,
  weight_kg:        number,
  ride_style:       string,
  fork_brand:       string | null,
  fork_model:       string | null,
  shock_brand:      string | null,
  shock_model:      string | null,
  damping_snapshot: jsonb  // { fork: {psi, damping}, shock: {psi, damping} }
  created_at:       timestamp,
  updated_at:       timestamp,
}
```

---

## Theming

CSS custom properties (defined in `:root` and `.light`):

| Variable | Purpose |
|----------|---------|
| `--text` | Primary text |
| `--text-secondary` | Secondary text |
| `--text-muted` | Muted/label text |
| `--surface` | Card/panel background |
| `--surface2` | Inset surface (inputs, sub-cards) |
| `--border` | Border color |
| `--orange` | Brand accent (active states, highlights) |
| `--accent` | Teal — used for shock-specific UI elements |
| `--shock-accent` | Alias for teal accent on shock cards |

Dark mode is the default. `.light` class on `<html>` switches to light mode (`toggleTheme()` at ~line 3168).

Never hardcode hex values in new CSS rules — always use a `var(--*)` token.

---

## Brands Covered

| Brand | Key | Forks | Shocks |
|-------|-----|-------|--------|
| RockShox | `rockshox` | SID, Judy, 30, 32, 35, Pike, Lyrik, Zeb, Boxxer | Deluxe, Super Deluxe, Vivid, Vivid Coil, Monarch |
| Fox | `fox` | 32, 34, 36, 38, 40 | Float DPS, Float X, Float X2, DHX, DHX Air |
| DVO | `dvo` | Diamond, Jade | Topaz, Jade (coil) |
| Öhlins | `ohlins` | RXF 34, RXF 36 | TTX Air, TTX Coil |
| Manitou | `manitou` | Mattoc, Mezzer | Mara, Mara Pro |

---

## Conventions

- **Single file** — all changes go in `index.html`. No new files for app logic.
- **No external dependencies** — no npm, no build step, no CDN additions without discussion.
- **CSS variables** — never hardcode hex or rgb in new rules; always use `var(--)` tokens.
- **New tabs** — add `#tab-{name}` panel before `</div><!-- end .container -->`, add `#nav-{name}` button inside `<nav class="bottom-nav">`.
- **New modals** — follow the static shell + `data-*` pattern from `#sag-modal-backdrop` (Phase 5 modal pattern).
- **Icons** — Font Awesome (already loaded via CDN). Use `fa-solid` or `fa-regular` prefix classes.
- **PSI/clicks are numbers** — never store or compare as strings.
- **Tyre saves** — localStorage only, no Supabase schema.
- **`formula_psi` takes precedence** — always check before reading `pressure_chart`.

---

## Common Gotchas

1. **`formula_psi` silently overrides `pressure_chart`** — some RockShox models use `weight_lbs` formula. `computePSI()` handles this but if you're reading the chart directly you'll get wrong numbers.

2. **Sag mm only available for forks** — shocks don't have `travel_mm` or `stroke_mm` in the data (would need per-bike leverage ratio). `sagMmStr` is null for shocks; the PSI corrector uses `%` input for shocks, `mm` for forks.

3. **Single file means grep is essential** — with ~4700 lines, always use grep to find a function or element before editing. Line numbers shift with every change.

4. **`fixitRendered` guard prevents stale data after calc** — if contextual numbers are added to the Fix It tab in future (Phase 6-02), this guard will need to be reset when `pendingCalc` changes, or the render logic restructured.

5. **Supabase saves limit is enforced client-side** — max 3 saves per user is checked in JS, not enforced by DB constraints. Don't remove the check without adding a DB-level constraint.

6. **`damping_snapshot` is stored as JSONB** — when reading saves back, `damping_snapshot` is already parsed as an object by Supabase client; no JSON.parse needed.

7. **vercel.json rewrites all routes to index.html** — any new URL paths (e.g. for SEO pages in Phase 11) must either be added as explicit Vercel routes or handled differently to avoid the catch-all rewrite.
