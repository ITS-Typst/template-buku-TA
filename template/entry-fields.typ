// ============================================================
// AUTO — Grid label:nilai untuk abstrak, pernyataan, dll
// ============================================================
// entries: array of (label, value) tuples
#let entry-fields(entries, col-widths: (5cm, 0.5cm, 1fr), row-gutter: 4pt) = grid(
  columns: col-widths,
  row-gutter: row-gutter,
  ..entries.map(v => (v.at(0), [: ], v.at(1))).flatten(),
)
