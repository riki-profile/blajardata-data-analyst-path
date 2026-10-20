# Runsheet Sesi 4 · Tanggal, CASE WHEN, CTE, dan Pembersihan Dasar

**Selasa, 17 November 2026 · 20.00–21.40 WIB** · Materi: [materi/sesi-04-tanggal-case-cte](../materi/sesi-04-tanggal-case-cte/)

## Persiapan

- [ ] Jalankan `04_dates_case_cte.sql`. Cek hasil E4 (nilai unik `country`): apakah ada ejaan ganda seperti `Brasil`/`Brazil` atau `España`/`Spain`? Sesuaikan penjelasan E5 dengan kenyataan hari itu.
- [ ] Jalankan query tabel analisis (kunci PR di bawah) dan catat jumlah barisnya. Angka ini dipakai lagi di sesi 7.

## Runsheet

| Waktu | Bagian | Poin utama |
| --- | --- | --- |
| 20.00 | Recap PR sesi 3 | Umur × gender; jembatan ke CASE WHEN |
| 20.15 | Demo A | Tabel fungsi tanggal; TIMESTAMP vs DATE; UTC |
| 20.25 | Demo B | Tren bulanan 12 bulan terakhir. Tunjukkan **tab Chart** di hasil BigQuery. Jalankan sekali **tanpa** filter bulan berjalan supaya peserta melihat grafik "anjlok" di ujung |
| 20.35 | Demo C | CASE WHEN: urutan kondisi; trik angka di depan label untuk urutan; `COUNTIF` |
| 20.50 | Demo D | CTE sebagai "tabel sementara bernama". D2 (LAG) hanya tunjukkan hasilnya; window function di luar cakupan |
| 20.58 | Demo E | Cek NULL, COALESCE, duplikat, ejaan |
| 21.05 | Giliran kamu | G1–G2 |
| 21.15 | Penjelasan PR | **Penting:** buka bagian F dan jelaskan spesifikasi kolom tabel analisis. Tekankan bahwa query ini dipakai lagi di sesi 7, 8, 9 |
| 21.25 | Tanya jawab | |
| 21.35 | Penutup | Modul SQL selesai. Sesi 5 pindah ke Python; tidak perlu install apa-apa |

## Poin penting

- `DATE_TRUNC(DATE(created_at), MONTH)` adalah pola paling penting hari ini (tren bulanan).
- Bulan berjalan selalu dibuang untuk tren. Jelaskan alasannya dengan grafik.
- CASE WHEN tanpa `ELSE` → NULL. Tunjukkan contohnya.
- Pembersihan di SQL hanya dasar; pembersihan lebih lengkap di Python, sesi 8.

## Error yang sering muncul

| Error | Penyebab |
| --- | --- |
| `No matching signature for function DATE_TRUNC for argument types: TIMESTAMP, DATE_TIME_PART` | Peserta menulis `DATE_TRUNC(created_at, MONTH)` tanpa `DATE()`. Sebenarnya `TIMESTAMP_TRUNC` juga bisa, tapi konsisten pakai `DATE()` |
| `Syntax error: Expected keyword END` | CASE tanpa `END` |
| `Unrecognized name` di CTE | Kolom tidak dipilih di dalam CTE, atau koma hilang di antara dua CTE |
| `Syntax error: Unexpected keyword WITH` | Ada `;` di tengah, atau CTE kedua ditulis dengan `WITH` lagi (harusnya koma) |

## Kunci jawaban

```sql
-- G1. Pendapatan per tahun (tahun lengkap saja)
SELECT
  EXTRACT(YEAR FROM created_at) AS tahun,
  ROUND(SUM(sale_price), 0) AS pendapatan_usd
FROM `bigquery-public-data.thelook_ecommerce.order_items`
WHERE status NOT IN ('Cancelled', 'Returned')
  AND DATE(created_at) < DATE_TRUNC(CURRENT_DATE(), YEAR)
GROUP BY tahun
ORDER BY tahun;

-- G2. Kelompok harga produk
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
```

**PR: tabel analisis** (versi ini dipakai di notebook sesi 7–9):

```sql
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
```

Cek jawaban peserta: (1) jumlah barisnya harus sama dengan versi ini, (2) ada CTE, (3) filter status dan bulan berjalan, (4) `age_band` lengkap tanpa celah umur.

## Untuk recap sesi 5

- Bandingkan jumlah baris tabel analisis peserta dengan versi kunci. Kalau berbeda, biasanya karena filter status di tabel yang salah, atau JOIN ke `orders` yang menggandakan baris.
- Tutup modul SQL: ringkas 4 sesi dalam satu slide/kalimat, lalu jelaskan kenapa sekarang Python.
