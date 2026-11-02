# Sesi 2 · Agregasi dan Membuat Portofolio di GitHub

**Kamis, 12 November 2026 · 20.00–21.40 WIB**

File kerja: [`02_aggregation.sql`](02_aggregation.sql)

## Tujuan sesi

Setelah sesi ini kamu bisa:

1. Meringkas data dengan `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`.
2. Mengelompokkan hasil dengan `GROUP BY` dan memfilter kelompok dengan `HAVING`.
3. Membuat repository portofolio modul SQL, `thelook-sql-analysis`, di GitHub dan mengunggah file pertamamu.

## Agenda

| Waktu (WIB) | Bagian |
| --- | --- |
| 20.00–20.05 | Recap sesi 1 |
| 20.05–20.40 | Konsep & demo: fungsi agregasi, GROUP BY, HAVING |
| 20.40–20.50 | **Kerjakan bersama** |
| 20.50–21.15 | **Unggah bersama**: buat repo `thelook-sql-analysis`, unggah `01_basics.sql` dan `02_aggregation.sql` |
| 21.15–21.35 | Tanya jawab |
| 21.35–21.40 | Penutup |

## 1. Fungsi agregasi

Fungsi agregasi mengubah **banyak baris menjadi satu angka**.

| Fungsi | Arti | Contoh |
| --- | --- | --- |
| `COUNT(*)` | jumlah baris | `COUNT(*)` |
| `COUNT(kolom)` | jumlah baris yang kolomnya **tidak** NULL | `COUNT(shipped_at)` |
| `COUNT(DISTINCT kolom)` | jumlah nilai unik | `COUNT(DISTINCT user_id)` |
| `SUM(kolom)` | total | `SUM(sale_price)` |
| `AVG(kolom)` | rata-rata | `AVG(retail_price)` |
| `MIN(kolom)`, `MAX(kolom)` | terkecil, terbesar | `MIN(created_at)` |
| `ROUND(angka, n)` | bulatkan ke n desimal | `ROUND(AVG(retail_price), 2)` |

## 2. GROUP BY: satu angka untuk setiap kelompok

```sql
SELECT
  status,                        -- kolom pengelompokan
  COUNT(*) AS jumlah_pesanan     -- agregasi untuk setiap kelompok
FROM `bigquery-public-data.thelook_ecommerce.orders`
GROUP BY status
ORDER BY jumlah_pesanan DESC;
```

Bayangkan BigQuery memilah semua baris ke dalam "keranjang" berdasarkan `status`, lalu menghitung isi setiap keranjang.

**Aturan emas:** setiap kolom di `SELECT` harus **ada di `GROUP BY`** atau **dibungkus fungsi agregasi**. Kalau tidak, muncul error seperti `SELECT list expression references column ... which is neither grouped nor aggregated`.

## 3. WHERE vs HAVING

| | `WHERE` | `HAVING` |
| --- | --- | --- |
| Memfilter | baris, **sebelum** dikelompokkan | kelompok, **sesudah** dikelompokkan |
| Bisa memakai agregasi? | Tidak | Ya |
| Contoh | `WHERE status = 'Complete'` | `HAVING COUNT(*) > 1000` |

Urutan penulisan: `SELECT` → `FROM` → `WHERE` → `GROUP BY` → `HAVING` → `ORDER BY` → `LIMIT`.

## 4. Pendapatan per kategori, tanpa JOIN dulu

Pendapatan paling tepat dihitung dari `order_items.sale_price`, tetapi kategori produk ada di tabel `products`. Menggabungkan dua tabel butuh `JOIN`, yang kita pelajari di sesi 3.

Untuk hari ini kita pakai jalan pintas: tabel `inventory_items` sudah menyimpan salinan kategori, brand, dan harga produk. Barang yang kolom `sold_at`-nya terisi berarti sudah terjual. Hasilnya adalah **perkiraan** pendapatan. Di sesi 3 kita hitung versi yang tepat dan membandingkan keduanya.

## 5. Demo SQL

Buka [`02_aggregation.sql`](02_aggregation.sql) dan jalankan bersama instruktur.

| Bagian | Pertanyaan |
| --- | --- |
| A. Agregasi sederhana | Berapa total pelanggan, pesanan, dan rata-rata harga produk? |
| B. GROUP BY | Berapa pesanan per status? Berapa pelanggan per negara? |
| C. Pendapatan per kategori | Kategori mana yang paling banyak menghasilkan uang? |
| D. HAVING | Negara mana yang punya lebih dari 1.000 pelanggan? |

## 6. Demo GitHub: membuat repository portofolio

Semua langkah lewat browser, tanpa command line. Langkah yang sama ada di [PANDUAN_GITHUB.md](../../PANDUAN_GITHUB.md), yang dipakai lagi di awal modul Python dan Power BI.

### 6a. Membuat repository

1. Login ke [github.com](https://github.com) → tombol **+** di kanan atas → **New repository**.
2. **Repository name:** `thelook-sql-analysis`
3. **Description:** `Analisis kondisi bisnis e-commerce TheLook dengan SQL (BigQuery)`
4. Pilih **Public** (portofolio harus bisa dilihat orang lain).
5. Centang **Add a README file**.
6. Klik **Create repository**.

### 6b. Membuat folder dan mengunggah file

GitHub tidak bisa membuat folder kosong. Folder otomatis terbentuk saat kamu membuat file di dalamnya.

**Cara 1: Create new file (paling mudah untuk file SQL)**

1. Di halaman repo → **Add file** → **Create new file**.
2. Di kotak nama file, ketik `sql/01_basics.sql`. Saat kamu mengetik `/`, GitHub otomatis membuat folder `sql`.
3. Tempel isi query-mu ke editor.
4. Klik **Commit changes...** → tulis pesan singkat, misalnya `Tambah query dasar sesi 1` → **Commit changes**.

**Cara 2: Upload files (untuk file yang sudah ada di laptop)**

1. Masuk ke folder tujuan (misalnya klik folder `sql`).
2. **Add file** → **Upload files** → seret file ke halaman.
3. Tulis pesan commit → **Commit changes**.

### 6c. Mengganti isi file yang sudah ada

Buka file di GitHub → ikon **pensil** (Edit this file) → ubah → **Commit changes**.

> **Commit** = menyimpan perubahan beserta catatan apa yang diubah. Tulis pesan commit yang jelas, misalnya `Tambah query agregasi sesi 2`, bukan `update`.

Struktur akhir repo SQL:

```
thelook-sql-analysis/
├── README.md       ← diisi di sesi 4 (Proyek SQL)
└── sql/            ← hari ini, sesi 3, dan sesi 4
```

Setiap modul punya repo portofolionya sendiri: modul Python membuat `thelook-python-analysis` (sesi 5), modul Power BI membuat `thelook-powerbi-dashboard` (sesi 10).

## 7. Kerjakan bersama (±10 menit)

Instruktur mengerjakannya langkah demi langkah di layar, dan kamu mengetik bersamaan di file kerjamu. Tidak perlu menebak jawabannya sendiri dulu. Bagian **KERJAKAN BERSAMA** di `02_aggregation.sql`:

1. Berapa jumlah produk dan rata-rata harga **untuk setiap department** (`Men`/`Women`)?
2. Berapa jumlah pelanggan untuk setiap `traffic_source`? Urutkan dari yang terbanyak.

## 8. Unggah bersama (di kelas)

Ikuti demo GitHub di bagian 6 bersama instruktur. Di akhir sesi, repo `thelook-sql-analysis` sudah berisi:

- `sql/01_basics.sql`
- `sql/02_aggregation.sql`

Kirim link repo-mu ke chat Zoom, contohnya `https://github.com/username/thelook-sql-analysis`.

## 9. Latihan mandiri (opsional)

Tidak wajib dan tidak dinilai. Untuk yang ingin berlatih lebih, kerjakan bagian **LATIHAN MANDIRI** di file kerja; jawabannya dibagikan instruktur setelah kelas.

- **Top 10 brand berdasarkan pendapatan** (perkiraan, memakai `inventory_items`): jumlah barang terjual, pendapatan, dan rata-rata harga per brand, plus satu kalimat temuan.

## Checklist hasil (dicek bersama sebelum kelas ditutup)

Sebelum kelas ditutup, instruktur membacakan daftar ini satu per satu. Ketik `1` di chat kalau sudah, `2` kalau belum; yang belum akan dibantu. Kalau kamu absen, pakai daftar ini untuk mengecek hasilmu setelah menonton rekaman.

- [ ] B1–B2 terisi di `02_aggregation.sql`
- [ ] Repo **`thelook-sql-analysis`** ada, **Public**, dengan `README.md`
- [ ] Repo berisi `sql/01_basics.sql` dan `sql/02_aggregation.sql` (di dalam folder `sql`, bukan di root)
- [ ] Link repo-mu sudah ditempel di chat Zoom

## Ringkasan

- Agregasi mengubah banyak baris menjadi satu angka; `GROUP BY` melakukannya per kelompok.
- Kolom di `SELECT` harus ada di `GROUP BY` atau dibungkus agregasi.
- `WHERE` memfilter baris sebelum dikelompokkan; `HAVING` memfilter kelompok sesudahnya.
- Repo portofolio sudah jadi. Mulai sekarang, **unggah file setiap selesai sesi**.

**Sesi berikutnya:** Sabtu, 14 November 2026, 14.00 WIB. JOIN: menggabungkan pesanan, produk, dan pelanggan.
