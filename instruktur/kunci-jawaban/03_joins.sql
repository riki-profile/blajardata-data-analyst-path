-- =====================================================================
-- Sesi 3 · JOIN: menggabungkan tabel
-- Kursus  : Data Analysis dengan BigQuery, Python & BI
-- Dataset : bigquery-public-data.thelook_ecommerce
-- Nama    : >>> VERSI INSTRUKTUR · KUNCI JAWABAN · jangan dibagikan ke peserta <<<
-- Tanggal : 14 November 2026
--
-- Alias tabel yang dipakai di file ini:
--   u  = users        o = orders
--   oi = order_items  p = products
-- Pendapatan = SUM(sale_price) untuk barang yang tidak Cancelled/Returned
-- =====================================================================


-- ---------------------------------------------------------------------
-- A. JOIN PERTAMA: barang + info produknya
-- ---------------------------------------------------------------------

-- A1. Setiap barang terjual itu produk apa?
SELECT
  oi.id AS order_item_id,
  oi.order_id,
  oi.sale_price,
  p.name,
  p.brand,
  p.category
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN `bigquery-public-data.thelook_ecommerce.products` AS p
  ON oi.product_id = p.id
LIMIT 20;

-- A2. Cek jumlah baris: apakah sama dengan jumlah baris order_items?
--     Kalau sama, setiap barang menemukan tepat satu produk. JOIN-nya aman.
SELECT COUNT(*) AS baris_setelah_join
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN `bigquery-public-data.thelook_ecommerce.products` AS p
  ON oi.product_id = p.id;

SELECT COUNT(*) AS baris_order_items
FROM `bigquery-public-data.thelook_ecommerce.order_items`;


-- ---------------------------------------------------------------------
-- B. PENDAPATAN PER KATEGORI (versi tepat)
-- ---------------------------------------------------------------------

-- B1. Pendapatan per kategori dari order_items + products
SELECT
  p.category,
  COUNT(*) AS barang_terjual,
  ROUND(SUM(oi.sale_price), 0) AS pendapatan_usd
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN `bigquery-public-data.thelook_ecommerce.products` AS p
  ON oi.product_id = p.id
WHERE oi.status NOT IN ('Cancelled', 'Returned')
GROUP BY p.category
ORDER BY pendapatan_usd DESC;

-- Bandingkan dengan query C1 di sesi 2 (inventory_items).
-- Diskusi: kenapa angkanya mirip tapi tidak sama?
-- Petunjuk: apakah barang yang dibatalkan/dikembalikan ikut terhitung di sesi 2?

-- B2. Pendapatan, biaya, dan margin per kategori
SELECT
  p.category,
  ROUND(SUM(oi.sale_price), 0) AS pendapatan_usd,
  ROUND(SUM(p.cost), 0) AS biaya_usd,
  ROUND(SUM(oi.sale_price - p.cost), 0) AS margin_usd,
  ROUND(100 * SUM(oi.sale_price - p.cost) / SUM(oi.sale_price), 1) AS margin_persen
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN `bigquery-public-data.thelook_ecommerce.products` AS p
  ON oi.product_id = p.id
WHERE oi.status NOT IN ('Cancelled', 'Returned')
GROUP BY p.category
ORDER BY margin_usd DESC;


-- ---------------------------------------------------------------------
-- C. PESANAN + PELANGGAN
-- ---------------------------------------------------------------------

-- C1. Negara mana yang paling banyak memesan?
SELECT
  u.country,
  COUNT(*) AS jumlah_pesanan,
  COUNT(DISTINCT o.user_id) AS jumlah_pembeli
FROM `bigquery-public-data.thelook_ecommerce.orders` AS o
JOIN `bigquery-public-data.thelook_ecommerce.users` AS u
  ON o.user_id = u.id
WHERE o.status NOT IN ('Cancelled', 'Returned')
GROUP BY u.country
ORDER BY jumlah_pesanan DESC;

-- C2. Saluran pemasaran (traffic_source) mana yang menghasilkan pesanan terbanyak?
SELECT
  u.traffic_source,
  COUNT(*) AS jumlah_pesanan
FROM `bigquery-public-data.thelook_ecommerce.orders` AS o
JOIN `bigquery-public-data.thelook_ecommerce.users` AS u
  ON o.user_id = u.id
WHERE o.status NOT IN ('Cancelled', 'Returned')
GROUP BY u.traffic_source
ORDER BY jumlah_pesanan DESC;


-- ---------------------------------------------------------------------
-- D. JOIN TIGA TABEL: barang + produk + pelanggan
-- ---------------------------------------------------------------------

-- D1. Pendapatan per gender pelanggan dan kategori produk
SELECT
  u.gender,
  p.category,
  ROUND(SUM(oi.sale_price), 0) AS pendapatan_usd
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN `bigquery-public-data.thelook_ecommerce.products` AS p
  ON oi.product_id = p.id
JOIN `bigquery-public-data.thelook_ecommerce.users` AS u
  ON oi.user_id = u.id
WHERE oi.status NOT IN ('Cancelled', 'Returned')
GROUP BY u.gender, p.category
ORDER BY pendapatan_usd DESC
LIMIT 20;

-- D2. Pendapatan, jumlah pesanan, dan AOV per negara
--     AOV (average order value) = pendapatan / jumlah pesanan unik
SELECT
  u.country,
  ROUND(SUM(oi.sale_price), 0) AS pendapatan_usd,
  COUNT(DISTINCT oi.order_id) AS jumlah_pesanan,
  ROUND(SUM(oi.sale_price) / COUNT(DISTINCT oi.order_id), 2) AS aov_usd
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN `bigquery-public-data.thelook_ecommerce.users` AS u
  ON oi.user_id = u.id
WHERE oi.status NOT IN ('Cancelled', 'Returned')
GROUP BY u.country
ORDER BY pendapatan_usd DESC;


-- ---------------------------------------------------------------------
-- E. LEFT JOIN: mencari yang "tidak punya"
-- ---------------------------------------------------------------------

-- E1. Pelanggan yang belum pernah memesan sama sekali
--     LEFT JOIN menyimpan semua pelanggan. Yang tidak punya pesanan
--     mendapat o.order_id = NULL.
SELECT
  u.id,
  u.first_name,
  u.country,
  u.created_at
FROM `bigquery-public-data.thelook_ecommerce.users` AS u
LEFT JOIN `bigquery-public-data.thelook_ecommerce.orders` AS o
  ON u.id = o.user_id
WHERE o.order_id IS NULL
LIMIT 20;

-- E2. Berapa jumlahnya, dan berapa persen dari semua pelanggan?
SELECT
  COUNT(DISTINCT u.id) AS total_pelanggan,
  COUNT(DISTINCT CASE WHEN o.order_id IS NULL THEN u.id END) AS belum_pernah_memesan
FROM `bigquery-public-data.thelook_ecommerce.users` AS u
LEFT JOIN `bigquery-public-data.thelook_ecommerce.orders` AS o
  ON u.id = o.user_id;
-- (CASE WHEN kita bahas di sesi 4. Untuk sekarang cukup pahami hasilnya.)


-- ---------------------------------------------------------------------
-- F. JEBAKAN FAN-OUT: angka yang membengkak
-- ---------------------------------------------------------------------

-- F1. SALAH: menghitung pesanan dengan COUNT(*) setelah JOIN ke order_items.
--     Setiap pesanan muncul sekali per barang, jadi jumlahnya terlalu besar.
SELECT COUNT(*) AS jumlah_pesanan_salah
FROM `bigquery-public-data.thelook_ecommerce.orders` AS o
JOIN `bigquery-public-data.thelook_ecommerce.order_items` AS oi
  ON o.order_id = oi.order_id;

-- F2. BENAR: hitung order_id unik
SELECT COUNT(DISTINCT o.order_id) AS jumlah_pesanan_benar
FROM `bigquery-public-data.thelook_ecommerce.orders` AS o
JOIN `bigquery-public-data.thelook_ecommerce.order_items` AS oi
  ON o.order_id = oi.order_id;


-- =====================================================================
-- KERJAKAN BERSAMA (di kelas, dipandu instruktur)
-- =====================================================================

-- B1. Pendapatan per department (Men/Women) untuk setiap negara.
--     Tampilkan 10 baris teratas.
SELECT
  u.country,
  p.department,
  ROUND(SUM(oi.sale_price), 0) AS pendapatan_usd
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN `bigquery-public-data.thelook_ecommerce.products` AS p
  ON oi.product_id = p.id
JOIN `bigquery-public-data.thelook_ecommerce.users` AS u
  ON oi.user_id = u.id
WHERE oi.status NOT IN ('Cancelled', 'Returned')
GROUP BY u.country, p.department
ORDER BY pendapatan_usd DESC
LIMIT 10;


-- B2. AOV per negara untuk pelanggan perempuan (gender = 'F') saja.
SELECT
  u.country,
  ROUND(SUM(oi.sale_price) / COUNT(DISTINCT oi.order_id), 2) AS aov_usd,
  COUNT(DISTINCT oi.order_id) AS jumlah_pesanan
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN `bigquery-public-data.thelook_ecommerce.users` AS u
  ON oi.user_id = u.id
WHERE oi.status NOT IN ('Cancelled', 'Returned')
  AND u.gender = 'F'
GROUP BY u.country
ORDER BY jumlah_pesanan DESC;


-- =====================================================================
-- LATIHAN MANDIRI (OPSIONAL)
-- Tidak wajib dan tidak dinilai. Jawabannya dibagikan instruktur setelah kelas.
-- =====================================================================

-- L1. Pendapatan per kelompok umur dan gender.
--      Kelompok umur per 10 tahun: FLOOR(u.age / 10) * 10 AS kelompok_umur
--      Tampilkan: kelompok_umur, gender, pelanggan unik, pesanan unik,
--      pendapatan. Urutkan berdasarkan kelompok_umur lalu gender.
-- CAST(... AS INT64) opsional: tanpa CAST hasilnya tampil 20.0, tetap benar.
SELECT
  CAST(FLOOR(u.age / 10) * 10 AS INT64) AS kelompok_umur,
  u.gender,
  COUNT(DISTINCT oi.user_id) AS pelanggan,
  COUNT(DISTINCT oi.order_id) AS pesanan,
  ROUND(SUM(oi.sale_price), 0) AS pendapatan_usd
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN `bigquery-public-data.thelook_ecommerce.users` AS u
  ON oi.user_id = u.id
WHERE oi.status NOT IN ('Cancelled', 'Returned')
GROUP BY kelompok_umur, u.gender
ORDER BY kelompok_umur, u.gender;


-- Temuan (2 kalimat):
-- Contoh: Kelompok umur [X] menyumbang pendapatan terbesar ([N] USD). (isi angka dari hasil query hari itu)
-- Perbedaan antara pria dan wanita di setiap kelompok umur kecil; data TheLook
-- sintetis, jadi "tidak ada perbedaan berarti" adalah temuan yang sah.
