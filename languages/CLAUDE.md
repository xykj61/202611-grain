# `languages/` -- Scoped Claude Code Instructions

1. **Rye (`languages/rye/`):** Thin metal, SIMD, crypto, and syscall crust.
   Keep `<= 80` cols, explicit `u32`/`u64` widths, and `>= 2` `// invariant:`
   assertions per function. Never embed literal PEM private headers in source.
2. **Glow (`languages/glow/`):** Pure citizen functional kernel (`Sheaf ->
   Thresh -> Trellis -> Assay -> Pith -> Mill`). Every `.glow` desk declares a
   positive `/!` `FrameBudget`, aligns inline `::` comments at **column 57**,
   stays `<= 80` columns and `< 32 KiB`, and uses plain descriptive file names
   without ascending serial numbers.
3. **Rishi (`languages/rishi/`):** Witness steward and `grain-ww` umbrella CLI
   (`grain_ww_cli.rye`). Witness scripts in `tools/<letter>/` take plain
   feature names (`*_witness.rish`), never milestone counts.
4. **Brix & Kyri (`languages/brix/`, `languages/kyri/`):** Declarative recipes
   and canonical data records; chronological `YYYYMMDD.HHMMSS` stamps only.
5. **Husk (`.husk`):** Glow-flavored markdown templates that lower to `.md` via
   `grain-ww husk-lower`. Use `{{ binding }}` for live-computed values
   (myofascia, commit-count, orbit, sign, version-stamp) and `{# comment #}`
   for stripped comments. Single-source metrics -- define once, never hand-sync.
