// ============================================================
// AUTO — Halaman sampul luar (biru), data dari data.yaml
// ============================================================

#import "../template/lib.typ": *

#let its-blue  = rgb(0, 103, 171)
#let its-white = white

#let _logo-full() = image("../assets/brand/Logo-ITS-Biru.png", height: 2.7cm)

#let halaman-cover(data) = {
  let judul      = data.judul.id
  let tipe       = "TUGAS AKHIR"
  let lbl-pemb   = "Dosen Pembimbing"
  let lbl-kopemb = "Dosen Ko-pembimbing"
  let prodi      = data.institusi.prodi.id
  let dept       = data.institusi.departemen.id
  let fak        = data.institusi.fakultas.id

  set page(
    paper: "a4",
    margin: 0cm,
    fill: its-blue,
    header: none,
    footer: none,
    numbering: none,
  )

  // Band putih atas dengan logo
  block(
    fill: its-white,
    width: 100%,
    height: 4.5cm,
    inset: (left: 2cm, right: 3cm, top: 1cm, bottom: 2cm),
    _logo-full(),
  )

  // Konten biru di bawah band
  pad(left: 3cm, right: 3cm, top: 1.2cm, bottom: 2.5cm)[
    #set text(fill: its-white, font: "Trebuchet MS")
    #set par(first-line-indent: 0pt, justify: false)

    // Kode MK
    #text(size: 12pt)[#tipe – #data.kode-mk]
    #v(1.8cm)

    // Judul
    #text(size: 16pt, weight: "bold")[#judul]
    #v(1.8cm)

    // Mahasiswa
    #text(size: 12pt)[#data.mahasiswa.nama] \
    #text(size: 12pt)[NRP #data.mahasiswa.nrp]
    #v(1cm)

    // Pembimbing
    #text(size: 12pt)[#lbl-pemb] \
    #text(size: 12pt, weight: "bold")[#data.pembimbing.nama] \
    #text(size: 12pt)[NIP #data.pembimbing.nip]

    #for kp in data.ko-pembimbing [
      #v(0.5cm)
      #text(size: 12pt)[#lbl-kopemb] \
      #text(size: 12pt, weight: "bold")[#kp.nama] \
      #text(size: 12pt)[NIP #kp.nip]
    ]

    #v(1.5cm)

    // Institusi
    #text(size: 12pt, weight: "bold")[#prodi] \
    #text(size: 12pt)[#dept] \
    #text(size: 12pt)[#fak] \
    #text(size: 12pt)[#data.institusi.nama] \
    #text(size: 12pt)[#data.institusi.kota] \
    #text(size: 12pt)[#data.tahun]
  ]
}
