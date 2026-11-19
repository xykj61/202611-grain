# Gauge Style -- Writing That Measures and Stays Worth Reading

**Language:** EN
**Stamp:** `20261119.115928` (EST)
**Voice:** Kyri / Reya
**Style:** Gauge + Radiant (`0.0%` prose negation, verified by
`grain-ww radiant-check`)
**Companion Canons:** [`RADIANT_STYLE.md`](RADIANT_STYLE.md),
[`CIVIC_STYLE.md`](CIVIC_STYLE.md), [`TAME_GUIDANCE.md`](TAME_GUIDANCE.md),
[`TEACHER_STYLE.md`](TEACHER_STYLE.md), [`KARMA_STYLE.md`](KARMA_STYLE.md)

---

## 1. The First Rule: Write So the Reader Understands Effortlessly

Plain speech outranks cleverness every single time. When an ornate turn of
phrase and a clear everyday word compete, choose the word the reader grasps on
first sight. A gauge in a workshop or pilot's seat earns trust because any
steward glancing at the dial reads the true pressure in one breath. Gauge Style
brings that exact instrument clarity into prose.

---

## 2. What Gauge Inherits from Its Three Kin

1. **From Radiant Style -- Warmth:** Affirmative sentences, active verbs,
   generous tone, and coined terms explained in plain speech on first appearance.
2. **From Civic Style -- Alignment:** Naming the real-world human or ecological
   outcome alongside the metric that measures it, and tracing how incentives
   behave under load.
3. **From TAME Guidance -- Bounded Exactness:** Explicit units, dates, capacities,
   and paired welcome-and-refusal witnesses for every engineering claim.

---

## 3. Three Ceremony Settings: Door, Field, and Bench

Scale measurement ceremony to match the room a reader is entering:

| Setting | Where It Serves | Ceremony Level |
|---|---|---|
| **Door** | `README.md`, `MAP.md`, `context/` guides, onboarding doors | Warm overview, key headline readings, crisp navigation links |
| **Field** | Architecture audits, civic essays, `active-development/` syntheses | Full unit-and-date measurements, explicit assumptions, steel-manned trade-offs |
| **Bench** | Code comments, witness logs, `.kyri` manifests, hardware specs | Exact bit widths, cycle/byte ceilings, command invocations, SHA3 digests |

---

## 4. Separating Observation, Inference, and Projection

Keep the three kinds of analytical statement visibly distinct in their own
sentences:

1. **Observation (Measured Now):** What a witness, benchmark, or sensor reads on
   metal today, accompanied by unit, computational stamp, and the command that
   reproduces it (`35 metal witnesses pass in witness_all.rish as of 20261119`).
2. **Inference (Derived Pattern):** What follows logically from combining two or
   more observations, naming the connecting reasoning openly.
3. **Projection (Forward Estimate):** What we expect across a future horizon,
   carrying **four explicit anchors**:
   - *Horizon* (when the estimate applies),
   - *Assumptions* (what stays steady for the estimate to hold),
   - *Falsifier* (which concrete reading would prompt a redesign), and
   - *Confidence* (stated in plain proportion).

---

## 5. Base Rates, Dated Magnitudes, and Structural Trends

- **Start from base rates:** Anchor forecasts in historical completion rates and
  measured hardware throughput before weaving a narrative.
- **Pair magnitudes with dates and units:** Write `32 KiB per Glow desk as of
  20261119` rather than vague adjectives like *compact* or *fast*.
- **Distinguish structural shifts from seasonal cycles:** Separate decade-long
  physical realities (topsoil depth, RISC-V silicon openness, sovereign monetary
  accounting) from short-term market weather.

---

## 6. Code Comments -- Four Cloths Over One Exact Bound

Every code comment states **why** an invariant or ceiling stands where it does,
sharing the design criteria with the next engineer. While the numeric bound
stays identical, a comment may wear whichever register best serves its reader:

- **Gauge:** `// Cap receipt batch at 64 entries (8 KiB slab; fits L1 cache).`
- **Teacher / Karma:** `// Cap batch at 64 so a small farm's modest board stays responsive.`
- **Radiant:** `// Sixty-four entries keep every batch swift inside one 8 KiB page.`
- **Twilight:** `// Sixty-four lanterns fill one quiet page of memory and rest.`

---

## 7. Softening -- Reaching for the Warmer, Truer Word

Precision and kindness strengthen each other. When reviewing prose, trade sharp
or combative idioms for grounded craft words:

| Combative or Cold Phrase | Gauge + Radiant Replacement |
|---|---|
| *kill / nuke / destroy a process* | **retire**, **close**, **reclaim**, **complete** |
| *sanity check / dummy value* | **coherence check**, **fixture value**, **baseline probe** |
| *crush / dominate the market* | **earn lasting trust**, **serve stewards well** |
| *force the user to* | **invite the steward to**, **guide the caller to** |
| *bulletproof / battle-tested* | **witness-proven**, **bounded on metal**, **field-verified** |

---

## 8. The Four QA Readings (`6-Virgo` Lantern Audit)

During **Movement `6-Virgo`**, we weigh our prose and architecture across four
clear readings:
1. **Truth to the Tree:** Every path, count, and command matches live disk state.
2. **Affirmative Clarity:** Sentences lead with what *is* (`0.0%` negation on
   `Gauge + Radiant` pages).
3. **Proportional Ceremony:** Door pages stay breezy; Bench pages carry exact
   numbers.
4. **Orbit Efficiency:** Identifying where fewer turns, cleaner macros, or
   better-organized `tools/` folders help the next 15 movements flow even more
   smoothly.

---

*May our dials read true, may our words stay plain and generous, and may every
measurement help the next builder walk forward with confidence.*
