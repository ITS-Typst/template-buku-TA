// ============================================================
// AUTO — Lembar pengesahan ID & EN, data dari data.yaml
// ============================================================

#import "../template/lib.typ": *

#let _pengesahan(data, lang: "id") = {
  let judul    = if lang == "id" { data.judul.id } else { data.judul.en }
  let tipe     = if lang == "id" { "TUGAS AKHIR" } else { "FINAL PROJECT" }
  let prodi    = if lang == "id" { data.institusi.prodi.id } else { data.institusi.prodi.en }
  let dept     = if lang == "id" { data.institusi.departemen.id } else { data.institusi.departemen.en }
  let fak      = if lang == "id" { data.institusi.fakultas.id } else { data.institusi.fakultas.en }
  let oleh     = if lang == "id" { "Oleh:" } else { "By:" }
  let kal1     = if lang == "id" { "Diajukan untuk memenuhi salah satu syarat" } else { "Submitted to fulfill one of the requirements" }
  let kal2     = if lang == "id" { "memperoleh gelar Sarjana Komputer pada" } else { "for obtaining a Bachelor of Computer Science degree at" }
  let disetujui = if lang == "id" { "Disetujui oleh Tim Penguji Tugas Akhir:" } else { "Approved by Final Project Examiner Team:" }
  let bulan    = if lang == "id" { data.bulan.id } else { data.bulan.en }
  let judul-hal = if lang == "id" { "LEMBAR PENGESAHAN" } else { "APPROVAL SHEET" }
  let lbl-pemb  = if lang == "id" { "Pembimbing" } else { "Advisor" }
  let lbl-kopemb = if lang == "id" { "Ko-pembimbing" } else { "Co-advisor" }

  headz[#judul-hal]

  set par(first-line-indent: 0pt)

  align(center)[
    #text(size: 12pt, weight: "bold")[#judul] \
    #v(0.3cm)
    #text(size: 14pt, weight: "bold")[#tipe] \
    #v(0.5cm)
    #kal1 \
    #kal2 \
    #prodi \
    #dept \
    #fak \
    #data.institusi.nama \
    #v(0.3cm)
    #oleh #data.mahasiswa.nama \
    NRP. #data.mahasiswa.nrp
  ]

  v(0.8cm)
  text(weight: "bold")[#disetujui]
  v(0.5cm)

  let all-sv = (
    (data.pembimbing.nama, lbl-pemb),
    ..data.ko-pembimbing.map(k => (k.nama, lbl-kopemb)),
    ..data.penguji.map(p => (p.nama, if lang == "id" { p.label.id } else { p.label.en })),
  )

  for (i, (nama, jabatan)) in all-sv.enumerate() [
    #grid(
      columns: (0.6cm, 7cm, 1fr),
      gutter: 0.3cm,
      [#(i+1).],
      [
        #v(1.8cm)
        #line(length: 100%)
        #nama
      ],
      [#jabatan],
    )
    #v(0.2cm)
  ]

  v(0.5cm)
  align(center)[
    #upper(data.institusi.kota) \
    #bulan, #data.tahun
  ]
}

#let lembar-pengesahan(data) = {
  _pengesahan(data, lang: "id")
  halaman-kosong()
  _pengesahan(data, lang: "en")
  halaman-kosong()
}
