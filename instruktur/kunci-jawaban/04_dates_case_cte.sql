-- =====================================================================
-- Sesi 4 · Tanggal, CASE WHEN, CTE, dan pembersihan dasar
-- Kursus  : Data Analysis dengan BigQuery, Python & BI
-- Dataset : bigquery-public-data.thelook_ecommerce
-- Nama    : >>> VERSI INSTRUKTUR · KUNCI JAWABAN · jangan dibagikan ke peserta <<<
-- Tanggal : 17 November 2026
-- =====================================================================


-- ---------------------------------------------------------------------
-- A. FUNGSI TANGGAL
-- ---------------------------------------------------------------------

-- A1. Berbagai cara mengambil bagian dari created_at
SELECT
  order_id,
  created_at,
  DATE(created_at) AS tanggal,
  EXTRACT(YEAR FROM created_at) AS tahun,
  EXTRACT(MONTH FROM created_at) AS bulan,
  DATE_TRUNC(DATE(created_at), MONTH) AS awal_bulan,
  FORMAT_DATE('%Y-%m', DATE(created_at)) AS tahun_bulan_teks
FROM `bigquery-public-data.thelook_ecommerce.orders`
LIMIT 10;

-- A2. Data tersedia dari tahun berapa sampai tahun berapa?
SELECT
  EXTRACT(YEAR FROM created_at) AS tahun,
  COUNT(*) AS jumlah_pesanan
FROM `bigquery-public-data.thelook_ecommerce.orders`
GROUP BY tahun
ORDER BY tahun;

-- A3. Berapa hari rata-rata dari pesanan dibuat sampai diterima pelanggan?
SELECT
  ROUND(AVG(DATE_DIFF(DATE(delivered_at), DATE(created_at), DAY)), 1) AS rata_hari_sampai,
  MIN(DATE_DIFF(DATE(delivered_at), DATE(created_at), DAY)) AS tercepat,
  MAX(DATE_DIFF(DATE(delivered_at), DATE(created_at), DAY)) AS terlama
FROM `bigquery-public-data.thelook_ecommerce.orders`
WHERE delivered_at IS NOT NULL;


-- ---------------------------------------------------------------------
-- B. TREN PENDAPATAN BULANAN
-- ---------------------------------------------------------------------

-- B1. Pendapatan per bulan dalam 12 bulan terakhir yang sudah lengkap
SELECT
  DATE_TRUNC(DATE(oi.created_at), MONTH) AS bulan,
  COUNT(DISTINCT oi.order_id) AS jumlah_pesanan,
  ROUND(SUM(oi.sale_price), 0) AS pendapatan_usd
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
WHERE oi.status NOT IN ('Cancelled', 'Returned')
  AND DATE(oi.created_at) >= DATE_SUB(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 12 MONTH)
  AND DATE(oi.created_at) < DATE_TRUNC(CURRENT_DATE(), MONTH)  -- buang bulan berjalan
GROUP BY bulan
ORDER BY bulan;

-- Tip: di hasil query, klik tab "Chart" untuk melihat grafiknya langsung.

-- B2. Hari apa pelanggan paling banyak berbelanja?
--     FORMAT_DATE('%A', ...) menghasilkan nama hari (Monday, Tuesday, ...)
SELECT
  FORMAT_DATE('%A', DATE(created_at)) AS hari,
  COUNT(*) AS jumlah_pesanan
FROM `bigquery-public-data.thelook_ecommerce.orders`
GROUP BY hari
ORDER BY jumlah_pesanan DESC;


-- ---------------------------------------------------------------------
-- C. CASE WHEN: membuat kategori sendiri
-- ---------------------------------------------------------------------

-- C1. Kelompok umur pelanggan
SELECT
  CASE
    WHEN age < 18 THEN '1. Di bawah 18'
    WHEN age < 25 THEN '2. 18-24'
    WHEN age < 35 THEN '3. 25-34'
    WHEN age < 45 THEN '4. 35-44'
    WHEN age < 55 THEN '5. 45-54'
    ELSE '6. 55+'
  END AS kelompok_umur,
  COUNT(*) AS jumlah_pelanggan
FROM `bigquery-public-data.thelook_ecommerce.users`
GROUP BY kelompok_umur
ORDER BY kelompok_umur;
-- Angka "1.", "2." di depan label membuat urutannya benar saat ORDER BY.

-- C2. Kelompok umur mana yang menyumbang pendapatan terbesar?
SELECT
  CASE
    WHEN u.age < 18 THEN '1. Di bawah 18'
    WHEN u.age < 25 THEN '2. 18-24'
    WHEN u.age < 35 THEN '3. 25-34'
    WHEN u.age < 45 THEN '4. 35-44'
    WHEN u.age < 55 THEN '5. 45-54'
    ELSE '6. 55+'
  END AS kelompok_umur,
  COUNT(DISTINCT oi.user_id) AS pembeli,
  ROUND(SUM(oi.sale_price), 0) AS pendapatan_usd
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN `bigquery-public-data.thelook_ecommerce.users` AS u
  ON oi.user_id = u.id
WHERE oi.status NOT IN ('Cancelled', 'Returned')
GROUP BY kelompok_umur
ORDER BY kelompok_umur;

-- C3. CASE WHEN di dalam agregasi: menghitung beberapa status sekaligus
SELECT
  EXTRACT(YEAR FROM created_at) AS tahun,
  COUNT(*) AS semua_pesanan,
  COUNTIF(status = 'Returned') AS dikembalikan,
  ROUND(100 * COUNTIF(status = 'Returned') / COUNT(*), 1) AS persen_dikembalikan,
  SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) AS dibatalkan
FROM `bigquery-public-data.thelook_ecommerce.orders`
GROUP BY tahun
ORDER BY tahun;
-- COUNTIF(kondisi) adalah versi singkat dari SUM(CASE WHEN kondisi THEN 1 ELSE 0 END)


-- ---------------------------------------------------------------------
-- D. CTE: query bertahap dengan WITH
-- ---------------------------------------------------------------------

-- D1. Berapa banyak pelanggan yang memesan 1 kali, 2 kali, 3 kali, dst.?
WITH pesanan_per_pelanggan AS (
  SELECT
    user_id,
    COUNT(*) AS jumlah_pesanan
  FROM `bigquery-public-data.thelook_ecommerce.orders`
  WHERE status NOT IN ('Cancelled', 'Returned')
  GROUP BY user_id
)
SELECT
  jumlah_pesanan,
  COUNT(*) AS jumlah_pelanggan
FROM pesanan_per_pelanggan
GROUP BY jumlah_pesanan
ORDER BY jumlah_pesanan;

-- D2. Dua CTE: pendapatan bulanan, lalu pertumbuhan dibanding bulan sebelumnya
WITH bulanan AS (
  SELECT
    DATE_TRUNC(DATE(created_at), MONTH) AS bulan,
    SUM(sale_price) AS pendapatan
  FROM `bigquery-public-data.thelook_ecommerce.order_items`
  WHERE status NOT IN ('Cancelled', 'Returned')
    AND DATE(created_at) < DATE_TRUNC(CURRENT_DATE(), MONTH)
  GROUP BY bulan
),
dengan_bulan_lalu AS (
  SELECT
    bulan,
    pendapatan,
    LAG(pendapatan) OVER (ORDER BY bulan) AS pendapatan_bulan_lalu  -- nilai baris sebelumnya
  FROM bulanan
)
SELECT
  bulan,
  ROUND(pendapatan, 0) AS pendapatan_usd,
  ROUND(100 * SAFE_DIVIDE(pendapatan - pendapatan_bulan_lalu, pendapatan_bulan_lalu), 1) AS tumbuh_persen
FROM dengan_bulan_lalu
ORDER BY bulan DESC
LIMIT 12;


-- ---------------------------------------------------------------------
-- E. PEMBERSIHAN DASAR (di kelas hanya ditunjukkan sekilas, jalankan
--    sendiri di rumah)
-- ---------------------------------------------------------------------

-- E1. Berapa nilai kosong (NULL) di tabel products?
SELECT
  COUNT(*) AS total_produk,
  COUNTIF(name IS NULL) AS nama_kosong,
  COUNTIF(brand IS NULL) AS brand_kosong,
  COUNTIF(category IS NULL) AS kategori_kosong
FROM `bigquery-public-data.thelook_ecommerce.products`;

-- E2. Mengganti NULL dengan teks dengan COALESCE
SELECT
  COALESCE(brand, 'Tidak diketahui') AS brand_bersih,
  COUNT(*) AS jumlah_produk
FROM `bigquery-public-data.thelook_ecommerce.products`
GROUP BY brand_bersih
ORDER BY jumlah_produk DESC
LIMIT 10;

-- E3. Apakah ada duplikat? Kalau kedua angka sama, id-nya unik.
SELECT
  COUNT(*) AS jumlah_baris,
  COUNT(DISTINCT id) AS jumlah_id_unik
FROM `bigquery-public-data.thelook_ecommerce.users`;

-- E4. Cek ejaan: lihat semua nilai unik country
SELECT DISTINCT country
FROM `bigquery-public-data.thelook_ecommerce.users`
ORDER BY country;

-- E5. Menyeragamkan teks: TRIM membuang spasi, INITCAP membuat huruf
--     awal kapital, CASE WHEN menyeragamkan ejaan (jika ada)
SELECT DISTINCT
  country AS asli,
  CASE
    WHEN country = 'Brasil' THEN 'Brazil'
    WHEN country = 'España' THEN 'Spain'
    ELSE country
  END AS country_bersih,
  INITCAP(TRIM(city)) AS city_bersih
FROM `bigquery-public-data.thelook_ecommerce.users`
LIMIT 20;


-- =====================================================================
-- PROYEK SQL: KONDISI BISNIS THELOOK
-- Tiga query di bawah menjawab tiga pertanyaan besar manajemen.
-- Jalankan satu per satu, baca hasilnya, lalu tulis TEMUAN di bawah
-- setiap query. Temuan ini masuk ke README repo thelook-sql-analysis.
-- =====================================================================

-- P1. Bagaimana kondisi bisnis kita?
--     Pendapatan, pesanan, dan AOV 12 bulan terakhir vs 12 bulan sebelumnya
WITH item AS (
  SELECT
    order_id,
    sale_price,
    CASE
      WHEN DATE(created_at) >= DATE_SUB(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 12 MONTH)
        THEN '2. 12 bulan terakhir'
      ELSE '1. 12 bulan sebelumnya'
    END AS periode
  FROM `bigquery-public-data.thelook_ecommerce.order_items`
  WHERE status NOT IN ('Cancelled', 'Returned')
    AND DATE(created_at) >= DATE_SUB(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 24 MONTH)
    AND DATE(created_at) < DATE_TRUNC(CURRENT_DATE(), MONTH)
)
SELECT
  periode,
  ROUND(SUM(sale_price), 0) AS pendapatan_usd,
  COUNT(DISTINCT order_id) AS jumlah_pesanan,
  ROUND(SUM(sale_price) / COUNT(DISTINCT order_id), 2) AS aov_usd
FROM item
GROUP BY periode
ORDER BY periode;

-- Temuan 1 (pakai angka: naik/turun berapa persen?):
-- Contoh: Pendapatan 12 bulan terakhir naik [X]% (dari [A] menjadi [B] USD). (isi angka dari hasil query hari itu)
-- Kenaikan datang dari jumlah pesanan, sedangkan AOV hampir sama, jadi bisnis
-- tumbuh karena makin banyak orang berbelanja, bukan karena belanja per pesanan naik.


-- P2. Di mana uang kita dihasilkan?
--     Porsi pendapatan dan margin % per kategori, 12 bulan terakhir
WITH per_kategori AS (
  SELECT
    p.category,
    SUM(oi.sale_price) AS pendapatan,
    SUM(oi.sale_price - p.cost) AS margin
  FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
  JOIN `bigquery-public-data.thelook_ecommerce.products` AS p ON oi.product_id = p.id
  WHERE oi.status NOT IN ('Cancelled', 'Returned')
    AND DATE(oi.created_at) >= DATE_SUB(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 12 MONTH)
    AND DATE(oi.created_at) < DATE_TRUNC(CURRENT_DATE(), MONTH)
  GROUP BY p.category
)
SELECT
  category,
  ROUND(pendapatan, 0) AS pendapatan_usd,
  ROUND(100 * pendapatan / SUM(pendapatan) OVER (), 1) AS porsi_persen,
  ROUND(100 * margin / pendapatan, 1) AS margin_persen
FROM per_kategori
ORDER BY pendapatan_usd DESC;

-- Temuan 2 (kategori mana yang terbesar, dan apakah margin-nya juga tinggi?):
-- Contoh: [Kategori A] dan [Kategori B] menyumbang [X]% pendapatan. Margin [Kategori A]
-- [lebih tinggi/lebih rendah] dari rata-rata, jadi kategori terbesar [juga/belum tentu]
-- yang paling menguntungkan. (cek urutan margin_persen di hasil P2)


-- P3. Apakah pelanggan kembali berbelanja?
--     Berapa persen pelanggan yang berbelanja 1 kali, 2 kali, 3 kali atau lebih
WITH pesanan_per_pelanggan AS (
  SELECT
    user_id,
    COUNT(*) AS jumlah_pesanan
  FROM `bigquery-public-data.thelook_ecommerce.orders`
  WHERE status NOT IN ('Cancelled', 'Returned')
    AND DATE(created_at) < DATE_TRUNC(CURRENT_DATE(), MONTH)
  GROUP BY user_id
)
SELECT
  CASE
    WHEN jumlah_pesanan = 1 THEN '1 kali'
    WHEN jumlah_pesanan = 2 THEN '2 kali'
    ELSE '3 kali atau lebih'
  END AS frekuensi_belanja,
  COUNT(*) AS jumlah_pelanggan,
  ROUND(100 * COUNT(*) / SUM(COUNT(*)) OVER (), 1) AS persen
FROM pesanan_per_pelanggan
GROUP BY frekuensi_belanja
ORDER BY frekuensi_belanja;

-- Temuan 3 (berapa persen yang hanya belanja sekali? apa artinya?):
-- Contoh: [X]% pelanggan hanya berbelanja sekali. Pertumbuhan sangat bergantung
-- pada pelanggan baru, padahal mendatangkan pelanggan baru lebih mahal daripada
-- membuat pelanggan lama kembali.


-- Rekomendasi (1 tindakan konkret untuk manajemen, berdasarkan temuanmu):
-- Contoh: Buat program pembelian kedua (voucher 30 hari setelah pesanan pertama),
-- dimulai dari kategori dengan margin tertinggi, dan ukur dari kenaikan persentase
-- pelanggan yang belanja 2 kali atau lebih.


-- =====================================================================
-- LATIHAN TAMBAHAN (PR)
-- =====================================================================

-- G1. Pendapatan per tahun, hanya untuk tahun yang sudah lengkap.
--     Petunjuk: DATE(created_at) < DATE_TRUNC(CURRENT_DATE(), YEAR)
SELECT
  EXTRACT(YEAR FROM created_at) AS tahun,
  ROUND(SUM(sale_price), 0) AS pendapatan_usd
FROM `bigquery-public-data.thelook_ecommerce.order_items`
WHERE status NOT IN ('Cancelled', 'Returned')
  AND DATE(created_at) < DATE_TRUNC(CURRENT_DATE(), YEAR)
GROUP BY tahun
ORDER BY tahun;


-- G2. Kelompokkan produk: Murah (< 25), Sedang (25-75), Mahal (> 75).
--     Berapa jumlah produk di setiap kelompok?
SELECT
  CASE
    WHEN retail_price < 25 THEN '1. Murah'
    WHEN retail_price <= 75 THEN '2. Sedang'
    ELSE '3. Mahal'
  END AS kelompok_harga,
  COUNT(*) AS jumlah_produk
FROM `bigquery-public-data.thelook_ecommerce.products`
GROUP BY kelompok_harga
ORDER BY kelompok_harga;


-- =====================================================================
-- BONUS (OPSIONAL): TABEL ANALISIS
-- Untuk yang lanjut ke modul Python. Notebook sesi 7 sudah berisi versi
-- instruktur, jadi bagian ini tidak wajib. Lihat daftar kolom di README
-- sesi 4, lalu lengkapi kerangka di bawah (bagian yang ditandai TODO).
-- =====================================================================

-- WITH item_valid AS (
--   -- TODO: ambil kolom dari order_items, buang Cancelled/Returned
--   --       dan bulan berjalan
--   SELECT ...
--   FROM `bigquery-public-data.thelook_ecommerce.order_items`
--   WHERE ...
-- )
-- SELECT
--   i.id AS order_item_id,
--   ...
--   -- TODO: kolom produk (category, brand bersih, department, cost, margin)
--   -- TODO: kolom pelanggan (age, age_band dengan CASE WHEN, gender,
--   --       country, traffic_source)
-- FROM item_valid AS i
-- JOIN ... AS p ON ...
-- JOIN ... AS u ON ...;

-- Query tabel analisis-mu:
-- BONUS. Versi ini sama dengan query di notebook sesi 7-9.
-- Cek jawaban peserta: (1) jumlah baris sama dengan versi ini, (2) ada CTE,
-- (3) filter status dan bulan berjalan, (4) age_band lengkap tanpa celah.
WITH item_valid AS (
  -- Barang terjual yang sah, tanpa bulan berjalan
  SELECT id, order_id, user_id, product_id, status, created_at, sale_price
  FROM `bigquery-public-data.thelook_ecommerce.order_items`
  WHERE status NOT IN ('Cancelled', 'Returned')
    AND DATE(created_at) < DATE_TRUNC(CURRENT_DATE(), MONTH)
)
SELECT
  i.id AS order_item_id,
  i.order_id,
  i.user_id,
  i.product_id,
  i.status,
  DATE(i.created_at) AS order_date,
  DATE_TRUNC(DATE(i.created_at), MONTH) AS order_month,
  i.sale_price,
  p.cost,
  i.sale_price - p.cost AS margin,
  p.category,
  COALESCE(p.brand, 'Tidak diketahui') AS brand,
  p.department,
  u.age,
  CASE
    WHEN u.age < 18 THEN '1. Di bawah 18'
    WHEN u.age < 25 THEN '2. 18-24'
    WHEN u.age < 35 THEN '3. 25-34'
    WHEN u.age < 45 THEN '4. 35-44'
    WHEN u.age < 55 THEN '5. 45-54'
    ELSE '6. 55+'
  END AS age_band,
  u.gender,
  u.country,
  u.traffic_source
FROM item_valid AS i
JOIN `bigquery-public-data.thelook_ecommerce.products` AS p ON i.product_id = p.id
JOIN `bigquery-public-data.thelook_ecommerce.users` AS u ON i.user_id = u.id;


