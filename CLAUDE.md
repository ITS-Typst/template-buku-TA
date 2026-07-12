# Template Buku TA ITS — Typst

Template Typst untuk Tugas Akhir S-1 Teknik Informatika FTEIC ITS.
Entry point: `main.typ`. Compile: `typst compile main.typ` atau `typst watch main.typ`.

---

## Struktur File

### Yang ditulis mahasiswa (CONTENT)

| File | Isi |
|------|-----|
| `data.yaml` | Semua metadata: nama, NRP, judul, pembimbing, dll |
| `content/abstrak.typ` | Abstrak Indonesia + Inggris |
| `content/kata-pengantar.typ` | Kata pengantar |
| `chapters/bab1.typ` – `bab6.typ` | Isi per bab |
| `chapters/lampiran.typ` | Lampiran |
| `content/figures/` | Gambar-gambar (PNG/JPG/SVG) |

### Infrastructure (jangan disentuh)

| File | Peran |
|------|-------|
| `main.typ` | Entry point — orchestrator murni, tidak ada konten |
| `template.typ` | Page setup, typography, heading rules |
| `lib.typ` | Helper functions (`gambar`, `kode-sumber`, `timeline-table`, dll) |
| `cover.typ` | Halaman sampul outer (biru) + inner (putih) |
| `front-matter.typ` | Lembar pengesahan, pernyataan orisinalitas, pernyataan AI |
| `assets/` | Logo ITS |

---

## Alur Kerja Mahasiswa

1. Isi `data.yaml` — metadata otomatis muncul di cover, pengesahan, abstrak
2. Tulis abstrak di `content/abstrak.typ`
3. Tulis kata pengantar di `content/kata-pengantar.typ`
4. Tulis bab di `chapters/bab1.typ` dst.
5. Taruh gambar di `content/figures/`
6. `typst compile main.typ` → `main.pdf`

---

## Helper Functions (dari lib.typ)

```typst
// Gambar dengan caption + supplement otomatis
#gambar("content/figures/arsitektur.png", caption: "Arsitektur Sistem", width: 90%)

// Kode sumber dengan syntax highlight
#kode-sumber(caption: "Contoh kode Python")[
  ```python
  def hello(): pass
  ```
]

// Timeline jadwal kegiatan
#timeline-table(
  (
    ("Studi Literatur", (0, 1)),
    ("Implementasi",    (2, 4)),
    ("Pengujian",       (4, 5)),
  ),
  n-bulan: 6,
  label-kolom: ([Jan], [Feb], [Mar], [Apr], [Mei], [Jun]),
)

// Tabel yang bisa dipotong antar halaman
#allow-table-break[
  #figure(table(...), caption: [...])
]
```

---

## Data YAML

Semua field di `data.yaml` bersifat wajib kecuali `ko-pembimbing` (bisa array kosong `[]`).

```yaml
kode-mk: "EF234801"
judul:
  id: "Judul dalam Bahasa Indonesia"
  en: "Title in English"
mahasiswa:
  nama: "Nama Lengkap"
  nrp: "50252XXXXX"
pembimbing:
  nama: "Nama Dosen, Gelar"
  nip: "XXXXXXXXXXXXXXXXXX"
ko-pembimbing:
  - nama: "Nama Ko-pembimbing"
    nip: "XXXXXXXXXXXXXXXXXX"
penguji:
  - nama: "Nama Penguji"
    label: { id: "Penguji", en: "Examiner 1" }
institusi:
  prodi: { id: "...", en: "..." }
  departemen: { id: "...", en: "..." }
  fakultas: { id: "...", en: "..." }
  nama: "Institut Teknologi Sepuluh Nopember"
  kota: "Surabaya"
tahun: "2026"
bulan: { id: "Januari", en: "January" }
kata-kunci:
  id: "kata kunci dipisah koma"
  en: "keywords separated by comma"
```

---

## Pedoman Resmi ITS (Buku Pedoman TA 2022) — Konformitas Template

Sumber: *Buku Pedoman Penyusunan Tugas Akhir Program Sarjana dan Sarjana Terapan, Direktorat Pendidikan ITS, Surabaya 2022.*

### Format Teknis — Status Konformitas

| Aspek | Pedoman Resmi | Template Saat Ini | Status |
|-------|--------------|-------------------|--------|
| Kertas | A4, HVS 80gr | A4 | ✓ |
| Font | Times New Roman 12pt | Times New Roman 12pt | ✓ |
| Margin atas | 3.0 cm | 3 cm | ✓ |
| Margin bawah | 2.5 cm | 3 cm | ⚠️ beda 0.5cm |
| Margin kiri | 3.0 cm | 4 cm | ❌ beda 1cm |
| Margin kanan | 2.0 cm | 3 cm | ❌ beda 1cm |
| Nomor bab | Angka Arab (BAB 1, 2, 3) — *dept IF, bukan Romawi seperti pedoman pusat* | Angka Arab (BAB 1, 2, 3) | ✓ |
| Posisi nomor halaman | Mirror: ganjil → kanan bawah, genap → kiri bawah — berlaku di KEDUA bagian (Romawi & Arab) | Footer, rata tengah | ❌ |
| Penomoran gambar/tabel | Per bab, format `Bab.Urut` | Per bab, format `1.1` | ✓ |
| Judul tabel | Di atas tabel | Di atas tabel | ✓ |
| Judul gambar | Di bawah gambar | Di bawah gambar | ✓ |
| Sitasi/Daftar Pustaka | APA edisi 7 | IEEE | ❌ |
| Nomor halaman front matter | Romawi kecil (i, ii, iii) | Romawi kecil | ✓ |
| Nomor halaman main matter | Arab (1, 2, 3) mulai Bab 1 | Arab mulai Bab 1 | ✓ |
| Font sampul | Trebuchet MS Bold | Times New Roman / Arial | ⚠️ |

### Sistematika Laporan — Checklist Halaman

**Bagian Awal (penomoran Romawi)**
- [x] Sampul depan (outer cover biru) — ID & EN
- [x] Halaman judul (inner cover putih) — ID & EN
- [x] Lembar Pengesahan — ID & EN
- [x] Pernyataan Orisinalitas — ID & EN
- [x] Pernyataan Kode Etik AI Generatif
- [x] Abstrak — ID & EN (200–400 kata + kata kunci)
- [x] Kata Pengantar (maks. 1 halaman)
- [x] Daftar Isi
- [x] Daftar Gambar
- [x] Daftar Tabel
- [x] Daftar Kode Sumber *(tambahan departemen IF)*
- [ ] **Daftar Simbol** — belum ada di template

**Bagian Inti (penomoran Arab)**
- [x] BAB 1 Pendahuluan
- [x] BAB 2 Tinjauan Pustaka
- [x] BAB 3 Metodologi
- [x] BAB 4 Hasil dan Pembahasan
- [x] BAB 5 Kesimpulan dan Saran
- [x] Daftar Pustaka

**Bagian Akhir**
- [x] Lampiran
- [ ] **Biodata Penulis** — belum ada di template *(Lampiran 11 pedoman: foto 4×6cm, riwayat pendidikan, organisasi/prestasi)*

### Spesifikasi Sampul (dari Lampiran 7 pedoman)
- Font judul: **Trebuchet MS Bold 18pt** ← template pakai TNR/Arial
- Font label "TUGAS AKHIR – KODE": **Trebuchet MS Bold 14pt**
- Logo ITS: 20mm dari kiri, 10mm dari atas, tinggi 45mm
- Blok biru ITS: RGB(0,103,171) / #0067AB, mulai 10mm di bawah logo ✓
- Margin kiri teks: 30mm

### Panduan Sitasi APA 7 (untuk daftar pustaka)
- Urut abjad nama belakang penulis pertama
- Hanging indent baris kedua dst.
- Kapitalisasi judul: hanya huruf pertama kalimat (sentence case)
- Gunakan `&` dalam kurung sitasi; `dan` jika disebut dalam kalimat
- DOI/URL sebagai hyperlink aktif
- Tanggal akses tidak perlu kecuali sumber berubah-ubah
- Tidak perlu kota/negara penerbit (beda dari APA 6)
- ≥21 penulis: cantumkan 19 pertama + `…` + penulis terakhir

Format umum:
```
Jurnal:  Author, A. (year). Title. Journal, vol(iss), pp. https://doi.org/xxx
Buku:    Author, A. (year). Title. Publisher.
Bab:     Author, A. (year). Title of chapter. In B. Ed (Ed.), Book (pp. xx–xx). Publisher.
```

---

## Known Issues

### Ketidaksesuaian dengan Pedoman Resmi ITS 2022
1. **Margin** — template pakai `left:4cm right:3cm bottom:3cm`; pedoman `kiri:3cm kanan:2cm bawah:2.5cm`. Perlu dikonfirmasi ke departemen IF (mungkin ada ketentuan berbeda).
2. **Nomor halaman** — harus mirror di kedua bagian:
   - Front matter: Romawi (i, ii, iii…), mulai dari halaman pertama setelah cover
   - Main matter: Arab (1, 2, 3…), mulai dari BAB 1 halaman 1
   - Keduanya: ganjil → kanan bawah, genap → kiri bawah
   - Template sekarang: `number-align: center` di semua halaman — perlu diganti custom footer di `template.typ`
4. **Daftar Pustaka style** — template `style: "ieee"`; pedoman APA 7. Perlu diganti ke APA.
5. **Halaman Biodata Penulis** — belum ada (wajib per pedoman, Lampiran 11).
6. **Daftar Simbol** — belum ada (disebut di sistematika bagian awal).
7. **Font sampul** — pedoman Trebuchet MS Bold; template pakai TNR + Arial.

### Code Issues
8. **Pergantian bab harus mulai halaman ganjil** (cetak bolak-balik):
   - Setiap `= BAB X` wajib mulai di halaman ganjil (recto)
   - Jika bab sebelumnya berakhir di halaman ganjil (mis. hal. 5), bab berikutnya mulai hal. 7
   - Halaman 6 diisi: *"Halaman ini sengaja dikosongkan."* — italic, TNR 12pt, posisi tengah halaman
   - `lib.typ` sudah punya `halaman-kosong()` tapi dipanggil manual, belum auto di pergantian bab
   - Implementasi di `template.typ` show rule heading level 1: cek paritas halaman via `context`, jika ganjil → sisipkan blank page sebelum `pagebreak()`
   ```typst
   // Logika yang perlu ditambahkan di show heading.where(level: 1)
   context {
     if calc.odd(here().page()) {
       pagebreak()
       align(center + horizon)[
         text(style: "italic")[ Halaman ini sengaja dikosongkan.]
       ]
     }
   }
   pagebreak(weak: true)
   ```
   - Hal yang sama berlaku untuk bagian Lampiran

9. **`toc-entry-fn`** di `lib.typ:66` — defined tapi tidak di-wire ke `template.typ`. Dead code.
9. **Lampiran heading display vs TOC** — heading tampilkan `"A. JUDUL"` tapi TOC tampilkan `"LAMPIRAN A. JUDUL"`. Intentional atau belum diputuskan.
10. **`arr.slice(0)` redundant** di `template.typ:113` — sama dengan `arr`.
11. **Tanda tangan lembar pengesahan** — hanya garis kosong, belum support image TTD.

---

## Cara Tambah Bab Baru

Di `chapters/`, buat `babX.typ`:
```typst
= JUDUL BAB UPPERCASE

== Sub Bab Satu

Konten di sini.
```

Lalu include di `main.typ`:
```typst
#include "chapters/babX.typ"
```

---

## Build

```bash
# Compile sekali
typst compile main.typ

# Watch mode (auto-recompile on save)
typst watch main.typ

# Install Typst (Windows)
winget install --id Typst.Typst
```

VSCode: install extension **Tinymist Typst** untuk preview real-time.
