// ============================================================
// AUTO — Entry point utama, orchestrator dokumen. Jangan diubah.
// ============================================================

#import "template/lib.typ": *
#import "template/template.typ": template
#import "content/00-cover.typ": halaman-cover
#import "content/01-halaman-judul.typ": halaman-judul
#import "content/02-lembar-pengesahan.typ": lembar-pengesahan
#import "content/03-pernyataan-orisinalitas.typ": pernyataan-orisinalitas
#import "content/04-pernyataan-ai.typ": pernyataan-ai
#import "content/05-abstrak.typ": halaman-abstrak
#import "content/06-kata-pengantar.typ": kata-pengantar

// Load metadata dari data.yaml
#let data = yaml("data.yaml")

// Document metadata
#set document(
  title: data.judul.id,
  author: data.mahasiswa.nama,
)

// Wrap semua konten dalam template
#show: template.with(appendices: {
  include "content/chapters/07-lampiran.typ"
})

// ============================================================
// HALAMAN SAMPUL (tanpa nomor halaman)
// ============================================================
// 1. Cover luar (biru)
#set page(numbering: none)
#halaman-cover(data)
#halaman-kosong()

// 2. Halaman judul dalam ID + EN
#pagebreak()
#halaman-judul(data)

// ============================================================
// FRONT MATTER — penomoran romawi
// ============================================================
#set page(numbering: "i")
#counter(page).update(1)

// Lembar Pengesahan ID + EN
#lembar-pengesahan(data)

// Pernyataan Orisinalitas ID + EN
#pernyataan-orisinalitas(data)

// Pernyataan Kode Etik Penggunaan AI Generatif
#pernyataan-ai(data)
#halaman-kosong()

// Abstrak — edit di content/05-abstrak.typ
#halaman-abstrak(data)

// Kata Pengantar — edit di content/06-kata-pengantar.typ
#kata-pengantar(data)

// Daftar Isi
#pagebreak()
#include "content/07-daftar-isi.typ"

// Daftar Gambar
#pagebreak()
#include "content/08-daftar-gambar.typ"

// Daftar Tabel
#pagebreak()
#include "content/09-daftar-tabel.typ"

// Daftar Kode Sumber
#pagebreak()
#include "content/10-daftar-kode.typ"

// Daftar Singkatan — edit di content/11-daftar-singkatan.typ
#pagebreak()
#include "content/11-daftar-singkatan.typ"

// Daftar Simbol — edit di content/12-daftar-simbol.typ
#pagebreak()
#include "content/12-daftar-simbol.typ"

// ============================================================
// MAIN MATTER — penomoran arab
// ============================================================
// Bab-bab — edit di content/chapters/01-bab1.typ dst.
#pagebreak()
#set page(numbering: "1")
#counter(page).update(1)
#counter(heading).update(0)

#include "content/chapters/01-bab1.typ"
#include "content/chapters/02-bab2.typ"
#include "content/chapters/03-bab3.typ"
#include "content/chapters/04-bab4.typ"
#include "content/chapters/05-bab5.typ"
#include "content/chapters/06-bab6.typ"

// Daftar Pustaka
#pagebreak()
#headz[DAFTAR PUSTAKA]
#bibliography("daftar-pustaka.bib", title: none, style: "american-psychological-association")

// Lampiran — sudah di-include melalui template.with(appendices: ...) di atas

// Biodata Penulis — edit di content/chapters/08-biodata-penulis.typ
#pagebreak()
#include "content/chapters/08-biodata-penulis.typ"
