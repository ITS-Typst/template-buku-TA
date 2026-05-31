// ============================================================
// lib.typ — Utility functions (terinspirasi dari abmas-palo-alto)
// ============================================================

// ── Conditional helpers ───────────────────────────────────
#let truthify(v) = v != "" and v != false and v != [] and v != none

#let call-or-value(v) = if type(v) == function { v() } else { v }

#let render-if(cond, if-true, if-false: none) = {
  if truthify(cond) { call-or-value(if-true) }
  else if if-false != none { call-or-value(if-false) }
}

// ── Heading tanpa nomor (DAFTAR ISI, DAFTAR PUSTAKA, dll) ─
#let headz(outlined: true, body) = heading(
  level: 1,
  outlined: outlined,
  numbering: none,
  body,
)

// ── Tabel label : value (untuk abstrak, pernyataan, dll) ──
// entries: array of (label, value) tuples
#let entry-fields(entries, col-widths: (5cm, 0.5cm, 1fr)) = grid(
  columns: col-widths,
  row-gutter: 4pt,
  ..entries.map(v => (v.at(0), [: ], v.at(1))).flatten(),
)

// ── Halaman sengaja dikosongkan ───────────────────────────
#let halaman-kosong() = {
  pagebreak()
  align(center + horizon)[
    #text(style: "italic")[Halaman ini sengaja dikosongkan.]
  ]
}

// ── Kode sumber dengan styling ────────────────────────────
// Penggunaan:
//   #kode-sumber(caption: "Judul", ```python
//   def hello(): pass
//   ```)
#let kode-sumber(caption: "", body) = figure(
  kind: "kode",
  supplement: [Kode],
  caption: caption,
  block(
    fill: luma(248),
    stroke: 0.5pt + luma(200),
    radius: 3pt,
    inset: (x: 12pt, y: 10pt),
    width: 100%,
    align(left, body),
  ),
)

// ── Gambar dengan import relatif ─────────────────────────
#let gambar(path, caption: "", width: 80%) = figure(
  image(path, width: width),
  caption: caption,
  supplement: [Gambar],
)

// ── TOC entry formatter (nomor + judul + titik + halaman) ─
#let toc-entry-fn(it) = {
  let loc = it.element.location()
  let num = numbering(loc.page-numbering(), ..counter(page).at(loc))
  let body = it.body
  // Hilangkan prefix heading dari body jika ada
  let children = body.at("children", default: ())
  if children.len() > 1 {
    body = children.slice(1).join()
  }
  link(loc, box(grid(
    columns: (auto, 1fr, auto),
    gutter: 0pt,
    {
      for _ in range(it.level - 1) { box(width: 1.5em) }
    },
    [#body#box(width: 1fr, repeat[.])],
    align(right)[#num],
  )))
}

// ── Tabel breakable ───────────────────────────────────────
#let allow-table-break(body) = {
  show figure.where(kind: table): set block(breakable: true)
  body
}

// ── Timeline table (jadwal kegiatan) ─────────────────────
// data: array of (judul-kegiatan, (bulan-mulai, bulan-selesai))
// n-bulan: total bulan (default 6)
// label-kolom: array label kolom bulan
#let timeline-table(kegiatan, n-bulan: 6, label-kolom: none) = {
  let labels = if label-kolom != none {
    label-kolom
  } else {
    range(n-bulan).map(i => [#{i + 1}])
  }
  figure(
    kind: table,
    supplement: [Tabel],
    caption: [Lini Masa Pengerjaan Tugas Akhir],
    table(
      columns: (auto, 2fr) + n-bulan * (1fr,),
      fill: (x, y) => {
        if y == 0 { luma(220) }
        else if x > 1 and kegiatan.len() > y - 1 {
          let (_, range_) = kegiatan.at(y - 1)
          let (a, b) = range_
          if a <= (x - 2) and (x - 2) <= b { rgb(47, 84, 150).lighten(50%) }
          else { none }
        } else { none }
      },
      table.header(
        [*No*], [*Kegiatan*],
        ..labels.map(l => align(center)[*#l*]),
      ),
      ..kegiatan.enumerate().map(((i, (judul, _))) => (
        [#{i + 1}],
        [#judul],
        ..n-bulan * ([],),
      )).flatten(),
    ),
  )
}
