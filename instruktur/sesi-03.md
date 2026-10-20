# Runsheet Sesi 3 · JOIN

**Sabtu, 14 November 2026 · 14.00–15.40 WIB** · Materi: [materi/sesi-03-join](../materi/sesi-03-join/)

## Persiapan

- [ ] Jalankan `03_joins.sql`. Catat: jumlah baris `order_items` (A2), hasil F1 vs F2, dan perbedaan B1 dengan C1 sesi 2.
- [ ] Siapkan gambar/diagram relasi tabel. Diagram di [KAMUS_DATA.md](../KAMUS_DATA.md#hubungan-antar-tabel) bisa dipakai, atau gambar ulang dengan fitur **Whiteboard/Annotate** Zoom.

## Runsheet

| Waktu | Bagian | Poin utama |
| --- | --- | --- |
| 14.00 | Recap PR sesi 2 | Recap ringan (hanya 1 hari sejak sesi 2). Tampilkan 1 repo peserta yang rapi |
| 14.10 | Konsep | Kenapa data dipisah; primary/foreign key; diagram relasi. Analogi: KTP (users) dan struk belanja (orders) dihubungkan oleh NIK |
| 14.20 | INNER vs LEFT | Contoh kecil di whiteboard: 3 pelanggan, 2 punya pesanan → INNER = 2, LEFT = 3 |
| 14.30 | Demo A | JOIN pertama + **cek jumlah baris** (kebiasaan baik) |
| 14.38 | Demo B | Pendapatan per kategori versi tepat. Diskusikan perbedaan dengan sesi 2: sesi 2 menghitung barang yang Cancelled/Returned juga, dan memakai harga katalog |
| 14.45 | Demo C–D | JOIN pesanan + pelanggan; JOIN tiga tabel; AOV |
| 14.55 | Demo E–F | LEFT JOIN untuk "yang tidak punya"; jebakan fan-out (F1 vs F2) |
| 15.05 | Giliran kamu | G1–G2 |
| 15.15 | Tanya jawab | |
| 15.35 | Penutup | PR: umur × gender. Jelaskan trik `FLOOR(age/10)*10` dengan contoh 23 → 20 |

## Poin penting

- **Alias tabel wajib** untuk kolom yang ada di dua tabel (`id`, `status`, `created_at`, `user_id`).
- **Kolom `status` di `order_items` vs `orders`.** Untuk pendapatan pakai `oi.status`; untuk menghitung pesanan pakai `o.status`.
- E2 memakai `CASE WHEN` di dalam `COUNT(DISTINCT ...)`. Cukup jelaskan hasilnya; CASE WHEN dibahas di sesi 4.

## Error yang sering muncul

| Error | Penyebab |
| --- | --- |
| `Column name id is ambiguous` | Tidak memakai alias tabel |
| Angka sangat besar / query lama | `ON` salah (misalnya `oi.id = p.id`) atau lupa `ON` |
| `Unrecognized name: oi` | Alias dipakai tapi tidak didefinisikan (`AS oi` lupa ditulis) |
| Jumlah pesanan terlalu besar | `COUNT(*)` setelah JOIN ke `order_items` (fan-out) |

## Kunci jawaban

```sql
-- G1. Pendapatan per negara dan department
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

-- G2. AOV per negara, pelanggan perempuan
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

-- PR1. Pendapatan per kelompok umur dan gender
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
```

Catatan: tanpa `CAST(... AS INT64)`, hasilnya tetap benar tapi tampil sebagai `20.0`, karena `/` di BigQuery selalu menghasilkan desimal. Jawaban peserta tanpa CAST tetap dianggap benar.

Hasil yang diharapkan: data TheLook sintetis, jadi perbedaan antar kelompok umur dan gender biasanya **kecil**. Ini bahan diskusi yang bagus: "tidak ada perbedaan" juga sebuah temuan yang sah.

## Untuk recap sesi 4

- Tampilkan hasil PR1 dan tanyakan: "kelompok umur 10 tahun ini kasar ya, bagaimana kalau kita ingin kelompok 18–24, 25–34?" → jembatan ke CASE WHEN.
