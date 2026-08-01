![Hero](assets/brand/readme-hero.png)

<div align="center">
  <h1>Template Buku Tugas Akhir</h1>

  <p>
    <img src="https://img.shields.io/badge/license-MIT-blue" alt="License MIT">
    <img src="https://img.shields.io/badge/built%20with-Typst-239dad" alt="Built with Typst">
    <img src="https://img.shields.io/badge/typst-%E2%89%A50.13-blueviolet" alt="Typst ≥ 0.13">
    <img src="https://img.shields.io/badge/bilingual-ID%20%2F%20EN-green" alt="Bilingual">
    <img src="https://img.shields.io/badge/institusi-ITS-0067AB" alt="ITS">
  </p>

  <p>Template <a href="https://typst.app">Typst</a> untuk penulisan laporan Tugas Akhir S-1 Institut Teknologi Sepuluh Nopember (ITS).</p>
</div>

## Prasyarat

- **Typst** ≥ 0.13 - [typst.app/docs](https://typst.app/docs) atau instal via:
  ```bash
  # Windows
  winget install --id Typst.Typst

  # macOS / Linux
  brew install typst
  ```
- **VSCode** (opsional) - instal ekstensi [Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist) untuk preview real-time.

## Struktur Proyek

```
.
.
├── main.typ                    # Entry point
├── data.yaml                   # Isi data kamu di sini
├── template/                   # Engine template
│   ├── template.typ
│   ├── lib.typ
│   └── helpers/, gambar/, ...
├── content/
│   ├── 05-abstrak.typ          # Tulis abstrak
│   ├── 06-kata-pengantar.typ   # Tulis kata pengantar
│   ├── chapters/
│   │   ├── 01-bab1.typ         # Tulis isi bab
│   │   ├── 02-bab2.typ
│   │   └── ...
│   └── ...
└── assets/
    └── figures/                # Taruh gambar di sini
```


## Cara Pakai

### 1. Isi Metadata (`data.yaml`)

Edit `data.yaml` dengan data tugas akhir kamu:

```yaml
kode-mk: "EF234801"

judul:
  id: "Judul dalam Bahasa Indonesia"
  en: "Title in English"

mahasiswa:
  nama: "Nama Lengkap"
  nrp: "5025XXXXXXX"

pembimbing:
  nama: "Nama Dosen, Gelar"
  nip: "XXXXXXXXXXXXXXXXXX"

ko-pembimbing:
  - nama: "Nama Ko-pembimbing, Gelar"
    nip: "XXXXXXXXXXXXXXXXXX"

penguji:
  - nama: "Nama Penguji"
    label: { id: "Penguji", en: "Examiner 1" }

institusi:
  prodi:
    id: "Program Studi S-1 Teknik Informatika"
    en: "Undergraduate Study Program of Informatics"
  departemen:
    id: "Departemen Teknik Informatika"
    en: "Department of Informatics"
  fakultas:
    id: "Fakultas Teknologi Elektro dan Informatika Cerdas"
    en: "Faculty of Intelligent Electrical and Informatics Technology"
  nama: "Institut Teknologi Sepuluh Nopember"
  kota: "Surabaya"

tahun: "2026"
bulan:
  id: "Januari"
  en: "January"

kata-kunci:
  id: "kata kunci, dipisah, koma"
  en: "keywords, separated, by comma"
```

> Field `ko-pembimbing` boleh array kosong `[]` jika tidak ada.

### 2. Tulis Konten

| Yang diubah | File |
|---|---|
| Abstrak (ID + EN) | `content/05-abstrak.typ` |
| Kata Pengantar | `content/06-kata-pengantar.typ` |
| Bab 1–5 | `content/chapters/01-bab1.typ` s.d. `05-bab5.typ` |
| Daftar Pustaka | `content/14-daftar-pustaka.typ` |
| Lampiran | `content/15-lampiran.typ` |
| Biodata Penulis | `content/16-biodata-penulis.typ` |
| Gambar | `assets/figures/` |

### 3. Compile

```bash
# Compile sekali → main.pdf
typst compile main.typ

# Compile dengan nama file output kustom
typst compile main.typ NamaLengkap-NRP-TugasAkhir.pdf

# Watch mode — auto-compile setiap kali file disimpan (tanpa VSCode)
typst watch main.typ
```

> Jika menggunakan VSCode + ekstensi Tinymist, preview sudah real-time otomatis tanpa perlu menjalankan `watch` secara manual. `watch` berguna jika bekerja di luar VSCode (terminal, editor lain, dsb).

## Helper Functions

Template menyediakan beberapa fungsi pembantu yang sudah di-import otomatis di setiap bab:

| Fungsi | Kegunaan |
|---|---|
| `#gambar(...)` | Sisipkan gambar dengan caption dan label otomatis |
| `#kode-sumber(...)` | Blok kode sumber dengan syntax highlight |
| `#kode-semu(...)` | Blok pseudocode / algoritma |
| `#timeline-table(...)` | Tabel jadwal kegiatan (Gantt-style) |
| `#allow-table-break[...]` | Tabel panjang yang bisa terpotong antar halaman |

Untuk contoh penggunaan lengkap, lihat langsung implementasinya di file-file bab yang sudah ada (`content/chapters/`).

## Cara Tambah Bab Baru

Buat file baru, misal `content/chapters/06-bab6.typ`:

```typst
= JUDUL BAB UPPERCASE

== Sub Bab

Isi konten di sini.
```

Lalu uncomment / tambahkan di `main.typ`:

```typst
#include "content/chapters/06-bab6.typ"
```

## Sistematika Dokumen

| Bagian | Penomoran |
|---|---|
| Cover | — |
| Halaman Judul, Lembar Pengesahan, dst. | Romawi kecil (i, ii, iii…) |
| BAB 1 - BAB 5, Daftar Pustaka | Arab (1, 2, 3…) |
| Lampiran, Biodata Penulis | Menyambung Arab |

Seluruh bagian bilingual (Indonesia + Inggris) diatur otomatis oleh template.

## Kontributor

[![Contributors](https://contrib.rocks/image?repo=ITS-Typst/template-buku-TA)](https://github.com/ITS-Typst/template-buku-TA/graphs/contributors)

## Lisensi

Dirilis di bawah lisensi **MIT** - lihat [LICENSE](LICENSE) untuk teks lengkapnya. Bebas digunakan, dikembangkan, dan disesuaikan dengan kebutuhan.
