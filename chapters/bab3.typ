// ============================================================
// bab3.typ — BAB 3: METODOLOGI
// ============================================================

= METODOLOGI

== Metode yang Digunakan

=== Arsitektur Sistem Rekomendasi Author

// Tulis penjelasan arsitektur sistem di sini.
// Contoh gambar:
// #gambar("../assets/arsitektur-sistem.png", caption: "Arsitektur Sistem")

=== Pembentukan Representasi Author Berbasis Multi-Centroid

// Tulis penjelasan representasi author di sini.

=== Pemrosesan Query Pengguna di Sisi Client

// Tulis penjelasan pemrosesan query di sini.

=== Enkripsi Query dan Homomorphic Similarity Computation

// Tulis penjelasan enkripsi dan komputasi di sini.

=== Dekripsi dan Pemeringkatan Hasil Rekomendasi

// Tulis penjelasan dekripsi dan ranking di sini.

== Bahan dan Peralatan yang Digunakan

#figure(
  table(
    columns: (1fr, 2fr, 3fr),
    inset: 6pt,
    stroke: 0.5pt,
    align: (center, center, left),
    [*No*], [*Nama Perangkat*], [*Spesifikasi*],
    [1], [CPU], [AMD Ryzen 5 / Intel Core i5 atau setara],
    [2], [RAM], [16 GB],
    [3], [OS], [Ubuntu 22.04 / Windows 11],
    [4], [Python], [3.10+],
    [5], [Library], [concrete-python, sentence-transformers, scikit-learn],
  ),
  caption: [Perangkat Pendukung],
  supplement: [Tabel],
)

== Urutan Pelaksanaan Penelitian

// Jelaskan timeline dan tahapan penelitian di sini.

#figure(
  table(
    columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    inset: 6pt,
    stroke: 0.5pt,
    align: center,
    [*Kegiatan*], [*Jan*], [*Feb*], [*Mar*], [*Apr*], [*Mei*], [*Jun*],
    [Studi Literatur], [✓], [], [], [], [], [],
    [Perancangan Sistem], [], [✓], [], [], [], [],
    [Implementasi], [], [], [✓], [✓], [], [],
    [Pengujian], [], [], [], [✓], [✓], []  ,
    [Penulisan Laporan], [], [], [], [], [✓], [✓],
  ),
  caption: [Lini Masa Pengerjaan Tugas Akhir],
  supplement: [Tabel],
)
