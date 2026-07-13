// ============================================================
// WAJIB EDIT — Abstrak bahasa Indonesia dan Inggris (200–400 kata + kata kunci)
// ============================================================

#import "../template/lib.typ": *

// ABSTRAK BAHASA INDONESIA — EDIT DI SINI
// 200–400 kata, tanpa sitasi, tanpa singkatan yg belum didefin.
#let id = [
  Sistem rekomendasi author dimanfaatkan untuk membantu peneliti menemukan calon kolaborator yang relevan berdasarkan kesesuaian topik penelitian. Namun, pada sistem rekomendasi konvensional, query pengguna umumnya diproses dalam bentuk plaintext di sisi server, sehingga berpotensi menimbulkan risiko kebocoran informasi dan pelanggaran privasi.

  // Lanjutkan abstrak Bahasa Indonesia di sini...
]

// KATA KUNCI BAHASA INDONESIA — EDIT DI SINI
// Pisahkan dengan koma.
#let kata-kunci-id = "sistem rekomendasi author, privasi query, homomorphic inference, fully homomorphic encryption, concrete"

// ABSTRACT IN ENGLISH — EDIT HERE
// 200–400 words.
#let en = [
  Author recommendation systems are commonly used to assist researchers in identifying relevant collaborators based on research topic similarity. However, in conventional systems, user queries are typically processed in plaintext on the server side, which may lead to privacy risks and unintended information disclosure.

  // Continue abstract in English here...
]

// KEYWORDS IN ENGLISH — EDIT HERE
// Separate with commas.
#let kata-kunci-en = "author recommendation system, query privacy, homomorphic inference, fully homomorphic encryption, concrete"

// ============================================================
// Layout — tidak perlu diedit
// ============================================================

#let _render(data, lang, body, kw) = {
  let judul-hal = if lang == "id" { "ABSTRAK" } else { "ABSTRACT" }
  let judul-ta = if lang == "id" { data.judul.id } else { data.judul.en }
  let kw-label = if lang == "id" { "Kata kunci" } else { "Keywords" }
  let abs-label = if lang == "id" { "Abstrak" } else { "Abstract" }
  let dept-val = if lang == "id" { "Teknik Informatika FTEIC – ITS" } else { "Informatics ELECTICS – ITS" }

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
  body
  v(0.5cm)
  set par(first-line-indent: 0pt)
  [*#kw-label:* #kw]
}

#let halaman-abstrak(data) = {
  _render(data, "id", id, kata-kunci-id)
  halaman-kosong()
  _render(data, "en", en, kata-kunci-en)
  halaman-kosong()
}
