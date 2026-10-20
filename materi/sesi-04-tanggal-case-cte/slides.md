---
marp: true
theme: default
paginate: true
size: 16:9
footer: "Sesi 4 · Tanggal, CASE WHEN, CTE"
style: |
  section {
    font-family: 'Segoe UI', 'Helvetica Neue', Arial, sans-serif;
    font-size: 30px;
    color: #202124;
    background: #ffffff;
    padding: 48px 64px;
    justify-content: flex-start;
  }
  h1 { color: #2a78d6; font-size: 46px; margin-bottom: 12px; }
  h2 { color: #2a78d6; font-size: 38px; margin-bottom: 12px; }
  h3 { color: #5f6368; font-size: 30px; }
  strong { color: #c4501f; }
  a { color: #2a78d6; }
  table { font-size: 24px; border-collapse: collapse; }
  th { background: #e8f0fb; color: #1a4f91; }
  th, td { padding: 6px 12px; border: 1px solid #dadce0; }
  code { background: #f1f3f4; color: #202124; border-radius: 4px; padding: 0 4px; }
  pre { font-size: 21px; line-height: 1.35; border-radius: 6px; }
  pre code { background: transparent; padding: 0; }
  blockquote { border-left: 6px solid #eb6834; color: #3c4043; background: #fdf1ec; padding: 10px 18px; }
  footer { color: #9aa0a6; font-size: 14px; }
  section::after { color: #9aa0a6; font-size: 14px; }
  section.lead { background: #2a78d6; color: #ffffff; justify-content: center; }
  section.lead h1, section.lead h2, section.lead h3, section.lead strong { color: #ffffff; }
  section.lead footer, section.lead::after { color: #d2e3fc; }
  section.lead code { background: rgba(255,255,255,0.2); color: #ffffff; }
  section.section { background: #f8f9fa; justify-content: center; }
  section.section h1 { font-size: 52px; }
  section.small { font-size: 25px; }
  section.small table { font-size: 20px; }
  section.small pre { font-size: 18px; }
---

<!-- _class: lead -->
<!-- _paginate: false -->

# Sesi 4 · Tanggal, CASE WHEN, CTE & Pembersihan Dasar

Selasa, 17 November 2026 · 20.00–21.40 WIB

---

## Agenda

| Waktu | Bagian |
| --- | --- |
| 20.00 | Recap PR sesi 3 (umur & gender) |
| 20.15 | Fungsi tanggal & tren bulanan |
| 20.35 | CASE WHEN & kelompok umur |
| 20.50 | CTE & pembersihan dasar |
| 21.05 | Giliran kamu |
| 21.15 | PR "tabel analisis" + tanya jawab |
| 21.35 | Penutup |

File kerja: `04_dates_case_cte.sql`

---

## Recap: kelompok umur per 10 tahun

`FLOOR(age / 10) * 10` → 20, 30, 40, ...

Bagaimana kalau kita ingin kelompok **18–24, 25–34, 35–44**?
→ Hari ini: **CASE WHEN**

---

<!-- _class: section -->

# Bekerja dengan tanggal

---

## Fungsi tanggal

Contoh untuk `created_at = 2025-03-17 14:05:00` (TIMESTAMP, UTC):

| Fungsi | Hasil |
| --- | --- |
| `DATE(created_at)` | `2025-03-17` |
| `EXTRACT(YEAR FROM created_at)` | `2025` |
| `DATE_TRUNC(DATE(created_at), MONTH)` | `2025-03-01` ← untuk tren bulanan |
| `FORMAT_DATE('%Y-%m', DATE(created_at))` | `'2025-03'` |
| `DATE_DIFF(tgl_akhir, tgl_awal, DAY)` | selisih hari |
| `DATE_SUB(CURRENT_DATE(), INTERVAL 12 MONTH)` | 12 bulan lalu |

---

## Demo B · Tren pendapatan bulanan

```sql
SELECT
  DATE_TRUNC(DATE(oi.created_at), MONTH) AS bulan,
  ROUND(SUM(oi.sale_price), 0) AS pendapatan_usd
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
WHERE oi.status NOT IN ('Cancelled', 'Returned')
  AND DATE(oi.created_at) < DATE_TRUNC(CURRENT_DATE(), MONTH)
GROUP BY bulan
ORDER BY bulan;
```

**Buang bulan berjalan!** Bulan ini belum selesai → grafik terlihat "anjlok" di ujung.

Tip: klik tab **Chart** di hasil query.

---

<!-- _class: section -->

# CASE WHEN

Membuat kategori sendiri

---

## CASE WHEN

```sql
CASE
  WHEN age < 18 THEN '1. Di bawah 18'
  WHEN age < 25 THEN '2. 18-24'
  WHEN age < 35 THEN '3. 25-34'
  ELSE '4. 35+'
END AS kelompok_umur
```

- Dicek **dari atas ke bawah**; yang pertama benar yang dipakai
- Tanpa `ELSE` → sisanya NULL
- Angka "1.", "2." di depan label → urutan benar saat `ORDER BY`
- `COUNTIF(status = 'Returned')` = versi singkat `SUM(CASE WHEN ... THEN 1 ELSE 0 END)`

---

<!-- _class: section -->

# CTE

Query bertahap dengan `WITH`

---

## CTE: tabel sementara bernama

```sql
WITH pesanan_per_pelanggan AS (      -- langkah 1
  SELECT user_id, COUNT(*) AS jumlah_pesanan
  FROM `bigquery-public-data.thelook_ecommerce.orders`
  GROUP BY user_id
)
SELECT                               -- langkah 2
  jumlah_pesanan,
  COUNT(*) AS jumlah_pelanggan
FROM pesanan_per_pelanggan
GROUP BY jumlah_pesanan
ORDER BY jumlah_pesanan;
```

Beberapa CTE dipisahkan **koma**: `WITH a AS (...), b AS (...) SELECT ...`

---

## Pembersihan data dasar

| Masalah | Cek | Atasi |
| --- | --- | --- |
| Nilai kosong | `COUNTIF(brand IS NULL)` | `COALESCE(brand, 'Tidak diketahui')` |
| Spasi / huruf tidak seragam | `SELECT DISTINCT` | `TRIM()`, `INITCAP()` |
| Ejaan berbeda | `SELECT DISTINCT country` | `CASE WHEN country = 'Brasil' ...` |
| Duplikat | `COUNT(*)` vs `COUNT(DISTINCT id)` | `DISTINCT` / perbaiki JOIN |
| Bagi nol | | `SAFE_DIVIDE(a, b)` |

Pembersihan lengkap → Python, sesi 8

---

<!-- _class: lead -->

# Giliran kamu · 10 menit

**G1.** Pendapatan per **tahun**, hanya tahun yang sudah lengkap

**G2.** Produk `Murah` (< 25), `Sedang` (25–75), `Mahal` (> 75): berapa jumlahnya?

---

## PR: tabel analisis

**Satu query**, satu baris per barang terjual. Dipakai lagi di sesi 7–9!

| Kolom | Asal |
| --- | --- |
| `order_item_id`, `order_id`, `user_id`, `product_id`, `status` | `order_items` |
| `order_date`, `order_month` | dari `created_at` |
| `sale_price`, `cost`, `margin` | `order_items`, `products` |
| `category`, `brand`, `department` | `products` |
| `age`, `age_band`, `gender`, `country`, `traffic_source` | `users` |

Syarat: tanpa Cancelled/Returned, tanpa bulan berjalan, **minimal 1 CTE**.
Kerangka: bagian **F** file kerja.

---

## Ringkasan

- `DATE()`, `EXTRACT()`, `DATE_TRUNC()`, `DATE_DIFF()`; buang bulan berjalan
- `CASE WHEN` membuat kategori; dicek dari atas ke bawah
- CTE memecah query panjang menjadi langkah bernama
- Cek NULL, teks tidak seragam, duplikat
- **Modul SQL selesai!**

**Sesi berikutnya:** Kamis, 19 November 2026, 20.00 WIB
Dasar Python I di Google Colab
