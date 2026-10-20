# Sesi 2 · Agregasi dan Membuat Portofolio di GitHub

**Rabu, 11 November 2026 · 20.00–21.40 WIB**

File kerja: [`02_aggregation.sql`](02_aggregation.sql)

## Tujuan sesi

Setelah sesi ini kamu bisa:

1. Meringkas data dengan `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`.
2. Mengelompokkan hasil dengan `GROUP BY` dan memfilter kelompok dengan `HAVING`.
3. Membuat repository portofolio `thelook-analysis` di GitHub dan mengunggah file pertamamu.

## Agenda

| Waktu (WIB) | Bagian |
| --- | --- |
| 20.00–20.15 | Recap PR sesi 1 |
| 20.15–20.45 | Konsep & demo: fungsi agregasi, GROUP BY, HAVING |
| 20.45–21.05 | Demo GitHub: buat repo, folder, unggah `01_basics.sql` |
| 21.05–21.15 | Giliran kamu |
| 21.15–21.35 | Tanya jawab |
| 21.35–21.40 | Penutup dan PR |

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

Semua langkah lewat browser, tanpa command line.

### 6a. Membuat repository

1. Login ke [github.com](https://github.com) → tombol **+** di kanan atas → **New repository**.
2. **Repository name:** `thelook-analysis`
3. **Description:** `Analisis data e-commerce TheLook dengan SQL (BigQuery), Python, dan dashboard`
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

> **Commit** = menyimpan perubahan beserta catatan apa yang diubah. Tulis pesan commit yang jelas, misalnya `Tambah PR sesi 2: top 10 brand`, bukan `update`.

Struktur akhir portofolio (kita isi bertahap):

```
thelook-analysis/
├── README.md
├── sql/            ← hari ini
├── notebooks/      ← sesi 5–9
├── dashboard/      ← sesi 10–11
├── my_question/    ← sesi 12
└── images/         ← sesi 8 dan seterusnya
```

## 7. Giliran kamu (±10 menit)

Di bagian **GILIRAN KAMU** di `02_aggregation.sql`:

1. Berapa jumlah produk dan rata-rata harga **untuk setiap department** (`Men`/`Women`)?
2. Berapa jumlah pelanggan untuk setiap `traffic_source`? Urutkan dari yang terbanyak.

## 8. PR (30–60 menit)

1. **Top 10 brand berdasarkan pendapatan** (perkiraan, memakai `inventory_items`). Tampilkan juga jumlah barang terjual dan rata-rata harga per brand. Tulis satu kalimat temuan sebagai komentar.
2. Pastikan repo `thelook-analysis` berisi:
   - `sql/01_basics.sql` (lengkap dengan PR sesi 1)
   - `sql/02_aggregation.sql` (lengkap dengan PR sesi 2)
3. Kirim link repo-mu ke grup kelas, contohnya `https://github.com/username/thelook-analysis`.

## Ringkasan

- Agregasi mengubah banyak baris menjadi satu angka; `GROUP BY` melakukannya per kelompok.
- Kolom di `SELECT` harus ada di `GROUP BY` atau dibungkus agregasi.
- `WHERE` memfilter baris sebelum dikelompokkan; `HAVING` memfilter kelompok sesudahnya.
- Repo portofolio sudah jadi. Mulai sekarang, **unggah file setiap selesai sesi**.

**Sesi berikutnya:** Kamis, 12 November 2026, 20.00 WIB. JOIN: menggabungkan pesanan, produk, dan pelanggan.
