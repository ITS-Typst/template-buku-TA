// ============================================================
// AUTO — Sisipan halaman kosong antar bab (cetak bolak-balik)
// ============================================================
#let halaman-kosong() = {
  pagebreak()
  v(1fr)
  align(center)[
    #text(style: "italic")[Halaman ini sengaja dikosongkan.]
  ]
  v(1fr)
}
