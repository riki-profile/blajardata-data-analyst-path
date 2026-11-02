# Runsheet Sesi 3 · JOIN

**Sabtu, 14 November 2026 · 14.00–15.40 WIB** · Materi: [materi/sesi-03-join](../materi/sesi-03-join/)

## Persiapan

- [ ] Jalankan `03_joins.sql`. Catat: jumlah baris `order_items` (A2), hasil F1 vs F2, dan perbedaan B1 dengan C1 sesi 2.
- [ ] Siapkan gambar/diagram relasi tabel. Diagram di [KAMUS_DATA.md](../KAMUS_DATA.md#hubungan-antar-tabel) bisa dipakai, atau gambar ulang dengan fitur **Whiteboard/Annotate** Zoom.

## Runsheet

| Waktu | Bagian | Poin utama |
| --- | --- | --- |
| 14.00 | Recap sesi 2 | 5 menit: GROUP BY, WHERE vs HAVING; tunjukkan 1 repo peserta yang rapi |
| 14.05 | Konsep | Kenapa data dipisah; primary/foreign key; diagram relasi. Analogi: KTP (users) dan struk belanja (orders) dihubungkan oleh NIK |
| 14.12 | INNER vs LEFT | Contoh kecil di whiteboard: 3 pelanggan, 2 punya pesanan → INNER = 2, LEFT = 3 |
| 14.20 | Demo A | JOIN pertama + **cek jumlah baris** (kebiasaan baik) |
| 14.27 | Demo B | Pendapatan per kategori versi tepat. Diskusikan perbedaan dengan sesi 2: sesi 2 menghitung barang yang Cancelled/Returned juga, dan memakai harga katalog |
| 14.35 | Demo C–D | JOIN pesanan + pelanggan; JOIN tiga tabel; AOV |
| 14.45 | Demo E–F | LEFT JOIN untuk "yang tidak punya"; jebakan fan-out (F1 vs F2) |
| 14.55 | **Kerjakan bersama** | B1–B2: bangun query JOIN tiga tabel langkah demi langkah, peserta mengetik bersamaan |
| 15.10 | **Unggah bersama** | `03_joins.sql` ke folder `sql` repo `thelook-sql-analysis` |
| 15.20 | Tanya jawab | |
| 15.37 | Penutup | Jalankan **checklist hasil** di bawah. Ringkasan; latihan mandiri L1 (umur × gender, opsional) |

## Checklist hasil (cek sebelum penutup)

Jalankan **sebelum penutup** (2–3 menit): tampilkan daftar ini di layar, bacakan satu per satu, peserta mengetik `1` di chat kalau sudah. Yang belum: bantu sebentar, atau catat namanya untuk dibantu setelah kelas.

- [ ] B1–B2 terisi di `03_joins.sql` dan hasilnya keluar
- [ ] `sql/03_joins.sql` ada di repo `thelook-sql-analysis`
- [ ] Repo sekarang berisi 3 file di folder `sql/`

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

Versi lengkap (file kerja yang sudah terisi semua): [`kunci-jawaban/03_joins.sql`](kunci-jawaban/03_joins.sql). Ringkasannya:

```sql
-- B1. Pendapatan per negara dan department
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

-- B2. AOV per negara, pelanggan perempuan
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

-- L1. Pendapatan per kelompok umur dan gender
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

## Untuk recap sesi 4 (5 menit)

- Ulangi pola JOIN + alias + `COUNT(DISTINCT order_id)`.
- Jembatan ke CASE WHEN: "kalau kita ingin kelompok umur 18–24, 25–34, bagaimana?"
