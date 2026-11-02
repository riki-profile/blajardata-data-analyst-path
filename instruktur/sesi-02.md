# Runsheet Sesi 2 · Agregasi dan Membuat Portofolio di GitHub

**Kamis, 12 November 2026 · 20.00–21.40 WIB** · Materi: [materi/sesi-02-agregasi](../materi/sesi-02-agregasi/)

## Persiapan

- [ ] Jalankan `02_aggregation.sql`. Catat top 3 kategori (C1) untuk dibandingkan di sesi 3.
- [ ] Siapkan akun GitHub demo (boleh akunmu sendiri) dan **hapus** repo `thelook-sql-analysis` lama kalau ada, supaya bisa didemokan dari nol.
- [ ] Ingatkan di grup sebelum kelas: login GitHub di browser sebelum 20.00.

## Runsheet

| Waktu | Bagian | Poin utama |
| --- | --- | --- |
| 20.00 | Recap sesi 1 | 5 menit: SELECT → FROM → WHERE → ORDER BY → LIMIT; kutip vs backtick |
| 20.05 | Demo A | Fungsi agregasi; `COUNT(*)` vs `COUNT(kolom)` vs `COUNT(DISTINCT)`. A5 adalah momen "aha" soal NULL |
| 20.13 | Demo B | GROUP BY dengan analogi keranjang. Sengaja picu error "neither grouped nor aggregated" dengan menambah `city` di SELECT B2 |
| 20.24 | Demo C | Jelaskan kenapa memakai `inventory_items` hari ini (JOIN belum dipelajari), dan bahwa ini **perkiraan** |
| 20.32 | Demo D | WHERE vs HAVING. Tunjukkan error kalau `AVG()` ditaruh di WHERE |
| 20.40 | **Kerjakan bersama** | B1–B2, dipandu langkah demi langkah |
| 20.50 | **Unggah bersama** | Buat repo `thelook-sql-analysis` dari nol (6a), **Create new file** `sql/01_basics.sql` (6b), lalu unggah `02_aggregation.sql`. "Ketik 1 kalau kedua file sudah ada". Peserta menempel link repo di chat |
| 21.15 | Tanya jawab | Banyak pertanyaan GitHub biasanya muncul di sini |
| 21.35 | Penutup | Jalankan **checklist hasil** di bawah. Ringkasan; latihan mandiri L1 (top 10 brand, opsional) |

## Checklist hasil (cek sebelum penutup)

Jalankan **sebelum penutup** (2–3 menit). Daftar yang sama ada di README sesi peserta (bagian *Checklist hasil*), jadi kamu bisa langsung menampilkan halaman README itu di layar, bacakan satu per satu, peserta mengetik `1` di chat kalau sudah. Yang belum: bantu sebentar, atau catat namanya untuk dibantu setelah kelas.

- [ ] B1–B2 terisi di `02_aggregation.sql`
- [ ] Repo **`thelook-sql-analysis`** ada, **Public**, dengan `README.md`
- [ ] Repo berisi `sql/01_basics.sql` dan `sql/02_aggregation.sql` (di dalam folder `sql`, bukan di root)
- [ ] Link repo sudah ditempel di chat Zoom (simpan daftarnya untuk sesi 13)

## Poin penting

- **Aturan emas GROUP BY**: setiap kolom di SELECT ada di GROUP BY atau dibungkus agregasi.
- B3 memakai window function `SUM(COUNT(*)) OVER ()`. Cukup minta peserta menyalin polanya; window function di luar cakupan kursus.
- GitHub: tekankan **Public**, nama repo **persis** `thelook-sql-analysis`. Jelaskan singkat bahwa setiap modul punya repo sendiri (Python di sesi 5, Power BI di sesi 10), dan pesan commit yang jelas.
- Peserta yang lupa password GitHub atau belum verifikasi email: tangani di *breakout room* atau setelah kelas, jangan menahan seluruh kelas.

## Error yang sering muncul

| Error | Penyebab |
| --- | --- |
| `SELECT list expression references column x which is neither grouped nor aggregated` | Kolom di SELECT tidak ada di GROUP BY |
| `Aggregate function AVG not allowed in WHERE clause` | Pakai HAVING |
| GitHub: folder tidak terbentuk | Peserta mengetik `sql 01_basics.sql` (spasi) bukan `sql/01_basics.sql` |
| GitHub: file ter-upload ke root | Belum masuk ke folder sebelum **Upload files** |

## Kunci jawaban

Versi lengkap (file kerja yang sudah terisi semua): [`kunci-jawaban/02_aggregation.sql`](kunci-jawaban/02_aggregation.sql). Ringkasannya:

```sql
-- B1. Produk per department
SELECT
  department,
  COUNT(*) AS jumlah_produk,
  ROUND(AVG(retail_price), 2) AS rata_harga
FROM `bigquery-public-data.thelook_ecommerce.products`
GROUP BY department;

-- B2. Pelanggan per traffic_source
SELECT
  traffic_source,
  COUNT(*) AS jumlah_pelanggan
FROM `bigquery-public-data.thelook_ecommerce.users`
GROUP BY traffic_source
ORDER BY jumlah_pelanggan DESC;

-- L1. Top 10 brand berdasarkan pendapatan (perkiraan)
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

## Untuk recap sesi 3 (5 menit)

- Buka 1–2 repo peserta dari link di chat sesi 2 dan tunjukkan struktur yang benar.
- Ulangi aturan emas GROUP BY dan WHERE vs HAVING.
