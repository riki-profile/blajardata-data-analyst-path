# Runsheet Sesi 2 · Agregasi dan Membuat Portofolio di GitHub

**Kamis, 12 November 2026 · 20.00–21.40 WIB** · Materi: [materi/sesi-02-agregasi](../materi/sesi-02-agregasi/)

## Persiapan

- [ ] Jalankan `02_aggregation.sql`. Catat top 3 kategori (C1) untuk dibandingkan di sesi 3.
- [ ] Siapkan akun GitHub demo (boleh akunmu sendiri) dan **hapus** repo `thelook-analysis` lama kalau ada, supaya bisa didemokan dari nol.
- [ ] Ingatkan di grup sebelum kelas: login GitHub di browser sebelum 20.00.

## Runsheet

| Waktu | Bagian | Poin utama |
| --- | --- | --- |
| 20.00 | Recap PR sesi 1 | 2 contoh pertanyaan bisnis; kesalahan umum |
| 20.15 | Demo A | Fungsi agregasi; `COUNT(*)` vs `COUNT(kolom)` vs `COUNT(DISTINCT)`. A5 adalah momen "aha" soal NULL |
| 20.22 | Demo B | GROUP BY dengan analogi keranjang. Sengaja picu error "neither grouped nor aggregated" dengan menambah `city` di SELECT B2 |
| 20.32 | Demo C | Jelaskan kenapa memakai `inventory_items` hari ini (JOIN belum dipelajari), dan bahwa ini **perkiraan** |
| 20.38 | Demo D | WHERE vs HAVING. Tunjukkan error kalau `AVG()` ditaruh di WHERE |
| 20.45 | Demo GitHub | Buat repo dari nol (6a), **Create new file** `sql/01_basics.sql` (6b), commit. Lalu edit file (6c). Minta semua peserta mengikuti; "ketik 1 kalau repo sudah jadi" |
| 21.05 | Giliran kamu | G1–G2 |
| 21.15 | Tanya jawab | Banyak pertanyaan GitHub biasanya muncul di sini |
| 21.35 | Penutup | PR: top 10 brand + 2 file di repo + kirim link repo ke grup |

## Poin penting

- **Aturan emas GROUP BY**: setiap kolom di SELECT ada di GROUP BY atau dibungkus agregasi.
- B3 memakai window function `SUM(COUNT(*)) OVER ()`. Cukup minta peserta menyalin polanya; window function di luar cakupan kursus.
- GitHub: tekankan **Public**, nama repo **persis** `thelook-analysis`, dan pesan commit yang jelas.
- Peserta yang lupa password GitHub atau belum verifikasi email: tangani di *breakout room* atau setelah kelas, jangan menahan seluruh kelas.

## Error yang sering muncul

| Error | Penyebab |
| --- | --- |
| `SELECT list expression references column x which is neither grouped nor aggregated` | Kolom di SELECT tidak ada di GROUP BY |
| `Aggregate function AVG not allowed in WHERE clause` | Pakai HAVING |
| GitHub: folder tidak terbentuk | Peserta mengetik `sql 01_basics.sql` (spasi) bukan `sql/01_basics.sql` |
| GitHub: file ter-upload ke root | Belum masuk ke folder sebelum **Upload files** |

## Kunci jawaban

```sql
-- G1. Produk per department
SELECT
  department,
  COUNT(*) AS jumlah_produk,
  ROUND(AVG(retail_price), 2) AS rata_harga
FROM `bigquery-public-data.thelook_ecommerce.products`
GROUP BY department;

-- G2. Pelanggan per traffic_source
SELECT
  traffic_source,
  COUNT(*) AS jumlah_pelanggan
FROM `bigquery-public-data.thelook_ecommerce.users`
GROUP BY traffic_source
ORDER BY jumlah_pelanggan DESC;

-- PR1. Top 10 brand berdasarkan pendapatan (perkiraan)
SELECT
  product_brand AS brand,
  COUNT(*) AS barang_terjual,
  ROUND(SUM(product_retail_price), 0) AS perkiraan_pendapatan_usd,
  ROUND(AVG(product_retail_price), 2) AS rata_harga_usd
FROM `bigquery-public-data.thelook_ecommerce.inventory_items`
WHERE sold_at IS NOT NULL
GROUP BY brand
ORDER BY perkiraan_pendapatan_usd DESC
LIMIT 10;
```

Contoh temuan yang baik: "Brand dengan pendapatan terbesar bukan yang paling banyak terjual. Brand X unggul karena harga rata-ratanya 2–3 kali lipat brand lain." Sesuaikan dengan hasil hari itu.

## Untuk recap sesi 3

- Kumpulkan link repo peserta. Buka 2–3 secara acak dan tunjukkan struktur yang benar.
- Bahas temuan top 10 brand: apakah brand teratas unggul karena **volume** atau **harga**?
