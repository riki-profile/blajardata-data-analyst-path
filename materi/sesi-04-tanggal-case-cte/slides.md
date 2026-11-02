---
marp: true
theme: default
paginate: true
size: 16:9
footer: "Sesi 4 · Tanggal, CASE WHEN, CTE + Proyek SQL"
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

# Sesi 4 · Tanggal, CASE WHEN, CTE + Proyek SQL

Selasa, 17 November 2026 · 20.00–21.40 WIB

---

## Agenda

| Waktu | Bagian |
| --- | --- |
| 20.00 | Recap sesi 3 |
| 20.05 | Fungsi tanggal & tren bulanan |
| 20.18 | CASE WHEN & kelompok umur |
| 20.28 | CTE (+ sekilas pembersihan) |
| 20.40 | **Proyek SQL bersama**: P1–P3 → 3 temuan + rekomendasi |
| 21.00 | **Unggah bersama**: README + `04_...sql` |
| 21.15 | Tanya jawab |
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

Di kelas hanya sekilas; bagian **E** boleh dijalankan sendiri (opsional). Pembersihan lengkap → Python, sesi 8

---

<!-- _class: section -->

# Proyek SQL

Kondisi bisnis TheLook

---

## Tiga pertanyaan manajemen, tiga query

| Query | Pertanyaan | Yang dihitung |
| --- | --- | --- |
| **P1** | Bagaimana kondisi bisnis kita? | Pendapatan, pesanan, AOV: 12 bulan terakhir vs sebelumnya |
| **P2** | Di mana uang kita dihasilkan? | Porsi pendapatan & margin % per kategori |
| **P3** | Apakah pelanggan kembali berbelanja? | % pelanggan yang belanja 1×, 2×, 3+× |

Query sudah ada di bagian **PROYEK SQL** file kerja.
Tugasmu = pekerjaan analis: **jalankan → baca hasil → tulis kesimpulan**

Ketik `1` kalau P3 sudah keluar hasilnya

---

## Menulis temuan

**Apa** (dengan angka) → **kenapa penting**

> Pendapatan 12 bulan terakhir naik X% dibanding 12 bulan sebelumnya. Kenaikannya datang dari jumlah pesanan, sedangkan AOV hampir sama: bisnis tumbuh karena makin banyak orang berbelanja.

Kita tulis **temuan 1–3 + rekomendasi bersama-sama**. Mulai dari hasil P1:
- Naik atau turun? Berapa persen?
- Karena jumlah pesanan, atau karena AOV?

---

## README portofolio SQL

Repo **`thelook-sql-analysis`** → edit `README.md` → tempel **template README SQL**

| Bagian README | Isi |
| --- | --- |
| Ringkasan | 2–3 kalimat: apa yang dianalisis, hasil utama |
| Pertanyaan bisnis | 3 pertanyaan manajemen |
| Temuan | Temuan 1–3 dari P1–P3 |
| Rekomendasi | 1 tindakan konkret |
| File | Daftar `sql/01_...` sampai `sql/04_...` |

Semua diisi **bersama di kelas** hari ini.

---

## Unggah bersama & latihan mandiri

**Unggah bersama sekarang**, di repo `thelook-sql-analysis`:
1. `README.md` → tempel template SQL → isi Ringkasan, 3 temuan, rekomendasi
2. Unggah `sql/04_dates_case_cte.sql` (cek `01`–`03` sudah ada)

**Portofolio modul SQL selesai!**

**Latihan mandiri (opsional):** tidak wajib, tidak dinilai; jawaban dibagikan setelah kelas: L1–L2 (pendapatan per tahun, kelompok harga), bonus tabel analisis

---

## Ringkasan

- `DATE()`, `EXTRACT()`, `DATE_TRUNC()`, `DATE_DIFF()`; buang bulan berjalan
- `CASE WHEN` membuat kategori; dicek dari atas ke bawah
- CTE memecah query panjang menjadi langkah bernama
- Proyek SQL: query → temuan → rekomendasi → README
- **Modul SQL selesai!** Repo `thelook-sql-analysis` = portofolio modul ini

**Sesi berikutnya:** Kamis, 19 November 2026, 20.00 WIB
Dasar Python I di Google Colab
