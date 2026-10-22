# Runsheet Sesi 1 · Mengenal Analisis Data dan Dasar SQL

**Selasa, 10 November 2026 · 20.00–22.00 WIB (2 jam)** · Materi: [materi/sesi-01-dasar-sql](../materi/sesi-01-dasar-sql/)

## Persiapan

- [ ] Jalankan semua query `01_basics.sql`. Catat jumlah pesanan per status hari ini.
- [ ] Siapkan polling Zoom: "Laptop yang kamu pakai: Windows / Mac / Linux / Chromebook". Catat pengguna Mac: mereka perlu [panduan Parallels](../PANDUAN_MAC_PARALLELS.md) sebelum sesi 10.
- [ ] Siapkan daftar peserta yang belum menyelesaikan PERSIAPAN; minta asisten/co-host membantu mereka di *breakout room* selama 15 menit pertama.

## Runsheet

| Waktu | Bagian | Poin utama |
| --- | --- | --- |
| 20.00 | Pembukaan | Perkenalan instruktur; peserta perkenalan singkat di chat (nama, pekerjaan, alasan ikut). Jelaskan ritme sesi dan **konvensi chat 1/2/?** |
| 20.08 | Aturan main | Kamera opsional tapi dianjurkan; rekaman dibagikan; **tanpa PR wajib**: semua latihan dan unggah portofolio dikerjakan bersama di kelas; "ketik sendiri, jangan hanya menonton". Jalankan polling OS |
| 20.15 | Apa itu analisis data | Bahas tabel "bukan pertanyaan vs pertanyaan yang baik". Minta 2–3 peserta menulis satu pertanyaan bisnis di chat |
| 20.25 | Alur kerja analis | Petakan 5 langkah ke tools dan sesi. Tunjukkan contoh portofolio jadi (kalau ada) supaya peserta melihat tujuan akhirnya |
| 20.30 | TheLook | Cerita perannya: analis baru, 3 pertanyaan besar manajemen. Buka [KAMUS_DATA.md](../KAMUS_DATA.md) dan jelaskan diagram relasinya sekilas |
| 20.35 | Tur BigQuery | Explorer, Schema, Details, **Preview (gratis)**, editor, hasil, *bytes processed*. Cara menjalankan satu query (blok → Run) |
| 20.45 | Demo A–B | Tur 5 tabel → SELECT kolom → ORDER BY + LIMIT (produk termahal) → alias → DISTINCT |
| 21.05 | Demo C | WHERE: `=`, `AND`, `IN`, `BETWEEN`, `LIKE`, `IS NULL`. Sengaja buat kesalahan: `'jeans'` huruf kecil (0 hasil), lalu `= NULL` (0 hasil) |
| 21.18 | Demo D | DISTINCT status → COUNT(*) per status satu per satu → "repot ya? sesi 2 kita pakai GROUP BY" |
| 21.25 | **Kerjakan bersama** | B1–B2: tulis query di layar sambil bertanya "kolom apa? filter apa?", peserta mengetik bersamaan. Lalu simpan `01_basics.sql` di laptop bersama-sama (Notepad/TextEdit *Plain Text*) |
| 21.40 | Tanya jawab | |
| 21.55 | Penutup | 3 poin ringkasan; sebutkan latihan mandiri L1–L5 (opsional) |

## Poin penting dan miskonsepsi

- **Urutan penulisan ≠ urutan proses.** Ini menjelaskan kenapa alias di SELECT bisa dipakai di ORDER BY, tapi tidak di WHERE.
- **`LIMIT` tidak menghemat biaya** di BigQuery. Tegaskan, tapi juga tenangkan peserta bahwa sandbox gratis dan tabel TheLook kecil.
- **Kutip tunggal vs backtick.** Paling sering jadi sumber error minggu pertama.
- **Huruf besar-kecil** di nilai teks: `'Jeans'` ≠ `'jeans'`. Nama kolom dan perintah SQL tidak peka huruf besar-kecil.

## Error yang sering muncul

| Error | Penyebab |
| --- | --- |
| `Syntax error: Unexpected string literal 'bigquery-public-data...'` | Nama tabel pakai kutip, bukan backtick |
| `Unrecognized name: Category` / `Name x not found` | Salah ketik nama kolom; cek tab Schema |
| `Syntax error: Expected end of input but got keyword SELECT` | Dua query tanpa `;`, atau menjalankan seluruh tab tanpa memblok satu query |
| `Access Denied: Project ...` | Project sandbox belum dipilih di header |
| Hasil kosong | Huruf besar-kecil, spasi di dalam kutip, atau `= NULL` |

## Kunci jawaban

Versi lengkap (file kerja yang sudah terisi semua): [`kunci-jawaban/01_basics.sql`](kunci-jawaban/01_basics.sql). Ringkasannya:

```sql
-- B1. 5 dress termurah
SELECT name, brand, retail_price
FROM `bigquery-public-data.thelook_ecommerce.products`
WHERE department = 'Women'
  AND category = 'Dresses'
ORDER BY retail_price ASC
LIMIT 5;

-- B2. Jumlah pesanan Returned
SELECT COUNT(*) AS jumlah_pesanan
FROM `bigquery-public-data.thelook_ecommerce.orders`
WHERE status = 'Returned';

-- L1. Produk satu brand (contoh: Calvin Klein)
SELECT name, category, retail_price
FROM `bigquery-public-data.thelook_ecommerce.products`
WHERE brand = 'Calvin Klein'
ORDER BY retail_price DESC;

-- L2. Pelanggan Brasil di bawah 25 tahun
SELECT first_name, last_name, age, city
FROM `bigquery-public-data.thelook_ecommerce.users`
WHERE country = 'Brasil'
  AND age < 25;

-- L3. 10 pesanan Returned terbaru
SELECT order_id, user_id, created_at, returned_at
FROM `bigquery-public-data.thelook_ecommerce.orders`
WHERE status = 'Returned'
ORDER BY created_at DESC
LIMIT 10;

-- L4. Sweaters 50-100 USD
SELECT name, brand, retail_price
FROM `bigquery-public-data.thelook_ecommerce.products`
WHERE category = 'Sweaters'
  AND retail_price BETWEEN 50 AND 100
ORDER BY retail_price;

-- L5. Pelanggan Facebook dari United States
SELECT first_name, last_name, age, city
FROM `bigquery-public-data.thelook_ecommerce.users`
WHERE traffic_source = 'Facebook'
  AND country = 'United States'
LIMIT 20;
```

**Lima pertanyaan bisnis:** nilai berdasarkan kriteria spesifik, bisa diukur, dan berguna. Simpan contoh pertanyaan yang bagus. Pertanyaan-pertanyaan ini bisa dipakai sebagai contoh di sesi 12 dan sebagai ide proyek lanjutan setelah kursus.

## Untuk recap sesi 2 (5 menit)

- Tampilkan 2 contoh pertanyaan bisnis yang bagus dari chat sesi 1, dan 1 yang bisa diperbaiki (tanpa nama).
- Ulangi 3 jebakan: kutip vs backtick, huruf besar-kecil, `IS NULL`.
