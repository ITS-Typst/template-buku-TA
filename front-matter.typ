// ============================================================
// front-matter.typ — Semua halaman front matter
// (pengesahan, pernyataan, abstrak, kata pengantar)
// ============================================================

#import "lib.typ": *

// ── LEMBAR PENGESAHAN ────────────────────────────────────
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

  // Tabel tanda tangan semua penguji
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

// ── PERNYATAAN ORISINALITAS ───────────────────────────────
#let _orisinalitas(data, lang: "id") = {
  let judul-hal  = if lang == "id" { "PERNYATAAN ORISINALITAS" } else { "STATEMENT OF ORIGINALITY" }
  let pembuka    = if lang == "id" { "Yang bertanda tangan di bawah ini:" } else { "The undersigned:" }
  let isi        = if lang == "id" {
    [dengan ini menyatakan bahwa Tugas Akhir dengan judul "#data.judul.id" adalah hasil karya sendiri, bersifat orisinal, dan ditulis dengan mengikuti kaidah penulisan ilmiah.]
  } else {
    [hereby declares that the Final Project entitled "#data.judul.en" is my own work, is original, and was written in accordance with the rules of scientific writing.]
  }
  let sanksi     = if lang == "id" {
    [Bilamana di kemudian hari ditemukan ketidaksesuaian dengan pernyataan ini, maka saya bersedia menerima sanksi sesuai dengan ketentuan yang berlaku di Institut Teknologi Sepuluh Nopember.]
  } else {
    [If any discrepancies with this statement are found in the future, I am willing to accept sanctions in accordance with the provisions of Institut Teknologi Sepuluh Nopember.]
  }
  let lbl-mengetahui = if lang == "id" { "Mengetahui" } else { "Acknowledged" }
  let lbl-pemb   = if lang == "id" { "Dosen Pembimbing" } else { "Advisor" }
  let lbl-kopemb = if lang == "id" { "Dosen Ko-pembimbing" } else { "Co-advisor" }
  let lbl-mhs    = if lang == "id" { "Mahasiswa" } else { "Student" }
  let bulan      = if lang == "id" { data.bulan.id } else { data.bulan.en }

  headz[#judul-hal]

  set par(first-line-indent: 0pt)

  [#pembuka]
  v(0.3cm)

  if lang == "id" {
    entry-fields((
      ([Nama mahasiswa / NRP], [#data.mahasiswa.nama / #data.mahasiswa.nrp]),
      ([Program Studi], [S-1 Teknik Informatika]),
      ([Dosen Pembimbing / NIP], [#data.pembimbing.nama / #data.pembimbing.nip]),
      ..data.ko-pembimbing.map(k => ([Dosen Ko-pembimbing / NIP], [#k.nama / #k.nip])),
    ))
  } else {
    entry-fields((
      ([Student Name / Student ID], [#data.mahasiswa.nama / #data.mahasiswa.nrp]),
      ([Study Program], [Bachelor of Informatics]),
      ([Advisor / Employee ID], [#data.pembimbing.nama / #data.pembimbing.nip]),
      ..data.ko-pembimbing.map(k => ([Co-advisor / Employee ID], [#k.nama / #k.nip])),
    ))
  }

  v(0.5cm)
  isi
  v(0.3cm)
  sanksi

  v(1cm)
  grid(
    columns: (1fr, 1fr),
    gutter: 1cm,
    [
      #lbl-mengetahui \
      #text(weight: "bold")[#lbl-pemb]
      #v(1.8cm)
      #line(length: 100%)
      #data.pembimbing.nama \
      NIP. #data.pembimbing.nip
    ],
    [
      #data.institusi.kota, #underline[#h(3.5cm)] \
      #text(weight: "bold")[#lbl-mhs]
      #v(1.8cm)
      #line(length: 100%)
      #data.mahasiswa.nama \
      NRP. #data.mahasiswa.nrp
    ],
  )
  v(0.5cm)
  text(weight: "bold")[#lbl-kopemb]
  v(1.8cm)
  line(length: 50%)
  [#data.ko-pembimbing.at(0).nama \
  NIP. #data.ko-pembimbing.at(0).nip]
}

#let pernyataan-orisinalitas(data) = {
  _orisinalitas(data, lang: "id")
  halaman-kosong()
  _orisinalitas(data, lang: "en")
  halaman-kosong()
}

// ── PERNYATAAN KODE ETIK AI ───────────────────────────────
#let pernyataan-ai(data) = {
  headz[PERNYATAAN KODE ETIK PENGGUNAAN AI GENERATIF]

  set par(first-line-indent: 0pt)

  [_Code of Conduct Statement: Generative AI or AI-Assisted Usage_]
  v(0.5cm)
  [Saya yang bertanda tangan di bawah ini: / _I, the undersigned:_]
  v(0.3cm)

  entry-fields((
    (
      [Nama Mahasiswa / NRP \ _Full Name / Student ID_],
      [#data.mahasiswa.nama / #data.mahasiswa.nrp],
    ),
    (
      [Program Studi / _Study Program_],
      [S-1 Teknik Informatika],
    ),
    (
      [Judul Tugas Akhir \ _Final Project Title_],
      [#data.judul.id],
    ),
  ))

  v(0.5cm)
  [dengan ini menyatakan bahwa pada Tugas Akhir dengan judul di atas tersebut: \
  _hereby declare that in the Final Project with the above title:_]
  v(0.3cm)

  table(
    columns: (0.8cm, 4fr, 4fr, 1.5cm),
    align: (center, left, left, center),
    table.header(
      [*No.*], [*Pernyataan*], [*Statement*], [*Ya/Yes*],
    ),
    [1.],
    [Saya menggunakan AI Generatif dalam pengerjaan Tugas Akhir ini.],
    [I used Generative AI in this Final Project.],
    [],
    [2.],
    [Jika Ya, saya telah menyertakan lampiran penggunaan AI Generatif.],
    [If Yes, I have attached the Generative AI usage appendix.],
    [],
  )

  v(0.8cm)
  align(right)[
    #data.institusi.kota, #data.bulan.id #data.tahun
    #v(1.8cm)
    #line(length: 40%)
    #data.mahasiswa.nama \
    NRP. #data.mahasiswa.nrp
  ]
}

// ── KATA PENGANTAR ────────────────────────────────────────
#let kata-pengantar(data, body: none) = {
  headz[KATA PENGANTAR]

  if body != none {
    body
  } else [
    Puji syukur penulis panjatkan kepada Allah SWT atas segala rahmat dan karunia-Nya sehingga penulis dapat menyelesaikan Tugas Akhir yang berjudul "#data.judul.id" ini.

    Penyusunan laporan Tugas Akhir ini tidak terlepas dari bantuan dan dukungan berbagai pihak. Oleh karena itu, penulis menyampaikan terima kasih kepada:

    + #data.pembimbing.nama selaku Dosen Pembimbing yang telah membimbing, memberikan masukan, dan motivasi kepada penulis.
    #for kp in data.ko-pembimbing [+ #kp.nama selaku Dosen Ko-pembimbing yang telah memberikan bimbingan dan arahan.]
    + Seluruh dosen dan staf Departemen Teknik Informatika ITS.
    + Keluarga dan teman-teman yang telah memberikan dukungan dan semangat.

    Penulis menyadari bahwa Tugas Akhir ini masih jauh dari sempurna. Oleh karena itu, penulis mengharapkan kritik dan saran yang membangun.

    #align(right)[
      #data.institusi.kota, #data.bulan.id #data.tahun \
      #v(0.8cm)
      Penulis
    ]
  ]
  halaman-kosong()
}

// ── ABSTRAK ───────────────────────────────────────────────
#let _abstrak(data, lang: "id", body: none) = {
  let judul-hal  = if lang == "id" { "ABSTRAK" } else { "ABSTRACT" }
  let judul-ta   = if lang == "id" { data.judul.id } else { data.judul.en }
  let kw-label   = if lang == "id" { "Kata kunci" } else { "Keywords" }
  let kw         = if lang == "id" { data.kata-kunci.id } else { data.kata-kunci.en }
  let abs-label  = if lang == "id" { "Abstrak" } else { "Abstract" }
  let dept-val   = if lang == "id" { "Teknik Informatika FTEIC – ITS" } else { "Informatics ELECTICS – ITS" }

  headz[#judul-hal]

  set par(first-line-indent: 0pt)

  align(center)[#text(weight: "bold")[#judul-ta]]
  v(0.5cm)

  if lang == "id" {
    entry-fields((
      ([Nama Mahasiswa / NRP], [#data.mahasiswa.nama / #data.mahasiswa.nrp]),
      ([Departemen], [#dept-val]),
      ([Dosen Pembimbing], [#data.pembimbing.nama]),
      ..data.ko-pembimbing.map(k => ([Dosen Ko-pembimbing], [#k.nama])),
    ))
  } else {
    entry-fields((
      ([Full Name / Student ID], [#data.mahasiswa.nama / #data.mahasiswa.nrp]),
      ([Department], [#dept-val]),
      ([Advisor], [#data.pembimbing.nama]),
      ..data.ko-pembimbing.map(k => ([Co-advisor], [#k.nama])),
    ))
  }

  v(0.5cm)
  text(weight: "bold")[#abs-label]
  v(0.3cm)

  set par(first-line-indent: 1.25cm)

  if body != none {
    body
  } else [
    _[Isi abstrak #if lang == "id" { "Indonesia" } else { "Inggris" } — tulis di sini]_
  ]

  v(0.5cm)
  set par(first-line-indent: 0pt)
  [*#kw-label:* #kw]
}

#let halaman-abstrak(data, body-id: none, body-en: none) = {
  _abstrak(data, lang: "id", body: body-id)
  halaman-kosong()
  _abstrak(data, lang: "en", body: body-en)
  halaman-kosong()
}
