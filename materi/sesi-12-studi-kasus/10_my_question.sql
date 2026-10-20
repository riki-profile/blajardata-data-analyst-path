-- =====================================================================
-- Studi Kasus · Sesi 12
-- Nama       : <tulis namamu>
-- Tanggal    : 5 Desember 2026
--
-- Pertanyaan : Kategori produk mana yang sebaiknya diprioritaskan TheLook
--              untuk kuartal depan?
-- Fokus      : department = '<Women atau Men>'   <-- ISI PILIHANMU
-- Periode    : 12 bulan terakhir yang lengkap, dibandingkan dengan
--              12 bulan sebelumnya
-- Definisi   : pendapatan   = SUM(sale_price), tanpa Cancelled/Returned
--              pertumbuhan  = pendapatan 12 bln terakhir vs 12 bln sebelumnya
--              margin %     = (sale_price - cost) / sale_price
--              tingkat retur = barang Returned / barang terjual (tanpa Cancelled)
-- =====================================================================


-- ---------------------------------------------------------------------
-- 1. EKSPLORASI: memahami data sebelum analisis utama
-- ---------------------------------------------------------------------

-- 1a. Ada berapa kategori di department pilihanku, dan berapa produknya?
SELECT
  category,
  COUNT(*) AS jumlah_produk
FROM `bigquery-public-data.thelook_ecommerce.products`
WHERE department = 'Women'          -- ganti dengan pilihanmu
GROUP BY category
ORDER BY jumlah_produk DESC;

-- 1b. Periode yang dibandingkan: tanggal awal dan akhir kedua periode
SELECT
  DATE_SUB(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 24 MONTH) AS awal_periode_sebelumnya,
  DATE_SUB(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 12 MONTH) AS awal_periode_terakhir,
  DATE_SUB(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 1 DAY) AS akhir_periode_terakhir;

-- 1c. Status barang dalam 12 bulan terakhir: seberapa banyak yang dikembalikan?
SELECT
  oi.status,
  COUNT(*) AS jumlah_barang
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN `bigquery-public-data.thelook_ecommerce.products` AS p ON oi.product_id = p.id
WHERE p.department = 'Women'        -- ganti dengan pilihanmu
  AND DATE(oi.created_at) >= DATE_SUB(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 12 MONTH)
  AND DATE(oi.created_at) < DATE_TRUNC(CURRENT_DATE(), MONTH)
GROUP BY oi.status
ORDER BY jumlah_barang DESC;


-- ---------------------------------------------------------------------
-- 2. QUERY FINAL: satu baris per kategori
-- Hasil query ini dimuat ke notebook 10_my_question.ipynb.
-- ---------------------------------------------------------------------

WITH item AS (
  -- Langkah 1: barang dari 24 bulan terakhir yang lengkap, beri label periodenya.
  -- Cancelled dibuang (barang tidak pernah dikirim). Returned DISIMPAN
  -- supaya tingkat retur bisa dihitung.
  SELECT
    p.category,
    oi.status,
    oi.sale_price,
    p.cost,
    CASE
      WHEN DATE(oi.created_at) >= DATE_SUB(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 12 MONTH)
        THEN 'terakhir'
      ELSE 'sebelumnya'
    END AS periode
  FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
  JOIN `bigquery-public-data.thelook_ecommerce.products` AS p ON oi.product_id = p.id
  JOIN `bigquery-public-data.thelook_ecommerce.users` AS u ON oi.user_id = u.id
  WHERE p.department = 'Women'      -- ganti dengan pilihanmu
    -- AND u.country = 'United States'   -- opsional: hapus tanda -- untuk fokus ke satu negara
    AND oi.status != 'Cancelled'
    AND DATE(oi.created_at) >= DATE_SUB(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 24 MONTH)
    AND DATE(oi.created_at) < DATE_TRUNC(CURRENT_DATE(), MONTH)
)
-- Langkah 2: ringkas per kategori. CASE WHEN di dalam SUM memilih
-- baris mana yang dijumlahkan, seperti filter kecil di setiap kolom.
SELECT
  category,
  SUM(CASE WHEN periode = 'terakhir' AND status != 'Returned' THEN sale_price ELSE 0 END) AS pendapatan,
  SUM(CASE WHEN periode = 'sebelumnya' AND status != 'Returned' THEN sale_price ELSE 0 END) AS pendapatan_sebelumnya,
  SUM(CASE WHEN periode = 'terakhir' AND status != 'Returned' THEN sale_price - cost ELSE 0 END) AS margin,
  COUNTIF(periode = 'terakhir') AS barang_terjual,
  COUNTIF(periode = 'terakhir' AND status = 'Returned') AS barang_retur,
  SUM(CASE WHEN periode = 'terakhir' AND status = 'Returned' THEN sale_price ELSE 0 END) AS pendapatan_hilang_retur
FROM item
GROUP BY category
ORDER BY pendapatan DESC;


-- ---------------------------------------------------------------------
-- 3. JAWABAN SINGKAT (diisi setelah analisis di notebook selesai)
-- ---------------------------------------------------------------------
-- Jawaban    :
-- Rekomendasi:
