// ============================================================
// WAJIB EDIT — BAB 5: Pengujian dan Evaluasi
// ============================================================

= PENGUJIAN DAN EVALUASI

== Lingkungan Pengujian

// Deskripsikan lingkungan pengujian (hardware, software, dataset).

== Skenario Pengujian

=== Pengujian Fungsional

// Tulis skenario pengujian fungsional di sini.

=== Pengujian Akurasi Rekomendasi

// Metrik: Precision@K, Recall@K, NDCG, dll.

#figure(
  table(
    columns: (2fr, 1fr, 1fr, 1fr),
    inset: 6pt,
    stroke: 0.5pt,
    align: center,
    [*Metode*], [*Precision\@5*], [*Recall\@5*], [*NDCG\@5*],
    [Baseline (plaintext)], [...], [...], [...],
    [Proposed (FHE)], [...], [...], [...],
  ),
  caption: [Perbandingan Akurasi Rekomendasi],
  supplement: [Tabel],
)

=== Pengujian Performa (Waktu Komputasi)

#figure(
  table(
    columns: (2fr, 1fr, 1fr),
    inset: 6pt,
    stroke: 0.5pt,
    align: center,
    [*Tahap*], [*Waktu (detik)*], [*Keterangan*],
    [Enkripsi query], [...], [],
    [Homomorphic computation], [...], [],
    [Dekripsi hasil], [...], [],
    [Total], [...], [],
  ),
  caption: [Performa Waktu Komputasi],
  supplement: [Tabel],
)

== Analisis Hasil

// Analisis dan diskusi hasil pengujian.
