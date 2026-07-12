// ============================================================
// AUTO — Heading tanpa nomor untuk DAFTAR ISI, DAFTAR PUSTAKA, dll
// ============================================================
#let headz(outlined: true, body) = heading(
  level: 1,
  outlined: outlined,
  numbering: none,
  body,
)
