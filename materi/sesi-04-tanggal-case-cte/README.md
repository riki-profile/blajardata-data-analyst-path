# Sesi 4 · Tanggal, CASE WHEN, CTE + Proyek SQL

**Selasa, 17 November 2026 · 20.00–21.40 WIB**

File kerja: [`04_dates_case_cte.sql`](04_dates_case_cte.sql)

## Tujuan sesi

Setelah sesi ini kamu bisa:

1. Mengolah kolom waktu: mengambil tanggal, bulan, tahun, dan selisih hari.
2. Membuat kategori baru dengan `CASE WHEN`, misalnya kelompok umur.
3. Memecah query panjang menjadi langkah-langkah yang mudah dibaca dengan CTE (`WITH`).
4. Mengenali pembersihan dasar di SQL: NULL, teks yang tidak seragam, duplikat.
5. Menyelesaikan **Proyek SQL**: menjawab 3 pertanyaan manajemen dan menuliskannya sebagai README portofolio `thelook-sql-analysis`.

## Agenda

| Waktu (WIB) | Bagian |
| --- | --- |
| 20.00–20.10 | Recap PR sesi 3 (umur & gender) |
| 20.10–20.25 | Demo: fungsi tanggal dan tren pendapatan bulanan |
| 20.25–20.37 | Demo: CASE WHEN dan kelompok umur |
| 20.37–20.50 | Demo: CTE (+ sekilas pembersihan dasar) |
| 20.50–21.25 | **Proyek SQL**: 3 query → 3 temuan → README (temuan 1 ditulis bersama) |
| 21.25–21.37 | Tanya jawab |
| 21.37–21.40 | Penutup dan PR |

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

Di kelas bagian ini hanya ditunjukkan sekilas; jalankan query bagian **E** sendiri di rumah. Pembersihan yang lebih lengkap ada di modul Python, sesi 8.

## 5. Demo

| Bagian | Pertanyaan |
| --- | --- |
| A. Tanggal | Tahun berapa saja data tersedia? Berapa hari pesanan sampai ke pelanggan? |
| B. Tren bulanan | Bagaimana pendapatan bulanan dalam 12 bulan terakhir? |
| C. CASE WHEN | Kelompok umur mana yang menyumbang pendapatan terbesar? |
| D. CTE | Berapa banyak pelanggan yang memesan lebih dari sekali? |
| E. Pembersihan | Ada data kosong atau duplikat? *(dibaca sendiri)* |

## 6. Proyek SQL: Kondisi Bisnis TheLook (di kelas, ±35 menit)

Modul SQL ditutup dengan proyek kecil yang masuk portofolio: menjawab **tiga pertanyaan besar manajemen** dari sesi 1 dengan SQL.

| Query | Pertanyaan manajemen | Yang dihitung |
| --- | --- | --- |
| **P1** | Bagaimana kondisi bisnis kita? | Pendapatan, pesanan, AOV: 12 bulan terakhir vs 12 bulan sebelumnya |
| **P2** | Di mana uang kita dihasilkan? | Porsi pendapatan dan margin % per kategori |
| **P3** | Apakah pelanggan kembali berbelanja? | Persentase pelanggan yang belanja 1 kali, 2 kali, 3+ kali |

Ketiga query sudah ditulis di bagian **PROYEK SQL** file kerja; semuanya memakai yang kamu pelajari di sesi 2–4 (agregasi, JOIN, CASE WHEN, CTE). Tugasmu adalah **pekerjaan analis yang sesungguhnya**: menjalankan, membaca hasil, dan menuliskan kesimpulan.

**Langkahnya:**

1. Jalankan P1, P2, P3 satu per satu.
2. Di bawah setiap query, tulis **temuan** dalam 1–2 kalimat, dengan angka. Format: **apa** → **kenapa penting**.
3. Tulis **1 rekomendasi** untuk manajemen berdasarkan ketiga temuan.
4. Salin temuan dan rekomendasi ke `README.md` repo `thelook-sql-analysis`, memakai [template README SQL](../../template-portofolio/thelook-sql-analysis/README.md).

Di kelas kita menulis **temuan 1 bersama-sama**. Temuan 2, 3, dan rekomendasi dilanjutkan di rumah.

**Contoh temuan yang baik:**

> Pendapatan 12 bulan terakhir naik X% dibanding 12 bulan sebelumnya, dari A menjadi B USD. Kenaikannya datang dari jumlah pesanan, sedangkan AOV hampir tidak berubah, jadi bisnis tumbuh karena makin banyak orang berbelanja, bukan karena belanja per pesanan naik.

## 7. PR (30–60 menit)

1. **Wajib:** selesaikan temuan 2, temuan 3, dan rekomendasi di file kerja, lalu lengkapi `README.md` repo `thelook-sql-analysis`.
2. **Wajib:** unggah `sql/04_dates_case_cte.sql`. Pastikan `sql/01_basics.sql` sampai `sql/03_joins.sql` juga sudah ada.
3. Latihan tambahan G1–G2 di file kerja (pendapatan per tahun, kelompok harga produk).
4. *(Bonus, opsional)* **Tabel analisis**: satu query, satu baris per barang terjual, untuk yang lanjut ke modul Python. Notebook sesi 7 sudah berisi versi instruktur, jadi bagian ini tidak wajib.

<details>
<summary>Spesifikasi kolom tabel analisis (bonus)</summary>

| Kolom | Asal |
| --- | --- |
| `order_item_id`, `order_id`, `user_id`, `product_id`, `status` | `order_items` |
| `order_date`, `order_month` | tanggal dan awal bulan dari `order_items.created_at` |
| `sale_price` | `order_items` |
| `cost`, `margin` | `products.cost`; `margin = sale_price - cost` |
| `category`, `brand`, `department` | `products` (brand kosong → `'Tidak diketahui'`) |
| `age`, `age_band`, `gender`, `country`, `traffic_source` | `users`; `age_band` dengan `CASE WHEN` |

Syarat: tanpa `Cancelled`/`Returned`, tanpa bulan berjalan, minimal satu CTE. Kerangka ada di bagian **BONUS** file kerja.

</details>

## Ringkasan

- `DATE()`, `EXTRACT()`, `DATE_TRUNC()`, `DATE_DIFF()` untuk mengolah waktu. Buang bulan berjalan saat membuat tren.
- `CASE WHEN` membuat kategori baru; kondisi dicek dari atas ke bawah.
- CTE (`WITH ... AS`) memecah query panjang menjadi langkah bernama.
- Cek NULL, teks yang tidak seragam, dan duplikat sebelum menganalisis.
- Proyek SQL = query → temuan → rekomendasi → README. **Modul SQL selesai**, dan repo `thelook-sql-analysis` adalah portofolio modul ini.

**Sesi berikutnya:** Kamis, 19 November 2026, 20.00 WIB. Dasar Python I di Google Colab.
