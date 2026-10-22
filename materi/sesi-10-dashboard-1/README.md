# Sesi 10 · Dashboard Pertama di Power BI

**Selasa, 1 Desember 2026 · 20.00–21.40 WIB**

> **Baru bergabung di modul Power BI?** Selamat datang! Pastikan persiapan modul Power BI di [PERSIAPAN.md](../../PERSIAPAN.md#mulai-dari-modul-python-atau-power-bi) sudah selesai: Power BI Desktop terinstall (pengguna Mac: [panduan Parallels](../../PANDUAN_MAC_PARALLELS.md)) dan akun GitHub siap. Baca juga [KAMUS_DATA.md](../../KAMUS_DATA.md) untuk mengenal dataset TheLook. Recap di awal kelas membahas modul Python; kamu cukup menyimak.

**Wajib sebelum kelas:** Power BI Desktop sudah terinstall dan pernah dibuka sekali. Lihat [PERSIAPAN.md](../../PERSIAPAN.md#sebelum-sesi-10).

| File | Fungsi |
| --- | --- |
| **3 file CSV** (link Google Drive dibagikan di grup kelas) | Data penjualan, produk, dan pelanggan TheLook |
| [panduan-power-bi.md](panduan-power-bi.md) | Langkah demi langkah di Power BI Desktop |
| [`10_export_dashboard_data.ipynb`](10_export_dashboard_data.ipynb) · [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/riki-profile/blajardata-data-analyst-path/blob/main/materi/sesi-10-dashboard-1/10_export_dashboard_data.ipynb) | *(Opsional)* Cara membuat 3 file CSV itu sendiri dari BigQuery |

## Tujuan sesi

Setelah sesi ini kamu bisa:

1. Memuat file data ke Power BI Desktop dan mengecek tipe datanya.
2. Membuat **relasi** antar tabel (seperti JOIN, tapi di Power BI).
3. Membuat *measure* DAX: pendapatan, jumlah pesanan, dan AOV.
4. Membuat kartu KPI dan 2 grafik: tren bulanan dan pendapatan per kategori.
5. Membuat repo portofolio modul Power BI, `thelook-powerbi-dashboard`.

## Agenda

| Waktu (WIB) | Bagian |
| --- | --- |
| 20.00–20.10 | Recap modul Python, sambutan peserta baru modul Power BI |
| 20.10–20.20 | Apa itu dashboard; unduh 3 file CSV |
| 20.20–20.35 | Demo: memuat data, mengecek tipe data, membuat relasi |
| 20.35–21.05 | Demo: measure, kartu KPI, grafik tren bulanan, grafik kategori |
| 21.05–21.15 | Giliran kamu |
| 21.15–21.30 | Tanya jawab (berbagi layar untuk masalah instalasi/data) |
| 21.30–21.37 | **Simpan dashboard bersama-sama** (wajib, di kelas) |
| 21.37–21.40 | Penutup dan PR |

## 1. Apa itu dashboard?

Dashboard adalah **satu halaman** yang menjawab pertanyaan rutin dengan cepat, seperti "bagaimana penjualan bulan ini?", dan bisa dijelajahi sendiri oleh pembacanya lewat filter. Notebook atau query cocok untuk **menemukan** jawaban; dashboard cocok untuk **memantau** dan **membagikan** jawaban itu.

Dashboard yang kita bangun di sesi 10–11, dibaca dari atas ke bawah:

| Posisi | Isi |
| --- | --- |
| Atas | Judul berisi kesimpulan utama · filter tanggal dan kategori |
| Baris KPI | Pendapatan · Jumlah pesanan · AOV · Margin % |
| Tengah | Tren pendapatan bulanan (garis) |
| Bawah | Pendapatan per kategori (batang horizontal) · grafik tambahan (PR) |

## 2. Data: 3 file CSV

Unduh ketiga file dari link Google Drive di grup kelas, lalu simpan dalam **satu folder**, misalnya `Documents\thelook-dashboard\` (pengguna Mac: simpan di dalam Windows).

| File | Satu baris = | Kolom |
| --- | --- | --- |
| `penjualan.csv` (fakta) | satu barang terjual | `order_item_id`, `order_id`, `user_id`, `product_id`, `order_date`, `sale_price`, `cost` |
| `produk.csv` (dimensi) | satu produk | `product_id`, `product_name`, `category`, `brand`, `department`, `retail_price` |
| `pelanggan.csv` (dimensi) | satu pelanggan | `user_id`, `age`, `age_band`, `gender`, `country`, `traffic_source` |

Data sudah **tanpa** barang `Cancelled`/`Returned` dan tanpa bulan berjalan. Di folder Drive yang sama ada angka **"Cek cepat"** (pendapatan, jumlah pesanan, AOV) untuk mencocokkan hasilmu.

**Relasi yang akan dibuat:**

```
produk (1) ───< penjualan >─── (1) pelanggan
  product_id = product_id   user_id = user_id
```

Satu produk bisa terjual berkali-kali (*one-to-many*). Ini sama dengan JOIN di SQL, bedanya Power BI melakukannya otomatis setiap kali grafik dibuat.

> Power BI juga bisa terhubung langsung ke BigQuery (**Get data → Google BigQuery**). Di kelas kita memakai CSV supaya semua peserta, termasuk yang belum memakai BigQuery, memakai cara yang sama.

## 3. Measure utama (DAX)

| Measure | DAX |
| --- | --- |
| Pendapatan | `SUM(penjualan[sale_price])` |
| Jumlah Pesanan | `DISTINCTCOUNT(penjualan[order_id])` |
| AOV | `DIVIDE([Pendapatan], [Jumlah Pesanan])` |

**Cek kebenaran:** angka di kartu KPI harus **sama** dengan angka "Cek cepat". Kalau berbeda, cek tipe data (terutama locale impor) dan relasinya.

## 4. Demo

Ikuti [panduan Power BI Desktop](panduan-power-bi.md) langkah demi langkah bersama instruktur.

## 5. Giliran kamu (±10 menit)

Ubah judul kedua grafik menjadi **kalimat kesimpulan**. Contoh: "Pendapatan naik 9% dalam 12 bulan terakhir".

## 6. Simpan dashboard (di kelas, sebelum Zoom ditutup)

Sesi 11 melanjutkan dashboard ini. **Kalau tidak disimpan, kamu harus mulai dari nol.** Kita simpan bersama-sama di akhir kelas:

**File → Save as** → `thelook_dashboard.pbix`, di folder yang sama dengan 3 file CSV.

Ketik `1` di chat Zoom setelah berhasil menyimpan.

> **Dashboard hilang atau rusak?** Instruktur membagikan dashboard cadangan (`.pbix`) di grup kelas. Unduh dan lanjutkan dari situ di sesi 11.

## 7. PR (30–60 menit)

1. Tambahkan **2 grafik lagi** ke dashboard. Ide: pendapatan per negara, per kelompok umur, per traffic source, atau perbandingan department Men vs Women.
2. **Simpan lagi** (**Ctrl + S**), lalu ekspor ke PDF: **File → Export → Export to PDF**.
3. Ambil **screenshot** dashboard (**Win + Shift + S**).
4. Buat repo **`thelook-powerbi-dashboard`** (langkahnya di [PANDUAN_GITHUB.md](../../PANDUAN_GITHUB.md)), lalu unggah:
   - `dashboard/thelook_dashboard.pbix` dan `dashboard/thelook_dashboard.pdf`
   - `images/dashboard_v1.png`

## Ringkasan

- Dashboard = satu halaman untuk memantau dan membagikan jawaban.
- Tabel fakta (kejadian) + tabel dimensi (deskripsi), dihubungkan dengan relasi.
- Pesanan dihitung dengan **distinct count** `order_id`, sama seperti `COUNT(DISTINCT)` di SQL.
- Selalu cocokkan angka KPI dengan sumber lain.

**Sesi berikutnya:** Kamis, 3 Desember 2026, 20.00 WIB. Filter, margin, desain, dan storytelling.
