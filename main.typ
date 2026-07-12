// ============================================================
// AUTO — Entry point utama, orchestrator dokumen. Jangan diubah.
// ============================================================

#import "template/lib.typ": *
#import "template/template.typ": template
#import "content/00-cover.typ": halaman-sampul
#import "content/01-lembar-pengesahan.typ": lembar-pengesahan
#import "content/02-pernyataan-orisinalitas.typ": pernyataan-orisinalitas
#import "content/03-pernyataan-ai.typ": pernyataan-ai
#import "content/04-abstrak.typ": halaman-abstrak
#import "content/05-kata-pengantar.typ": kata-pengantar

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
// 1–3. Cover luar (biru) + sampul dalam ID + sampul dalam EN
#set page(numbering: none)
#halaman-sampul(data)

// ============================================================
// FRONT MATTER — penomoran romawi
// ============================================================
#set page(numbering: "i")
#counter(page).update(1)

// 4–5. Lembar Pengesahan ID + EN
#lembar-pengesahan(data)

// 6–7. Pernyataan Orisinalitas ID + EN
#pernyataan-orisinalitas(data)

// 8. Pernyataan Kode Etik Penggunaan AI Generatif
#pernyataan-ai(data)
#halaman-kosong()

// 9–10. Abstrak — edit di content/04-abstrak.typ
#halaman-abstrak(data)

// 11. Kata Pengantar — edit di content/05-kata-pengantar.typ
#kata-pengantar(data)

// 12. Daftar Isi
#pagebreak()
#include "content/06-daftar-isi.typ"

// 13. Daftar Gambar
#pagebreak()
#include "content/07-daftar-gambar.typ"

// 14. Daftar Tabel
#pagebreak()
#include "content/08-daftar-tabel.typ"

// 15. Daftar Kode Sumber
#pagebreak()
#include "content/09-daftar-kode.typ"

// 16. Daftar Singkatan — edit di content/10-daftar-singkatan.typ
#pagebreak()
#include "content/10-daftar-singkatan.typ"

// 17. Daftar Simbol — edit di content/11-daftar-simbol.typ
#pagebreak()
#include "content/11-daftar-simbol.typ"

// ============================================================
// MAIN MATTER — penomoran arab
// ============================================================
// 18. Bab-bab — edit di content/chapters/01-bab1.typ dst.
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

// 19. Daftar Pustaka
#pagebreak()
#headz[DAFTAR PUSTAKA]
#bibliography("daftar-pustaka.bib", title: none, style: "american-psychological-association")

// 20. Lampiran — edit di content/chapters/07-lampiran.typ
// (sudah di-include melalui template.with(appendices: ...) di atas)

// 21. Biodata Penulis — edit di content/chapters/08-biodata-penulis.typ
#pagebreak()
#include "content/chapters/08-biodata-penulis.typ"
