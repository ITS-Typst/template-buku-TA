// ============================================================
// main.typ — Entry point Tugas Akhir ITS
// Teknik Informatika, FTEIC
// ============================================================

#import "lib.typ": *
#import "template.typ": template
#import "cover.typ": halaman-sampul
#import "front-matter.typ": lembar-pengesahan, pernyataan-orisinalitas, pernyataan-ai, kata-pengantar, halaman-abstrak

// ── Load metadata dari data.yaml ─────────────────────────
#let data = yaml("data.yaml")

// ── Document metadata ─────────────────────────────────────
#set document(
  title: data.judul.id,
  author: data.mahasiswa.nama,
)

// ── Wrap semua konten dalam template ─────────────────────
#show: template.with(
  appendices: {
    include "lampiran.typ"
  },
)

// ============================================================
// HALAMAN SAMPUL (tanpa nomor halaman)
// ============================================================
#set page(numbering: none)
#halaman-sampul(data)

// ============================================================
// FRONT MATTER — penomoran romawi
// ============================================================
#set page(numbering: "i")
#counter(page).update(1)

#lembar-pengesahan(data)
#pernyataan-orisinalitas(data)

#pernyataan-ai(data)
#halaman-kosong()

// Kata pengantar — isi di sini atau di file terpisah
#kata-pengantar(data)

// Abstrak — isi konten di antara [ ] berikut
#halaman-abstrak(
  data,
  body-id: [
    Sistem rekomendasi author dimanfaatkan untuk membantu peneliti menemukan calon kolaborator yang relevan berdasarkan kesesuaian topik penelitian. Namun, pada sistem rekomendasi konvensional, query pengguna umumnya diproses dalam bentuk plaintext di sisi server, sehingga berpotensi menimbulkan risiko kebocoran informasi dan pelanggaran privasi.

    // Lanjutkan abstrak Indonesia di sini...
  ],
  body-en: [
    Author recommendation systems are commonly used to assist researchers in identifying relevant collaborators based on research topic similarity. However, in conventional systems, user queries are typically processed in plaintext on the server side, which may lead to privacy risks and unintended information disclosure.

    // Continue abstract in English here...
  ],
)

// ── Daftar Isi ────────────────────────────────────────────
#pagebreak()
#headz(outlined: false)[DAFTAR ISI]
#outline(title: none, depth: 3, indent: 0em)

// ── Daftar Gambar ─────────────────────────────────────────
#pagebreak()
#headz(outlined: false)[DAFTAR GAMBAR]
#outline(title: none, target: figure.where(kind: image))

// ── Daftar Tabel ─────────────────────────────────────────
#pagebreak()
#headz(outlined: false)[DAFTAR TABEL]
#outline(title: none, target: figure.where(kind: table))

// ── Daftar Kode Sumber ────────────────────────────────────
#pagebreak()
#headz(outlined: false)[DAFTAR KODE SUMBER]
#outline(title: none, target: figure.where(kind: "kode"))

// ============================================================
// MAIN MATTER — penomoran arab
// ============================================================
#pagebreak()
#set page(numbering: "1")
#counter(page).update(1)
#counter(heading).update(0)

#include "chapters/bab1.typ"
#include "chapters/bab2.typ"
#include "chapters/bab3.typ"
#include "chapters/bab4.typ"
#include "chapters/bab5.typ"
#include "chapters/bab6.typ"

// ── Daftar Pustaka ────────────────────────────────────────
#pagebreak()
#headz[DAFTAR PUSTAKA]
#bibliography("daftar-pustaka.bib", title: none, style: "ieee")
