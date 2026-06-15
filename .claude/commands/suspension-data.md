# Suspension Domain Knowledge

Load domain-specific knowledge about MTB suspension physics, the RideReady data format, and conventions used throughout the codebase. Use this skill before working on calculator logic, adding new bike models, extending the damping system, or interpreting the data schema.

---

## PSI / Air Pressure Logic

### How PSI is calculated

1. **Check for `formula_psi` first** — if `model.formula_psi === 'weight_lbs'`, return `Math.round(weightKg * 2.2046)`. Applies to some entry-level RockShox models. Overrides everything else.

2. **Otherwise use `pressure_chart`** — a list of `{ min_kg, max_kg, min_psi, max_psi }` entries. `interpolatePSI()` (~line 2826) finds the matching weight range and linearly interpolates:
   ```
   t = (weightKg - min_kg) / (max_kg - min_kg)
   psi = min_psi + t * (max_psi - min_psi)
   ```

3. **Clamp to `max_pressure_psi`** — never recommend over the model's max. This is a hard safety limit, not a preference.

### What PSI means in practice
- Air pressure in fork/shock = spring rate
- Higher PSI = stiffer spring = less sag
- Lower PSI = softer spring = more sag
- Riders on the boundary between chart entries get interpolated values — don't round to nearest entry.

---

## Sag

### What sag is
Sag = how much the suspension compresses under the rider's weight alone (static). Expressed as a % of total travel.

Example: 150mm fork with 30% sag = 45mm of sag.

### Target sag ranges
Each model has `sag_percent: { min, max }`. These come from manufacturer recommendations. Typical values:
- XC/Trail forks: 15–20%
- Trail/AM forks: 25–30%
- Enduro/DH forks: 25–35%
- Rear shocks (all types): 25–35%

### Fork sag in mm
`sagMm = (sagPercent / 100) * travel_mm`. Uses the last (largest) value in `travel_mm[]` — this is deliberate (max travel is the installed value for most riders).

The sag chip shows both `%` and `mm` for forks, `%` only for shocks. Shocks don't have a `stroke_mm` or leverage ratio in the data — converting % to mm for shocks requires bike-specific frame data we don't have.

### PSI correction rate
**1 PSI per 1% of sag deviation.** Example: target 28%, measured 24% (too stiff, too much sag is wrong… actually: too little sag = too stiff = too much PSI. If sag is 24% but target is 28%, rider needs to reduce PSI). Correction: `deviation = measuredPct - targetMid`; if deviation is negative (sag too low = spring too stiff), tell rider to reduce PSI.

Correction formula in `calcSagCorrection()` (~line 2996):
```js
const targetMid = (sagMin + sagMax) / 2;
const deviation = measuredSag - targetMid;
const correctionPsi = Math.round(Math.abs(deviation));
const direction = deviation > 0 ? 'Reduce' : 'Add';
```

---

## Damping

### What damping adjusters control

| Adjuster | What it does |
|----------|-------------|
| Rebound | Speed at which suspension extends after compression |
| LSC (Low-Speed Compression) | Resistance to slow compressions (body movement, pump track) |
| HSC (High-Speed Compression) | Resistance to fast compressions (rock strikes, drops) |
| LSR / HSR | Low/High speed rebound (dual-speed rebound dampers only) |

More clicks = more damping (typically closing = more resistance). Always check `total_clicks` to know the adjuster range.

### Ride style deltas
`ride_style_adjust` contains **deltas from the base clicks**, not absolute values.

```js
// Example
ride_style_adjust: {
  xc_trail:    { rebound: -1, lsc: -2 },  // faster rebound, less compression
  all_mountain: { rebound: 0, lsc: 0 },    // no change from base
  enduro_dh:   { rebound: +2, lsc: +2 },  // slower rebound, more compression
}
```

`applyStyleDelta(base, total, delta)` clamps the result to `[0, total]`.

Positive delta = more damping (enduro/dh gets more for chunky terrain).
Negative delta = less damping (XC/trail gets faster rebound for smoother pedalling).

### Click direction convention
Clicks are always counted **from fully open**. 0 clicks = fully open. `total_clicks` = fully closed. Base clicks are a mid-range starting point. This is consistent across all brands in the dataset.

### Missing damping data
If `model.damping` is undefined, `buildDampingHTML()` returns a "No damping data" message. This is expected for some models where damping info wasn't sourced yet. Don't assume all models have damping.

---

## Data Shape Reference

### Adding a new model

Minimum required fields:
```js
{
  model: "ModelName",
  series: "Trail",
  air_spring: "AirSpringType",
  sag_percent: { min: 25, max: 30 },
  max_pressure_psi: 100,
  pressure_chart: [
    { min_kg: 50, max_kg: 65, min_psi: 70, max_psi: 85 },
    { min_kg: 65, max_kg: 80, min_psi: 85, max_psi: 100 },
    // ... cover full rider weight range (50–120kg minimum)
  ]
}
```

For forks, add:
```js
travel_mm: [120, 130, 140, 150]  // available travel options
```

For models with damping:
```js
damping: {
  damper: "DamperName",
  rebound: {
    starting_clicks: [
      { min_kg: 50, max_kg: 70, clicks: 7 },
      { min_kg: 70, max_kg: 90, clicks: 9 },
      { min_kg: 90, max_kg: 120, clicks: 11 }
    ],
    total_clicks: 20
  },
  // add lsc, hsc, lsr, hsr as needed
  ride_style_adjust: {
    xc_trail:    { rebound: -2, lsc: -1 },
    all_mountain: { rebound: 0,  lsc: 0  },
    enduro_dh:   { rebound: +2, lsc: +2 }
  }
}
```

### Sourcing data
1. Manufacturer setup guides (Fox, RockShox publish PDF setup guides per model year)
2. Manufacturer pressure charts (often in the box or on the product page)
3. For damping clicks: manufacturer "starting point" recommendations, then apply delta logic
4. Cross-reference against community resources (NSMB, Pinkbike setup threads) for sanity check

---

## Suspension Feel / Symptom Logic

The Fix It tab (`SYMPTOM_FIXES`, ~line 3497) maps rider complaints to ordered tuning steps. Convention:
- Fix order: **quickest trailside first** (can be done in 30 seconds on trail), more complex last
- Component: always label `'Fork'`, `'Rear Shock'`, or `'Fork & Shock'` — never generic
- Keep fixes to 3 per symptom — more than 3 causes decision paralysis
- Fix detail text: specific (say "turn rebound adjuster 2 clicks clockwise"), not vague

### Common suspension physics for symptom mapping

| Symptom | Likely cause |
|---------|-------------|
| Harsh small bumps | HSC too high |
| Bottoms out | PSI too low, or HSC/LSC too low (packing) |
| Dives under braking | LSC too low (fork); sag too high |
| Packs down / feels dead | Rebound too slow (suspension can't recover) |
| Rear kicks | HSR too low (shock can't extend fast enough) |
| Vague front end | PSI too low (excess sag); rebound too fast |

---

## Extension Guide

### Adding a new brand
1. Add brand key to `suspensionData.brands` in `index.html` (~line 2750)
2. Add brand to `BRAND_LABELS` (~line 2755)
3. Add brand option to fork/shock select dropdowns in HTML
4. Wire up populate function to include the new brand's models

### Adding a new symptom to Fix It
1. Add entry to `SYMPTOM_FIXES` (~line 3497)
2. Set `id` (kebab-case), `label`, `icon` (Font Awesome class), `component`, `fixes[]`
3. No UI changes needed — `renderFixitTab()` iterates `SYMPTOM_FIXES` dynamically

### Contextual numbers (deferred Phase 6-02)
`pendingCalc` (~line 3494) holds the most recent calculation result including PSI and damping clicks. When Phase 6-02 is implemented, `renderFixitTab()` will need to:
- Reset the `fixitRendered` guard when `pendingCalc` changes
- Inject `pendingCalc.fork.psi`, `pendingCalc.fork.damping`, etc. into fix detail text
- Handle the case where `pendingCalc` is null (show generic fix text)
