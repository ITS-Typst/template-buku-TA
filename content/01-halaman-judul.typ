// ============================================================
// AUTO — Halaman judul dalam (putih), data dari data.yaml
// Pakai Lambang ITS (berwarna) + stripe biru di bawah logo
// ============================================================

#import "../template/lib.typ": *

#let its-blue = rgb(0, 103, 171)

#let _logo-lambang() = image("../assets/brand/Lambang-ITS-2.png", height: 2.7cm)

#let _halaman-judul-single(data, lang: "id") = {
  let judul      = if lang == "id" { data.judul.id } else { data.judul.en }
  let tipe       = if lang == "id" { "TUGAS AKHIR" } else { "FINAL PROJECT" }
  let lbl-pemb   = if lang == "id" { "Dosen Pembimbing" } else { "Advisor" }
  let lbl-kopemb = if lang == "id" { "Dosen Ko-pembimbing" } else { "Co-advisor" }
  let prodi      = if lang == "id" { data.institusi.prodi.id } else { data.institusi.prodi.en }
  let dept       = if lang == "id" { data.institusi.departemen.id } else { data.institusi.departemen.en }
  let fak        = if lang == "id" { data.institusi.fakultas.id } else { data.institusi.fakultas.en }

  set page(
    paper: "a4",
    margin: 0cm,
    fill: white,
    header: none,
    footer: none,
    numbering: none,
  )
  set text(font: "Trebuchet MS")
  set par(first-line-indent: 0pt, justify: false)

  // Blok atas: lambang ITS di kiri
  block(width: 100%, height: 4cm)[
    #pad(left: 3.5cm, top: 0.8cm)[
      #_logo-lambang()
    ]
  ]

  // Stripe biru horizontal
  block(fill: its-blue, width: 100%, height: 0.9cm)

  // Konten di bawah stripe
  pad(left: 4cm, right: 3cm, top: 3cm, bottom: 2.5cm)[

    // Kode MK
    #text(size: 12pt)[#tipe – #data.kode-mk]
    #v(1.5cm)

    // Judul — bold italic
    #text(size: 14pt, weight: "bold", style: "italic")[#judul]
    #v(1.5cm)

    // Mahasiswa
    #data.mahasiswa.nama \
    NRP #data.mahasiswa.nrp
    #v(0.8cm)

    // Pembimbing
    #lbl-pemb \
    #text(weight: "bold")[#data.pembimbing.nama] \
    NIP #data.pembimbing.nip

    #for kp in data.ko-pembimbing [
      #v(0.4cm)
      #lbl-kopemb \
      #text(weight: "bold")[#kp.nama] \
      NIP #kp.nip
    ]

    #v(1.5cm)

    // Institusi
    #text(weight: "bold")[#prodi] \
    #dept \
    #fak \
    #data.institusi.nama \
    #data.institusi.kota \
    #data.tahun
  ]
}

#let halaman-judul(data) = {
  _halaman-judul-single(data, lang: "id")
  halaman-kosong()
  pagebreak()
  _halaman-judul-single(data, lang: "en")
}
