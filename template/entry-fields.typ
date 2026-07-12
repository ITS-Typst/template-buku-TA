// ============================================================
// AUTO — Grid label:nilai untuk abstrak, pernyataan, dll
// ============================================================
// entries: array of (label, value) tuples
#let entry-fields(entries, col-widths: (5cm, 0.5cm, 1fr)) = grid(
  columns: col-widths,
  row-gutter: 4pt,
  ..entries.map(v => (v.at(0), [: ], v.at(1))).flatten(),
)
