# Runsheet Sesi 12 · Analisis Mandiri

**Kamis, 3 Desember 2026 · 20.00–21.40 WIB** · Materi: [materi/sesi-12-analisis-mandiri](../materi/sesi-12-analisis-mandiri/)

## Persiapan

- [ ] Daftar peserta + pertanyaan masing-masing + catatan masukanmu (dari Kamis siang).
- [ ] Siapkan *breakout room*: satu ruang "Konsultasi" (kamu masuk ke sana) dan ruang utama untuk kerja mandiri. Atau: semua tetap di ruang utama, dan kamu memanggil peserta satu per satu ke ruang Konsultasi.
- [ ] Jadwal konsultasi ±5 menit per peserta. Untuk kelas lebih dari 12 orang, minta asisten ikut berkonsultasi, atau lanjutkan konsultasi lewat chat setelah kelas.

## Runsheet

| Waktu | Bagian | Poin utama |
| --- | --- | --- |
| 20.00 | Recap | Pertanyaan baik vs perlu diperbaiki |
| 20.10 | Alur kerja | Template SQL dan notebook; urutan kerja; "satu grafik utama" |
| 20.20 | Kerja + konsultasi | Umumkan urutan konsultasi di chat. Setiap konsultasi: (1) pertanyaan, (2) progres, (3) satu masalah → beri 1 saran konkret |
| 21.20 | Berbagi progres | 2–3 sukarelawan, masing-masing 3–4 menit |
| 21.35 | Penutup | PR: selesaikan analisis + temuan README. Sesi 13 = review portofolio |

## Panduan konsultasi

| Masalah yang sering muncul | Saran |
| --- | --- |
| Pertanyaan terlalu luas | "Pilih satu metrik dan satu dimensi. Misalnya: margin % per kategori, 12 bulan terakhir" |
| Tidak tahu harus mulai dari tabel mana | Buka diagram di KAMUS_DATA; mulai dari `order_items` |
| Hasilnya "tidak ada perbedaan" | Itu temuan yang sah. Tulis dengan jujur dan sarankan apa yang perlu dicek berikutnya |
| Query `events` lambat/besar | Batasi periode (`WHERE created_at >= ...`) dan pilih kolom yang perlu saja |
| Terlalu banyak grafik | Pilih satu yang paling menjawab pertanyaan; sisanya opsional |

## Contoh query untuk pertanyaan populer

```sql
-- Tingkat pengembalian per kategori
SELECT
  p.category,
  COUNT(*) AS barang,
  COUNTIF(oi.status = 'Returned') AS dikembalikan,
  ROUND(100 * COUNTIF(oi.status = 'Returned') / COUNT(*), 1) AS persen_kembali
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN `bigquery-public-data.thelook_ecommerce.products` AS p ON oi.product_id = p.id
GROUP BY p.category
ORDER BY persen_kembali DESC;

-- Funnel website per traffic source (tabel events)
SELECT
  traffic_source,
  COUNT(DISTINCT session_id) AS sesi,
  COUNT(DISTINCT IF(event_type = 'cart', session_id, NULL)) AS sesi_cart,
  COUNT(DISTINCT IF(event_type = 'purchase', session_id, NULL)) AS sesi_purchase,
  ROUND(100 * COUNT(DISTINCT IF(event_type = 'purchase', session_id, NULL))
        / COUNT(DISTINCT session_id), 1) AS konversi_persen
FROM `bigquery-public-data.thelook_ecommerce.events`
GROUP BY traffic_source
ORDER BY konversi_persen DESC;

-- Jarak hari antara pesanan pertama dan kedua
WITH urutan AS (
  SELECT
    user_id,
    created_at,
    ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY created_at) AS ke
  FROM `bigquery-public-data.thelook_ecommerce.orders`
  WHERE status NOT IN ('Cancelled', 'Returned')
)
SELECT
  ROUND(AVG(DATE_DIFF(DATE(b.created_at), DATE(a.created_at), DAY)), 1) AS rata_hari,
  APPROX_QUANTILES(DATE_DIFF(DATE(b.created_at), DATE(a.created_at), DAY), 2)[OFFSET(1)] AS median_hari
FROM urutan AS a
JOIN urutan AS b ON a.user_id = b.user_id AND a.ke = 1 AND b.ke = 2;
```

Query ketiga memakai window function (`ROW_NUMBER`) yang di luar materi. Berikan hanya kepada peserta yang memilih pertanyaan ini, dan jelaskan polanya.
