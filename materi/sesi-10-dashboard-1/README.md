# Sesi 10 · Dashboard Pertama

**Selasa, 1 Desember 2026 · 20.00–21.40 WIB**

**Wajib sebelum kelas:** Power BI Desktop (Windows) atau Tableau Public (Mac/Windows) sudah terinstall. Lihat [PERSIAPAN.md](../../PERSIAPAN.md#sebelum-sesi-10).

| File | Fungsi |
| --- | --- |
| [`10_export_dashboard_data.ipynb`](10_export_dashboard_data.ipynb) · [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/riki-profile/blajardata-data-analyst-path/blob/main/materi/sesi-10-dashboard-1/10_export_dashboard_data.ipynb) | Mengekspor 3 file CSV dari BigQuery |
| [panduan-power-bi.md](panduan-power-bi.md) | Langkah demi langkah di Power BI Desktop |
| [panduan-tableau.md](panduan-tableau.md) | Langkah demi langkah di Tableau Public |

## Tujuan sesi

Setelah sesi ini kamu bisa:

1. Menghubungkan file data ke Power BI atau Tableau.
2. Membuat **relasi** antar tabel (seperti JOIN, tapi di tools dashboard).
3. Membuat ukuran (*measure*) pendapatan, jumlah pesanan, dan AOV.
4. Membuat kartu KPI dan membangun ulang 2 grafik dari sesi 8.

## Agenda

| Waktu (WIB) | Bagian |
| --- | --- |
| 20.00–20.10 | Recap PR sesi 9 (3 temuan) |
| 20.10–20.20 | Apa itu dashboard; ekspor data dengan notebook (semua peserta menjalankannya) |
| 20.20–20.35 | Demo: memuat data, mengecek tipe data, membuat relasi |
| 20.35–21.05 | Demo: measure, kartu KPI, grafik tren bulanan, grafik kategori |
| 21.05–21.15 | Giliran kamu |
| 21.15–21.30 | Tanya jawab (berbagi layar untuk masalah instalasi/data) |
| 21.30–21.37 | **Simpan dashboard bersama-sama** (wajib, di kelas) |
| 21.37–21.40 | Penutup dan PR |

## 1. Apa itu dashboard?

Dashboard adalah **satu halaman** yang menjawab pertanyaan rutin dengan cepat, seperti "bagaimana penjualan bulan ini?", dan bisa dijelajahi sendiri oleh pembacanya lewat filter. Notebook cocok untuk **menemukan** jawaban; dashboard cocok untuk **memantau** dan **membagikan** jawaban itu.

Dashboard yang kita bangun di sesi 10–11:

```
┌───────────────────────────────────────────────────────────────┐
│ Judul + kalimat kesimpulan utama            [Filter tanggal]  │
│                                             [Filter kategori] │
├───────────────┬───────────────┬───────────────┬───────────────┤
│ Pendapatan    │ Jumlah pesanan│ AOV           │ Margin %      │  ← kartu KPI
├───────────────┴───────────────┴───────────────┴───────────────┤
│ Tren pendapatan bulanan (garis)                               │
├───────────────────────────────┬───────────────────────────────┤
│ Pendapatan per kategori       │ Grafik tambahan (PR)          │
│ (batang horizontal)           │                               │
└───────────────────────────────┴───────────────────────────────┘
```

## 2. Data: 3 file CSV

Jalankan [`10_export_dashboard_data.ipynb`](10_export_dashboard_data.ipynb) di Colab. Hasilnya 3 file:

| File | Satu baris = | Kolom |
| --- | --- | --- |
| `penjualan.csv` (fakta) | satu barang terjual | `order_item_id`, `order_id`, `user_id`, `product_id`, `order_date`, `sale_price`, `cost` |
| `produk.csv` (dimensi) | satu produk | `product_id`, `product_name`, `category`, `brand`, `department`, `retail_price` |
| `pelanggan.csv` (dimensi) | satu pelanggan | `user_id`, `age`, `age_band`, `gender`, `country`, `traffic_source` |

Data sudah **tanpa** barang `Cancelled`/`Returned` dan tanpa bulan berjalan.

**Relasi yang akan dibuat:**

```
produk (1) ───< penjualan >─── (1) pelanggan
  product_id = product_id   user_id = user_id
```

Satu produk bisa terjual berkali-kali (*one-to-many*). Ini sama dengan JOIN di sesi 3, bedanya tools dashboard melakukannya otomatis setiap kali grafik dibuat.

> Kenapa CSV, dan bukan langsung ke BigQuery? Tableau Public tidak bisa terhubung ke BigQuery, dan CSV membuat semua peserta memakai cara yang sama. Power BI sebenarnya bisa terhubung langsung (**Get data → Google BigQuery**). Silakan dicoba setelah kursus.

## 3. Ukuran (measure) utama

| Measure | Power BI (DAX) | Tableau (calculated field) |
| --- | --- | --- |
| Pendapatan | `SUM(penjualan[sale_price])` | `SUM([Sale Price])` |
| Jumlah Pesanan | `DISTINCTCOUNT(penjualan[order_id])` | `COUNTD([Order Id])` |
| AOV | `DIVIDE([Pendapatan], [Jumlah Pesanan])` | `SUM([Sale Price]) / COUNTD([Order Id])` |

**Cek kebenaran:** angka di kartu KPI harus **sama** dengan angka di bagian "Cek cepat" notebook ekspor. Kalau berbeda, cek tipe data dan relasinya.

## 4. Demo

Ikuti panduan sesuai tools kelas:

- [Panduan Power BI Desktop](panduan-power-bi.md)
- [Panduan Tableau Public](panduan-tableau.md)

## 5. Giliran kamu (±10 menit)

Ubah judul kedua grafik menjadi **kalimat kesimpulan**, seperti di sesi 8. Contoh: "Pendapatan naik 9% dalam 12 bulan terakhir".

## 6. Simpan dashboard (di kelas, sebelum Zoom ditutup)

Sesi 11 melanjutkan dashboard ini. **Kalau tidak disimpan, kamu harus mulai dari nol.** Kita simpan bersama-sama di akhir kelas:

- **Tableau:** **File → Save to Tableau Public As...** → login → beri nama `TheLook Dashboard`. Salin link dashboard-mu. Tableau Public **tidak** bisa menyimpan ke laptop; kalau aplikasinya ditutup tanpa disimpan, dashboard hilang.
- **Power BI:** **File → Save as** → `thelook_dashboard.pbix`, di folder yang sama dengan 3 file CSV.

Ketik `1` di chat Zoom setelah berhasil menyimpan.

> **Dashboard hilang atau rusak?** Instruktur membagikan dashboard cadangan di grup kelas. Unduh dan lanjutkan dari situ di sesi 11.

## 7. PR (30–60 menit)

1. Tambahkan **2 grafik lagi** ke dashboard. Ide: pendapatan per negara, per kelompok umur, per traffic source, atau perbandingan department Men vs Women.
2. **Simpan lagi** setelah menambah grafik (Tableau: **File → Save to Tableau Public**; Power BI: **Ctrl + S**). Power BI: ekspor juga ke PDF (**File → Export → Export to PDF**).
3. Ambil **screenshot** dashboard (Windows: **Win + Shift + S**; Mac: **Cmd + Shift + 4**).
4. Unggah ke portofolio:
   - `dashboard/README.md` berisi link Tableau Public, **atau** `dashboard/thelook_dashboard.pbix` + PDF-nya
   - `images/dashboard_v1.png`

## Ringkasan

- Dashboard = satu halaman untuk memantau dan membagikan jawaban.
- Tabel fakta (kejadian) + tabel dimensi (deskripsi), dihubungkan dengan relasi.
- Pesanan dihitung dengan **distinct count** `order_id`, sama seperti `COUNT(DISTINCT)` di SQL.
- Selalu cocokkan angka KPI dengan sumber lain.

**Sesi berikutnya:** Kamis, 3 Desember 2026, 20.00 WIB. Filter, margin, desain, dan storytelling.
