-- =====================================================================
-- Sesi 1 · Dasar SQL: SELECT, WHERE, ORDER BY, LIMIT
-- Kursus  : Data Analysis dengan BigQuery, Python & BI
-- Dataset : bigquery-public-data.thelook_ecommerce
-- Nama    : >>> VERSI INSTRUKTUR · KUNCI JAWABAN · jangan dibagikan ke peserta <<<
-- Tanggal : 10 November 2026
--
-- Cara pakai: salin isi file ini ke editor BigQuery. Untuk menjalankan
-- satu query, blok query tersebut lalu klik Run (Ctrl/Cmd + Enter).
-- =====================================================================


-- ---------------------------------------------------------------------
-- A. TUR TABEL
-- Tip: tab "Preview" di BigQuery menampilkan isi tabel tanpa biaya.
-- ---------------------------------------------------------------------

-- A1. Pelanggan: siapa saja yang mendaftar di TheLook?
SELECT *
FROM `bigquery-public-data.thelook_ecommerce.users`
LIMIT 10;

-- A2. Pesanan: satu baris = satu pesanan
SELECT *
FROM `bigquery-public-data.thelook_ecommerce.orders`
LIMIT 10;

-- A3. Barang dalam pesanan: satu baris = satu barang yang dibeli
SELECT *
FROM `bigquery-public-data.thelook_ecommerce.order_items`
LIMIT 10;

-- A4. Katalog produk
SELECT *
FROM `bigquery-public-data.thelook_ecommerce.products`
LIMIT 10;

-- A5. Stok barang di gudang
SELECT *
FROM `bigquery-public-data.thelook_ecommerce.inventory_items`
LIMIT 10;


-- ---------------------------------------------------------------------
-- B. SELECT DAN ORDER BY
-- ---------------------------------------------------------------------

-- B1. Pilih kolom yang dibutuhkan saja (lebih hemat daripada SELECT *)
SELECT
  name,
  brand,
  category,
  retail_price
FROM `bigquery-public-data.thelook_ecommerce.products`
LIMIT 10;

-- B2. Apa 10 produk termahal kita?
SELECT
  name,
  brand,
  category,
  retail_price
FROM `bigquery-public-data.thelook_ecommerce.products`
ORDER BY retail_price DESC
LIMIT 10;

-- B3. Alias dengan AS: memberi nama kolom yang lebih mudah dibaca
SELECT
  name AS nama_produk,
  retail_price AS harga_usd
FROM `bigquery-public-data.thelook_ecommerce.products`
ORDER BY harga_usd DESC
LIMIT 10;

-- B4. Kategori apa saja yang kita jual? DISTINCT = nilai unik
SELECT DISTINCT category
FROM `bigquery-public-data.thelook_ecommerce.products`
ORDER BY category;


-- ---------------------------------------------------------------------
-- C. WHERE: MEMFILTER BARIS
-- ---------------------------------------------------------------------

-- C1. Semua produk di kategori Jeans, dari yang termahal
SELECT name, brand, retail_price
FROM `bigquery-public-data.thelook_ecommerce.products`
WHERE category = 'Jeans'
ORDER BY retail_price DESC;

-- C2. Produk pria (Men) dengan harga di atas 100 USD
SELECT name, category, retail_price
FROM `bigquery-public-data.thelook_ecommerce.products`
WHERE department = 'Men'
  AND retail_price > 100
ORDER BY retail_price DESC;

-- C3. Pelanggan dari Jepang atau Prancis: IN (...)
SELECT first_name, last_name, age, country
FROM `bigquery-public-data.thelook_ecommerce.users`
WHERE country IN ('Japan', 'France')
LIMIT 20;

-- C4. Pelanggan berumur 18 sampai 24 tahun: BETWEEN (termasuk 18 dan 24)
SELECT first_name, age, gender, country
FROM `bigquery-public-data.thelook_ecommerce.users`
WHERE age BETWEEN 18 AND 24
LIMIT 20;

-- C5. Produk yang namanya mengandung kata "Hoodie": LIKE dengan %
SELECT name, brand, retail_price
FROM `bigquery-public-data.thelook_ecommerce.products`
WHERE name LIKE '%Hoodie%'
ORDER BY retail_price DESC
LIMIT 20;

-- C6. Pesanan yang belum dikirim: kolom shipped_at masih kosong (NULL)
-- Catatan: untuk NULL pakai IS NULL, bukan "= NULL"
SELECT order_id, status, created_at, shipped_at
FROM `bigquery-public-data.thelook_ecommerce.orders`
WHERE shipped_at IS NULL
LIMIT 20;


-- ---------------------------------------------------------------------
-- D. MENGHITUNG PESANAN PER STATUS
-- ---------------------------------------------------------------------

-- D1. Status apa saja yang ada?
SELECT DISTINCT status
FROM `bigquery-public-data.thelook_ecommerce.orders`;

-- D2. Ada berapa pesanan dengan status Complete?
-- COUNT(*) menghitung jumlah baris
SELECT COUNT(*) AS jumlah_pesanan
FROM `bigquery-public-data.thelook_ecommerce.orders`
WHERE status = 'Complete';

-- D3. Ada berapa pesanan yang dibatalkan (Cancelled)?
SELECT COUNT(*) AS jumlah_pesanan
FROM `bigquery-public-data.thelook_ecommerce.orders`
WHERE status = 'Cancelled';

-- Menghitung satu per satu untuk 5 status cukup merepotkan.
-- Di sesi 2 kita lakukan sekaligus dengan GROUP BY.


-- =====================================================================
-- GILIRAN KAMU (di kelas, ±10 menit)
-- =====================================================================

-- G1. Tampilkan 5 produk TERMURAH di department Women, kategori Dresses.
--     Kolom: name, brand, retail_price
SELECT name, brand, retail_price
FROM `bigquery-public-data.thelook_ecommerce.products`
WHERE department = 'Women'
  AND category = 'Dresses'
ORDER BY retail_price ASC
LIMIT 5;


-- G2. Ada berapa pesanan dengan status Returned?
SELECT COUNT(*) AS jumlah_pesanan
FROM `bigquery-public-data.thelook_ecommerce.orders`
WHERE status = 'Returned';


-- =====================================================================
-- PR SESI 1
-- Tulis komentar di atas setiap query: pertanyaan apa yang dijawab.
-- =====================================================================

-- PR1. Semua produk dari satu brand pilihanmu, urut dari harga tertinggi.
--      (Cari dulu nama brand-nya dengan SELECT DISTINCT brand ...)
-- Produk apa saja yang dijual brand Calvin Klein, dari yang termahal?
SELECT name, category, retail_price
FROM `bigquery-public-data.thelook_ecommerce.products`
WHERE brand = 'Calvin Klein'
ORDER BY retail_price DESC;


-- PR2. Pelanggan dari Brasil yang berumur di bawah 25 tahun.
--      (Petunjuk: di dataset ini Brasil ditulis 'Brasil')
-- Siapa saja pelanggan muda (di bawah 25 tahun) dari Brasil?
SELECT first_name, last_name, age, city
FROM `bigquery-public-data.thelook_ecommerce.users`
WHERE country = 'Brasil'
  AND age < 25;


-- PR3. 10 pesanan Returned yang paling baru (urutkan berdasarkan created_at).
-- Pesanan mana saja yang terakhir dikembalikan pelanggan?
SELECT order_id, user_id, created_at, returned_at
FROM `bigquery-public-data.thelook_ecommerce.orders`
WHERE status = 'Returned'
ORDER BY created_at DESC
LIMIT 10;


-- PR4. Produk kategori Sweaters dengan harga 50 sampai 100 USD.
-- Sweater apa saja yang ada di rentang harga menengah (50-100 USD)?
SELECT name, brand, retail_price
FROM `bigquery-public-data.thelook_ecommerce.products`
WHERE category = 'Sweaters'
  AND retail_price BETWEEN 50 AND 100
ORDER BY retail_price;


-- PR5. Pelanggan yang datang dari Facebook (kolom traffic_source)
--      dan tinggal di United States. Tampilkan 20 baris.
-- Seperti apa pelanggan AS yang datang dari iklan Facebook?
SELECT first_name, last_name, age, city
FROM `bigquery-public-data.thelook_ecommerce.users`
WHERE traffic_source = 'Facebook'
  AND country = 'United States'
LIMIT 20;


-- ---------------------------------------------------------------------
-- LIMA PERTANYAAN BISNIS UNTUK THELOOK
-- Tulis 5 pertanyaan yang spesifik, bisa diukur, dan berguna untuk
-- mengambil keputusan. Contoh: "Kategori apa yang pendapatannya paling
-- besar dalam 12 bulan terakhir?"
-- ---------------------------------------------------------------------
-- Contoh jawaban yang baik (spesifik, bisa diukur, berguna):
-- 1. Kategori apa yang pendapatannya paling besar dalam 12 bulan terakhir?
-- 2. Apakah pendapatan bulanan naik atau turun dalam 12 bulan terakhir?
-- 3. Berapa persen pelanggan yang berbelanja lebih dari sekali?
-- 4. Saluran pemasaran (traffic_source) mana yang membawa pembeli terbanyak?
-- 5. Kategori apa yang paling sering dikembalikan (Returned)?
