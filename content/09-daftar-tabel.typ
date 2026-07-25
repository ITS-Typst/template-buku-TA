// ============================================================
// AUTO — Daftar tabel, dibangun otomatis dari figure tabel
// ============================================================
#import "../template/lib.typ": headz
#headz[DAFTAR TABEL]
#v(1cm)
#show outline.entry: it => {
  set text(size: 12pt, weight: "regular")
  v(0.6em, weak: true)
  it
}
#outline(title: none, target: figure.where(kind: table))
