// ============================================================
// AUTO — Halaman sampul luar (biru) dan dalam (putih), data dari data.yaml
// ============================================================

#import "../template/lib.typ": *

// Warna ITS brand
#let its-blue  = rgb(0, 103, 171)
#let its-white = white

// Logo ITS: full horizontal
#let logo-full(on-blue: false) = {
  image("../assets/brand/Logo-ITS-Biru.png", height: 2.2cm)
}

// Logo ITS: horizontal (untuk inner cover)
#let logo-gear() = image("../assets/brand/Logo-ITS-Biru.png", height: 2cm)

// OUTER COVER — halaman berwarna biru penuh
#let _outer-cover(data, lang: "id") = {
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
    fill: its-blue,
    header: none,
    footer: none,
    numbering: none,
  )

  // Band putih atas dengan logo
  block(
    fill: its-white,
    width: 100%,
    height: 4cm,
    inset: (left: 3.5cm, right: 3cm, top: 0.75cm, bottom: 0.75cm),
    logo-full(on-blue: false),
  )

  // Konten biru di bawah band
  pad(left: 4cm, right: 3cm, top: 1.2cm, bottom: 2.5cm)[
    #set text(fill: its-white, font: "Trebuchet MS")
    #set par(first-line-indent: 0pt, justify: false)

    // Kode MK
    #text(size: 12pt)[#tipe – #data.kode-mk]
    #v(1.8cm)

    // Judul
    #text(size: 16pt, weight: "bold")[#upper(judul)]
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

// INNER COVER — halaman putih dengan logo + stripe biru
#let _inner-cover(data, lang: "id") = {
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

  // Blok atas: logo gear di kiri (3cm dari kiri, 1cm dari atas)
  block(width: 100%, height: 4cm)[
    #pad(left: 3.5cm, top: 0.8cm)[
      #logo-gear()
    ]
  ]
  // Stripe biru horizontal
  block(fill: its-blue, width: 100%, height: 0.9cm)

  // Konten di bawah stripe
  pad(left: 4cm, right: 3cm, top: 1.2cm, bottom: 2.5cm)[

    // Kode MK
    #text(size: 12pt)[#tipe – #data.kode-mk]
    #v(1.5cm)

    // Judul — bold italic sesuai template
    #text(size: 14pt, weight: "bold", style: "italic")[#upper(judul)]
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

// PUBLIC: semua halaman sampul
#let halaman-sampul(data) = {
  // Hal 1: sampul luar biru (Indonesia)
  _outer-cover(data, lang: "id")
  // Hal 2: kosong
  halaman-kosong()
  // Hal 3: sampul dalam putih (Indonesia)
  pagebreak(); _inner-cover(data, lang: "id")
  // Hal 4: kosong
  halaman-kosong()
  // Hal 5: sampul dalam putih (Inggris) — tidak ada outer biru EN
  pagebreak(); _inner-cover(data, lang: "en")
}
