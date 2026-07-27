---
name: citation-bibliography
description: Panduan sitasi dan daftar pustaka format APA edisi 7 untuk tugas akhir — sesuai Pedoman TA ITS 2022 bab 3.11
---

# Citation & Bibliography — APA 7th Edition (ITS Pedoman 2022)

## Sitasi Dalam Teks

| Jenis | Format | Contoh |
|-------|--------|--------|
| 1 penulis | `(Nama, Tahun)` | (Santoso, 2023) |
| 2 penulis | `(Nama1 & Nama2, Tahun)` | (Pranata & Dewi, 2024) |
| 3+ penulis | `(Nama1 dkk., Tahun)` | (Hidayat dkk., 2023) |
| Institusi | `(Singkatan, Tahun)` | (BPS, 2024) |
| Tanpa penulis | `("Judul Artikel", Tahun)` | ("Analisis Data", 2023) |

Kutipan langsung < 40 kata: dalam kalimat, pakai `"..."` + `(Penulis, Tahun, hlm. X)`.
Kutipan langsung > 40 kata: blok terpisah, indent kiri 1.27 cm, tanpa tanda petik.

Dalam kalimat teks gunakan "dan"; dalam kurung sitasi gunakan "&".

## Aturan Umum Daftar Pustaka

1. Halaman terpisah dari isi laporan
2. Urut abjad nama belakang penulis pertama
3. Indentasi gantung (hanging indent) — baris kedua dst. menjorok ke dalam
4. Judul artikel/bab: sentence case (huruf kapital hanya di awal kalimat & setelah titik dua)
5. Judul terbitan berkala (jurnal, majalah): kapital tiap kata utama, cetak miring
6. DOI/URL ditulis sebagai hyperlink aktif; URL panjang bisa dipersingkat via http://shortdoi.org/
7. Jangan cantumkan tanggal akses, kecuali sumber web yang isinya sering berubah
8. APA 7 tidak mewajibkan kota/negara penerbit (berbeda dari APA 6)
9. Jika nama penulis sama dengan penerbit, nama penerbit tidak ditulis ulang
10. >= 21 penulis: cantumkan 19 pertama, lalu "…", lalu penulis terakhir

## Format per Jenis Sumber

### Buku cetak
```
Author, A. A. (year). Title of book. Publisher.
```

### Buku dengan DOI atau URL
```
Author, A. A. (year). Title of book. Publisher. https://doi.org/xxxx
```

### Buku edisi selain pertama
```
Author, A. A. (year). Title of book (3rd ed.). Publisher.
```

### Buku yang diedit
```
Editor, A. A., & Editor, B. B. (Eds.). (year). Title of book. Publisher.
```

### Buku berbahasa asing (non-Inggris)
```
Author, A. A. (year). Title of book [Translation of book title]. Publisher.
```

### Buku terjemahan
```
Author, A. A. (year). Title of book (T. Translator, Trans.). Publisher. (Original work published year).
```
Sitasi pakai tahun ganda: (Schiller, 1804/2018, p. 19)

### Bab dalam buku yang diedit
```
Author, A. A. (year). Title of chapter. In B. Editor & C. Editor (Eds.),
Title of book (pp. xx-xx). Publisher.
```
Tambah DOI di akhir jika tersedia.

### Kamus/ensiklopedia online (konten sering berubah)
Pakai `(n.d.)` untuk tahun, cantumkan tanggal akses.

### Artikel jurnal dengan DOI
```
Author, A. A., & Author, B. B. (year). Title of article.
Title of Journal, volume(issue), pp-pp. https://doi.org/xxxx
```
Volume cetak miring; nomor edisi dalam kurung tidak miring: *6*(2).

### Artikel jurnal tanpa DOI
```
Author, A. A. (year). Title of article. Title of Journal, volume(issue), pp-pp.
```
Jika ada URL publik, cantumkan URL. Jika hanya bisa diakses via database institusi, cantumkan URL database tersebut.

### Artikel jurnal "in press"
Sudah diterima tapi belum ada volume/halaman — cantumkan DOI, tanpa nomor volume/halaman.

### Artikel majalah atau surat kabar (online)
```
Author, A. A. (year, Month Day). Title of article. Name of Publication. https://...
```

### Skripsi / Tesis
```
Author, A. A. (year). Title [Skripsi S1/Tesis S2, Nama Universitas]. Nama Repository. URL
```

### Website
```
Author, A. A. (year, Month Day). Title of page. Site Name. URL
```
Jika tidak ada tanggal, gunakan `(n.d.)` / `(t.t.)`.

### Sumber AI
```
Nama Pengembang. (year). Model name (Version) [Large language model]. URL
```

## Integrasi Typst

```typst
#bibliography("references.bib", title: "Daftar Pustaka")
```

Contoh `references.bib`:
```bibtex
@article{pratama2025,
  author  = {Pratama, Riko and Susanti, Dewi},
  title   = {Analisis penerimaan AI chatbot dalam layanan pelanggan menggunakan UTAUT2},
  journal = {Jurnal Teknologi Informasi},
  volume  = {15},
  number  = {2},
  pages   = {112--125},
  year    = {2025},
  doi     = {10.1234/jti.v15i2.5678}
}
```
