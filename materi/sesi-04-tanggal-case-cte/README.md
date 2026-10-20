# Sesi 4 · Tanggal, CASE WHEN, CTE, dan Pembersihan Dasar

**Senin, 16 November 2026 · 20.00–21.40 WIB**

File kerja: [`04_dates_case_cte.sql`](04_dates_case_cte.sql)

## Tujuan sesi

Setelah sesi ini kamu bisa:

1. Mengolah kolom waktu: mengambil tanggal, bulan, tahun, dan selisih hari.
2. Membuat kategori baru dengan `CASE WHEN`, misalnya kelompok umur.
3. Memecah query panjang menjadi langkah-langkah yang mudah dibaca dengan CTE (`WITH`).
4. Melakukan pembersihan dasar: menangani NULL, merapikan teks, dan mengecek duplikat.
5. Menyusun satu **tabel analisis** yang akan kita pakai lagi di Python dan dashboard.

## Agenda

| Waktu (WIB) | Bagian |
| --- | --- |
| 20.00–20.15 | Recap PR sesi 3 (umur & gender) |
| 20.15–20.35 | Demo: fungsi tanggal dan tren pendapatan bulanan |
| 20.35–20.50 | Demo: CASE WHEN dan kelompok umur |
| 20.50–21.05 | Demo: CTE dan pembersihan dasar |
| 21.05–21.15 | Giliran kamu |
| 21.15–21.35 | Tanya jawab + penjelasan PR "tabel analisis" |
| 21.35–21.40 | Penutup |

## 1. Bekerja dengan tanggal dan waktu

Kolom `created_at` bertipe `TIMESTAMP` (tanggal + jam, dalam UTC). Fungsi yang paling sering dipakai:

| Fungsi | Hasil untuk `2025-03-17 14:05:00` | Kegunaan |
| --- | --- | --- |
| `DATE(created_at)` | `2025-03-17` | Membuang jam |
| `EXTRACT(YEAR FROM created_at)` | `2025` | Tahun saja (juga `MONTH`, `DAY`, `HOUR`) |
| `DATE_TRUNC(DATE(created_at), MONTH)` | `2025-03-01` | "Membulatkan" ke awal bulan; cocok untuk tren bulanan |
| `FORMAT_DATE('%Y-%m', DATE(created_at))` | `'2025-03'` | Tanggal sebagai teks |
| `DATE_DIFF(tgl_akhir, tgl_awal, DAY)` | angka | Selisih hari |
| `CURRENT_DATE()` | tanggal hari ini | |
| `DATE_SUB(CURRENT_DATE(), INTERVAL 12 MONTH)` | 12 bulan lalu | |

**Bulan berjalan belum lengkap.** Untuk tren bulanan, selalu buang bulan ini:

```sql
WHERE DATE(oi.created_at) < DATE_TRUNC(CURRENT_DATE(), MONTH)
```

## 2. CASE WHEN: membuat kategori sendiri

```sql
CASE
  WHEN u.age < 18 THEN 'Di bawah 18'
  WHEN u.age < 25 THEN '18-24'
  WHEN u.age < 35 THEN '25-34'
  ELSE '35+'
END AS kelompok_umur
```

- Kondisi dicek **dari atas ke bawah**; yang pertama benar yang dipakai. Itu sebabnya `WHEN u.age < 25` tidak perlu menulis `AND u.age >= 18`.
- `ELSE` menangkap sisanya. Tanpa `ELSE`, sisanya menjadi NULL.
- Hasil `CASE WHEN` bisa dipakai di `GROUP BY`, seperti kolom biasa.

## 3. CTE: query bertahap dengan `WITH`

Query yang panjang lebih mudah dibaca kalau dipecah menjadi langkah bernama:

```sql
WITH pesanan_per_pelanggan AS (      -- langkah 1: hitung pesanan setiap pelanggan
  SELECT user_id, COUNT(*) AS jumlah_pesanan
  FROM `bigquery-public-data.thelook_ecommerce.orders`
  GROUP BY user_id
)
SELECT                               -- langkah 2: pakai hasil langkah 1
  jumlah_pesanan,
  COUNT(*) AS jumlah_pelanggan
FROM pesanan_per_pelanggan
GROUP BY jumlah_pesanan
ORDER BY jumlah_pesanan;
```

Anggap CTE sebagai **tabel sementara** yang hanya hidup selama query itu berjalan. Beberapa CTE bisa dipisahkan dengan koma: `WITH a AS (...), b AS (...) SELECT ...`.

## 4. Pembersihan data dasar di SQL

| Masalah | Cara cek | Cara atasi |
| --- | --- | --- |
| Nilai kosong (NULL) | `COUNTIF(brand IS NULL)` | `COALESCE(brand, 'Tidak diketahui')` |
| Spasi berlebih, huruf tidak seragam | `SELECT DISTINCT ...` | `TRIM()`, `LOWER()`, `UPPER()`, `INITCAP()` |
| Ejaan berbeda untuk hal yang sama | `SELECT DISTINCT country` | `CASE WHEN country = 'Brasil' THEN 'Brazil' ... END` |
| Baris duplikat | `COUNT(*)` vs `COUNT(DISTINCT id)` | `SELECT DISTINCT` atau perbaiki JOIN |
| Pembagian dengan nol | | `SAFE_DIVIDE(a, b)` menghasilkan NULL, bukan error |

Pembersihan yang lebih lengkap kita lakukan di Python, sesi 8.

## 5. Demo

| Bagian | Pertanyaan |
| --- | --- |
| A. Tanggal | Tahun berapa saja data tersedia? Berapa hari pesanan sampai ke pelanggan? |
| B. Tren bulanan | Bagaimana pendapatan bulanan dalam 12 bulan terakhir? |
| C. CASE WHEN | Kelompok umur mana yang menyumbang pendapatan terbesar? |
| D. CTE | Berapa banyak pelanggan yang memesan lebih dari sekali? |
| E. Pembersihan | Ada data kosong atau duplikat? |
| F. Tabel analisis | Contoh kerangka tabel analisis untuk PR |

## 6. Giliran kamu (±10 menit)

1. Pendapatan per **tahun** (`EXTRACT(YEAR ...)`), hanya untuk tahun yang sudah lengkap.
2. Kelompokkan produk berdasarkan harga dengan `CASE WHEN`: `Murah` (< 25), `Sedang` (25–75), `Mahal` (> 75). Berapa jumlah produk di setiap kelompok?

## 7. PR: tabel analisis (30–60 menit)

Tulis **satu query** yang menghasilkan tabel dengan **satu baris per barang terjual** dan kolom berikut. Tabel inilah yang akan kita muat ke Python di sesi 7, jadi buat serapi mungkin dan beri komentar.

| Kolom | Asal |
| --- | --- |
| `order_item_id`, `order_id`, `user_id`, `product_id` | `order_items` |
| `status` | `order_items` |
| `order_date` | tanggal dari `order_items.created_at` |
| `order_month` | awal bulan dari `order_date` |
| `sale_price` | `order_items` |
| `cost`, `margin` | `products.cost`; `margin = sale_price - cost` |
| `category`, `brand`, `department` | `products` (brand kosong → `'Tidak diketahui'`) |
| `age`, `age_band`, `gender`, `country`, `traffic_source` | `users`; `age_band` dibuat dengan `CASE WHEN` |

Syarat:

- Hanya barang yang **tidak** `Cancelled` atau `Returned`.
- Buang bulan berjalan.
- Gunakan minimal **satu CTE**.

Kerangka awalnya ada di bagian **F** file kerja. Unggah sebagai `sql/04_dates_case_cte.sql`.

## Ringkasan

- `DATE()`, `EXTRACT()`, `DATE_TRUNC()`, `DATE_DIFF()` untuk mengolah waktu. Buang bulan berjalan saat membuat tren.
- `CASE WHEN` membuat kategori baru; kondisi dicek dari atas ke bawah.
- CTE (`WITH ... AS`) memecah query panjang menjadi langkah bernama.
- Cek NULL, teks yang tidak seragam, dan duplikat sebelum menganalisis.
- Modul SQL selesai. Mulai sesi 5 kita pindah ke Python.

**Sesi berikutnya:** Rabu, 18 November 2026, 20.00 WIB. Dasar Python I di Google Colab.
