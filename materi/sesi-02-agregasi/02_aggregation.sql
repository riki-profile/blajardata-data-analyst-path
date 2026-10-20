-- =====================================================================
-- Sesi 2 · Agregasi: COUNT, SUM, AVG, GROUP BY, HAVING
-- Kursus  : Data Analysis dengan BigQuery, Python & BI
-- Dataset : bigquery-public-data.thelook_ecommerce
-- Nama    : <tulis namamu>
-- Tanggal : 11 November 2026
-- =====================================================================


-- ---------------------------------------------------------------------
-- A. AGREGASI SEDERHANA: banyak baris -> satu angka
-- ---------------------------------------------------------------------

-- A1. Berapa total pelanggan TheLook?
SELECT COUNT(*) AS total_pelanggan
FROM `bigquery-public-data.thelook_ecommerce.users`;

-- A2. Berapa total pesanan, dan berapa pelanggan yang pernah memesan?
-- COUNT(DISTINCT ...) menghitung nilai unik: satu pelanggan bisa memesan berkali-kali
SELECT
  COUNT(*) AS total_pesanan,
  COUNT(DISTINCT user_id) AS pelanggan_yang_memesan
FROM `bigquery-public-data.thelook_ecommerce.orders`;

-- A3. Harga produk: termurah, termahal, dan rata-rata
SELECT
  MIN(retail_price) AS harga_termurah,
  MAX(retail_price) AS harga_termahal,
  ROUND(AVG(retail_price), 2) AS harga_rata_rata
FROM `bigquery-public-data.thelook_ecommerce.products`;

-- A4. Kapan pesanan pertama dan terakhir?
SELECT
  MIN(created_at) AS pesanan_pertama,
  MAX(created_at) AS pesanan_terakhir
FROM `bigquery-public-data.thelook_ecommerce.orders`;

-- A5. COUNT(*) vs COUNT(kolom): COUNT(kolom) tidak menghitung NULL
SELECT
  COUNT(*) AS semua_pesanan,
  COUNT(shipped_at) AS sudah_dikirim,
  COUNT(delivered_at) AS sudah_diterima,
  COUNT(returned_at) AS dikembalikan
FROM `bigquery-public-data.thelook_ecommerce.orders`;


-- ---------------------------------------------------------------------
-- B. GROUP BY: satu angka untuk setiap kelompok
-- ---------------------------------------------------------------------

-- B1. Berapa pesanan untuk setiap status? (lanjutan dari sesi 1)
SELECT
  status,
  COUNT(*) AS jumlah_pesanan
FROM `bigquery-public-data.thelook_ecommerce.orders`
GROUP BY status
ORDER BY jumlah_pesanan DESC;

-- B2. Dari negara mana pelanggan kita?
SELECT
  country,
  COUNT(*) AS jumlah_pelanggan
FROM `bigquery-public-data.thelook_ecommerce.users`
GROUP BY country
ORDER BY jumlah_pelanggan DESC;

-- B3. Berapa persen pelanggan dari setiap negara?
-- SUM(COUNT(*)) OVER () = total semua kelompok. Cukup salin polanya dulu.
SELECT
  country,
  COUNT(*) AS jumlah_pelanggan,
  ROUND(100 * COUNT(*) / SUM(COUNT(*)) OVER (), 1) AS persen
FROM `bigquery-public-data.thelook_ecommerce.users`
GROUP BY country
ORDER BY jumlah_pelanggan DESC;

-- B4. Mengelompokkan dengan dua kolom: pelanggan per negara dan gender
SELECT
  country,
  gender,
  COUNT(*) AS jumlah_pelanggan
FROM `bigquery-public-data.thelook_ecommerce.users`
GROUP BY country, gender
ORDER BY country, gender;

-- B5. Pendapatan per status barang: berapa uang yang "hilang" karena
--     pembatalan dan pengembalian?
SELECT
  status,
  COUNT(*) AS jumlah_barang,
  ROUND(SUM(sale_price), 0) AS total_nilai_usd
FROM `bigquery-public-data.thelook_ecommerce.order_items`
GROUP BY status
ORDER BY total_nilai_usd DESC;


-- ---------------------------------------------------------------------
-- C. PENDAPATAN PER KATEGORI (perkiraan, tanpa JOIN)
-- inventory_items menyimpan salinan kategori & harga produk.
-- sold_at terisi = barang sudah terjual.
-- Versi yang tepat (order_items + products) kita buat di sesi 3.
-- ---------------------------------------------------------------------

-- C1. Kategori mana yang paling banyak menghasilkan uang?
SELECT
  product_category AS kategori,
  COUNT(*) AS barang_terjual,
  ROUND(SUM(product_retail_price), 0) AS perkiraan_pendapatan_usd
FROM `bigquery-public-data.thelook_ecommerce.inventory_items`
WHERE sold_at IS NOT NULL
GROUP BY kategori
ORDER BY perkiraan_pendapatan_usd DESC;

-- C2. Rata-rata harga dan margin per kategori dari katalog produk
SELECT
  category,
  COUNT(*) AS jumlah_produk,
  ROUND(AVG(retail_price), 2) AS rata_harga,
  ROUND(AVG(retail_price - cost), 2) AS rata_margin
FROM `bigquery-public-data.thelook_ecommerce.products`
GROUP BY category
ORDER BY rata_margin DESC;


-- ---------------------------------------------------------------------
-- D. HAVING: memfilter kelompok
-- ---------------------------------------------------------------------

-- D1. Negara dengan lebih dari 1.000 pelanggan
SELECT
  country,
  COUNT(*) AS jumlah_pelanggan
FROM `bigquery-public-data.thelook_ecommerce.users`
GROUP BY country
HAVING COUNT(*) > 1000
ORDER BY jumlah_pelanggan DESC;

-- D2. WHERE dan HAVING bersamaan:
--     di antara produk Women (WHERE, sebelum dikelompokkan),
--     kategori mana yang rata-rata harganya di atas 60 USD (HAVING)?
SELECT
  category,
  ROUND(AVG(retail_price), 2) AS rata_harga
FROM `bigquery-public-data.thelook_ecommerce.products`
WHERE department = 'Women'
GROUP BY category
HAVING AVG(retail_price) > 60
ORDER BY rata_harga DESC;


-- =====================================================================
-- GILIRAN KAMU (di kelas, ±10 menit)
-- =====================================================================

-- G1. Jumlah produk dan rata-rata harga untuk setiap department (Men/Women).



-- G2. Jumlah pelanggan untuk setiap traffic_source, dari yang terbanyak.



-- =====================================================================
-- PR SESI 2
-- =====================================================================

-- PR1. Top 10 brand berdasarkan pendapatan (perkiraan, pakai inventory_items).
--      Tampilkan: brand, jumlah barang terjual, total pendapatan,
--      rata-rata harga per barang. Urutkan dari pendapatan terbesar.



-- Temuan (1 kalimat):
--
