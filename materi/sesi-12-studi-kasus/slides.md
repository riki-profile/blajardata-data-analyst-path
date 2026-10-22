---
marp: true
theme: default
paginate: true
size: 16:9
footer: "Sesi 12 · Studi Kasus Terpandu"
style: |
  section {
    font-family: 'Segoe UI', 'Helvetica Neue', Arial, sans-serif;
    font-size: 30px;
    color: #202124;
    background: #ffffff;
    padding: 48px 64px;
    justify-content: flex-start;
  }
  h1 { color: #2a78d6; font-size: 46px; margin-bottom: 12px; }
  h2 { color: #2a78d6; font-size: 38px; margin-bottom: 12px; }
  h3 { color: #5f6368; font-size: 30px; }
  strong { color: #c4501f; }
  a { color: #2a78d6; }
  table { font-size: 24px; border-collapse: collapse; }
  th { background: #e8f0fb; color: #1a4f91; }
  th, td { padding: 6px 12px; border: 1px solid #dadce0; }
  code { background: #f1f3f4; color: #202124; border-radius: 4px; padding: 0 4px; }
  pre { font-size: 21px; line-height: 1.35; border-radius: 6px; }
  pre code { background: transparent; padding: 0; }
  blockquote { border-left: 6px solid #eb6834; color: #3c4043; background: #fdf1ec; padding: 10px 18px; }
  footer { color: #9aa0a6; font-size: 14px; }
  section::after { color: #9aa0a6; font-size: 14px; }
  section.lead { background: #2a78d6; color: #ffffff; justify-content: center; }
  section.lead h1, section.lead h2, section.lead h3, section.lead strong { color: #ffffff; }
  section.lead footer, section.lead::after { color: #d2e3fc; }
  section.lead code { background: rgba(255,255,255,0.2); color: #ffffff; }
  section.section { background: #f8f9fa; justify-content: center; }
  section.section h1 { font-size: 52px; }
  section.small { font-size: 25px; }
  section.small table { font-size: 20px; }
  section.small pre { font-size: 18px; }
---

<!-- _class: lead -->
<!-- _paginate: false -->

# Sesi 12 · Studi Kasus Terpandu

Kategori mana yang sebaiknya diprioritaskan?

Sabtu, 5 Desember 2026 · 14.00–15.40 WIB

---

## Agenda

| Waktu | Langkah |
| --- | --- |
| 14.00 | Kasus & 4 ukuran · tulis fokusmu di chat |
| 14.10 | **Langkah 1–2**: SQL di BigQuery |
| 14.30 | **Langkah 3–4**: muat & cek data |
| 14.40 | **Langkah 5–6**: 4 ukuran & matriks prioritas |
| 14.55 | **Langkah 7–9**: rekomendasi & grafik |
| 15.10 | **Langkah 10–11**: tulis jawaban |
| 15.25 | Unggah ke portofolio |
| 15.35 | Penutup |

File: `10_my_question.sql` · `10_my_question.ipynb`

---

<!-- _class: lead -->

# Kasusnya

Tim marketing TheLook punya **anggaran promosi terbatas** untuk kuartal depan

dan hanya bisa memfokuskan kampanye pada **satu kategori produk**.

**Kategori mana yang sebaiknya dipilih?**

---

## Pilih fokusmu

| Pilihan | Contoh |
| --- | --- |
| Department (wajib) | `Women` atau `Men` |
| Negara (opsional) | `United States`, `China`, `Brasil`, ... |

Tulis di chat, misalnya: `Women - China` atau `Men`

Fokus berbeda → angka, grafik, dan rekomendasi berbeda → **portofoliomu unik**

> Tebakan: sebelum melihat data, kategori apa yang kamu kira akan terpilih? Tulis di chat!

---

## 4 ukuran untuk setiap kategori

| Ukuran | Pertanyaan | Cara hitung |
| --- | --- | --- |
| Porsi pendapatan | Seberapa besar **sekarang**? | pendapatan kategori ÷ total |
| Pertumbuhan | Apakah permintaan **naik**? | 12 bulan terakhir vs 12 bulan sebelumnya |
| Margin % | Seberapa **untung**? | (harga jual − biaya) ÷ harga jual |
| Tingkat retur | Seberapa sering **dikembalikan**? | barang Returned ÷ barang terjual |

---

## Langkah 1–2 · SQL di BigQuery

1. Buka `10_my_question.sql`, ganti `'Women'` dengan fokusmu **di semua tempat**
2. Jalankan eksplorasi 1a, 1b, 1c, lalu **query final**

```sql
SUM(CASE WHEN periode = 'terakhir' AND status != 'Returned'
         THEN sale_price ELSE 0 END) AS pendapatan,
COUNTIF(periode = 'terakhir' AND status = 'Returned') AS barang_retur,
```

`CASE WHEN` di dalam `SUM` = filter kecil di setiap kolom

---

## Pertanyaan pemandu · SQL

1. Kenapa periodenya 12 bulan **lengkap**, bukan sampai hari ini?
2. Kenapa membandingkan 12 bulan dengan 12 bulan, bukan bulan ini dengan bulan lalu?
3. Kenapa `Cancelled` dibuang, tapi `Returned` tidak?

Jawab di chat!

Ketik `1` kalau query final berhasil

<!--
Jawaban:
1. Bulan berjalan belum selesai, jadi angkanya pasti lebih kecil.
2. Penjualan pakaian musiman (Swim di musim panas, Outerwear di musim dingin). 12 bulan penuh menghilangkan efek musim.
3. Cancelled tidak pernah dikirim, jadi bukan penjualan. Returned sempat terjual lalu dikembalikan; dibutuhkan untuk menghitung tingkat retur. Di kolom pendapatan, Returned dikeluarkan lewat CASE WHEN.
-->

---

## Langkah 3–5 · Muat, cek, hitung

```python
FOKUS_DEPARTMENT = "Women"   # atau "Men"
FOKUS_NEGARA = None          # atau "China"
```

| Kolom baru | Rumus |
| --- | --- |
| `porsi_pendapatan` | pendapatan ÷ total pendapatan × 100 |
| `pertumbuhan` | (pendapatan ÷ pendapatan_sebelumnya − 1) × 100 |
| `margin_persen` | margin ÷ pendapatan × 100 |
| `tingkat_retur` | barang_retur ÷ barang_terjual × 100 |

Kategori dengan porsi **< 1%** dipisahkan: pertumbuhannya "loncat-loncat" (100 → 300 USD = +200%)

---

## Langkah 6 · Matriks prioritas

Batas = **median** semua kategori (setengah di atas, setengah di bawah)

| | Tumbuh cepat | Tumbuh lambat |
| --- | --- | --- |
| **Porsi besar** | **Andalan**: pertahankan & perkuat | **Mesin Uang**: jaga, jangan boros anggaran |
| **Porsi kecil** | **Bintang Baru**: peluang terbaik | **Perlu Ditinjau**: evaluasi |

Mirip **matriks BCG**, alat yang sering dipakai konsultan bisnis

> Mesin Uang itu buruk? **Tidak**: penyumbang besar, tetap dijaga. Hanya saja tambahan promosi di sana hasilnya kecil.

---

## Langkah 7 · Aturan keputusan (tertulis!)

1. Ambil kategori **Bintang Baru**. Kalau tidak ada → **Andalan**
2. Pilih yang **margin %-nya tertinggi**: setiap dolar penjualan tambahan paling untung
3. Cek **tingkat retur**: di atas median → catat sebagai **risiko**

Kenapa ditulis? Supaya rekomendasi **bisa diperiksa dan diulang** orang lain, bukan selera pribadi.

> Retur tinggi → batalkan? **Tidak harus.** Sebutkan risikonya + langkah pendamping (panduan ukuran, foto produk).

---

## Langkah 8–9 · Dua grafik

**Grafik 1: Matriks prioritas** (scatter)
- X = porsi pendapatan · Y = pertumbuhan
- Garis putus-putus = median
- Rekomendasi disorot **oranye**

**Grafik 2: Margin % per kategori** (batang horizontal, diurutkan)

Siapa yang rekomendasinya **berbeda** dengan instruktur? Tulis di chat!

---

## Langkah 10–11 · Jawaban dengan kata-katamu

Notebook menyusun **draf**. Jangan disalin begitu saja!

Jawaban yang baik:
- Menyebut **fokus & periode**
- Menyebut **angka**: porsi, pertumbuhan, margin
- Rekomendasi berupa **tindakan** + cara mengukur keberhasilan
- Minimal **satu keterbatasan** (data sintetis, belum ada biaya promosi, ...)

**7 menit menulis.** Lalu 3–4 orang membacakan.

---

## Unggah ke repo `thelook-python-analysis`

| File | Lokasi |
| --- | --- |
| `10_my_question.sql` (fokusmu + jawaban singkat) | `my_question/` |
| `10_my_question.ipynb` (semua sel dijalankan) | `my_question/` |
| 2 grafik `12_...png` | `images/` |

Buat folder: **Add file → Create new file** → `my_question/README.md`

---

## PR sesi 12

1. Bagian 11 notebook: jawaban dengan **kata-katamu sendiri**
2. Bagian **Studi kasus** di README `thelook-python-analysis`: pertanyaan, fokus, jawaban, rekomendasi, grafik matriks
3. *(Opsional)* Jalankan ulang dengan fokus lain. Rekomendasinya sama?

**Sesi berikutnya:** Selasa, 8 Desember 2026, 20.00 WIB
Merapikan & menerbitkan portofolio (**sesi terakhir!**)
