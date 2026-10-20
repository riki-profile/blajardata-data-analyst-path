---
marp: true
theme: default
paginate: true
size: 16:9
footer: "Sesi 10 · Dashboard Pertama"
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

# Sesi 10 · Dashboard Pertama

Data, relasi, measure, kartu KPI, grafik

Selasa, 1 Desember 2026 · 20.00–21.40 WIB

---

## Agenda

| Waktu | Bagian |
| --- | --- |
| 20.00 | Recap PR sesi 9 (temuan) |
| 20.10 | Apa itu dashboard; ekspor data |
| 20.20 | Memuat data, tipe data, relasi |
| 20.35 | Measure, kartu KPI, 2 grafik |
| 21.05 | Giliran kamu |
| 21.15 | Tanya jawab |
| 21.30 | **Simpan dashboard bersama-sama** |
| 21.37 | Penutup & PR |

Panduan: `panduan-power-bi.md` / `panduan-tableau.md`

---

## Notebook vs dashboard

| Notebook | Dashboard |
| --- | --- |
| Untuk **menemukan** jawaban | Untuk **memantau** dan **membagikan** jawaban |
| Dibaca analis | Dibaca manajemen |
| Banyak langkah | Satu halaman |

---

## Rancangan dashboard kita

Satu halaman, dibaca dari atas ke bawah:

| Posisi | Isi |
| --- | --- |
| Atas | Judul berisi kesimpulan utama · filter tanggal & kategori |
| Baris KPI | Pendapatan · Jumlah pesanan · AOV · Margin % |
| Tengah | Tren pendapatan bulanan (garis) |
| Bawah | Pendapatan per kategori · grafik tambahan (PR) |

Hari ini: KPI + 2 grafik. Sesi 11: filter, margin, desain.

---

## Langkah 0 · Ekspor data

Jalankan `10_export_dashboard_data.ipynb` di Colab → **3 file CSV dalam 1 folder**

| File | Satu baris = |
| --- | --- |
| `penjualan.csv` (fakta) | satu barang terjual |
| `produk.csv` (dimensi) | satu produk |
| `pelanggan.csv` (dimensi) | satu pelanggan |

Sudah tanpa Cancelled/Returned dan tanpa bulan berjalan.

Catat angka **"Cek cepat"**: pendapatan, pesanan, AOV

---

## Relasi = JOIN otomatis

```
produk (1) ───< penjualan >─── (1) pelanggan
  product_id = product_id     user_id = user_id
```

- **Fakta** = kejadian (penjualan) · **Dimensi** = deskripsi (produk, pelanggan)
- Satu produk terjual berkali-kali → *one-to-many*
- Hubungkan dimensi **ke tabel fakta**, bukan antar dimensi

**Power BI:** atur dulu *Locale for import* = **English (United States)**!
Kalau tidak, `49.99` bisa terbaca `4999`.

---

## Measure utama

| Measure | Power BI (DAX) | Tableau |
| --- | --- | --- |
| Pendapatan | `SUM(penjualan[sale_price])` | `SUM([Sale Price])` |
| Jumlah Pesanan | `DISTINCTCOUNT(penjualan[order_id])` | `COUNTD([Order Id])` |
| AOV | `DIVIDE([Pendapatan], [Jumlah Pesanan])` | `SUM([Sale Price]) / COUNTD([Order Id])` |

Pesanan = **distinct count**, sama seperti `COUNT(DISTINCT)` di SQL

**Cocokkan kartu KPI dengan "Cek cepat".** Ketik `1` kalau angkanya sama.

---

## Dua grafik dari sesi 8

**Tren pendapatan bulanan** → grafik garis
- Power BI: X = kolom `Bulan` (bukan Date Hierarchy)
- Tableau: Order Date → **Month** continuous (pil hijau)

**Pendapatan per kategori** → batang horizontal, **urutkan menurun**

Judul = **kesimpulan**, seperti di sesi 8

---

## Masalah yang sering terjadi

| Masalah | Penyebab |
| --- | --- |
| Pendapatan 100× terlalu besar | Locale impor (Power BI) |
| Semua kategori angkanya sama | Relasi belum ada / salah |
| "Count of order_id" terlalu besar | Pakai kolom, bukan measure distinct |
| Tren hanya beberapa titik | Masih level tahun/kuartal |

---

<!-- _class: lead -->

# Giliran kamu · 10 menit

Ubah judul kedua grafik menjadi **kalimat kesimpulan**

Contoh: *"Pendapatan naik 9% dalam 12 bulan terakhir"*

---

<!-- _class: lead -->

# Simpan sekarang, bersama-sama

**Tableau:** File → Save to Tableau Public As… → login → `TheLook Dashboard`
(tidak bisa simpan ke laptop!)

**Power BI:** File → Save as → `thelook_dashboard.pbix`

Ketik `1` setelah tersimpan. Sesi 11 melanjutkan dashboard ini.

---

## PR sesi 10

1. Tambahkan **2 grafik lagi**: per negara, kelompok umur, traffic source, atau Men vs Women
2. **Simpan lagi** (Power BI: juga Export to PDF)
3. Screenshot dashboard
4. Unggah: `dashboard/README.md` (link Tableau) **atau** `.pbix` + PDF, dan `images/dashboard_v1.png`

Dashboard hilang? Unduh **dashboard cadangan** dari grup kelas.

---

## Ringkasan

- Dashboard = satu halaman untuk memantau & membagikan
- Fakta + dimensi, dihubungkan dengan relasi
- Pesanan = distinct count
- Selalu cocokkan KPI dengan sumber lain

**Sesi berikutnya:** Kamis, 3 Desember 2026, 20.00 WIB
Filter, margin, desain, dan storytelling
