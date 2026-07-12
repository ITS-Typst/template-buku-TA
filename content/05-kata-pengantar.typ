// ============================================================
// WAJIB EDIT — Kata pengantar (maks. 1 halaman)
// ============================================================

#import "../template/lib.typ": *

// ISI KATA PENGANTAR — EDIT DI SINI
#let isi = [
  Puji syukur penulis panjatkan kepada Allah SWT atas segala rahmat dan karunia-Nya sehingga penulis dapat menyelesaikan Tugas Akhir ini.

  Penyusunan laporan Tugas Akhir ini tidak terlepas dari bantuan dan dukungan berbagai pihak. Oleh karena itu, penulis menyampaikan terima kasih kepada:

  + Nama Dosen Pembimbing selaku Dosen Pembimbing yang telah membimbing, memberikan masukan, dan motivasi kepada penulis.
  + Seluruh dosen dan staf Departemen Teknik Informatika ITS.
  + Keluarga dan teman-teman yang telah memberikan dukungan dan semangat.

  Penulis menyadari bahwa Tugas Akhir ini masih jauh dari sempurna. Oleh karena itu, penulis mengharapkan kritik dan saran yang membangun.

  #align(right)[
    Surabaya, Januari 2026 \
    #v(0.8cm)
    Penulis
  ]
]

// ============================================================
// Layout — tidak perlu diedit
// ============================================================

#let kata-pengantar(data) = {
  headz[KATA PENGANTAR]
  isi
  halaman-kosong()
}
