// ============================================================
// AUTO — Pernyataan kode etik penggunaan AI generatif, data dari data.yaml
// ============================================================

#import "../template/lib.typ": *

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
