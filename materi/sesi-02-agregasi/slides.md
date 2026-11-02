---
marp: true
theme: default
paginate: true
size: 16:9
footer: "Sesi 2 · Agregasi & Portofolio GitHub"
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

# Sesi 2 · Agregasi & Portofolio di GitHub

COUNT, SUM, AVG, GROUP BY, HAVING

Kamis, 12 November 2026 · 20.00–21.40 WIB

---

## Agenda

| Waktu | Bagian |
| --- | --- |
| 20.00 | Recap sesi 1 |
| 20.05 | Fungsi agregasi, GROUP BY, HAVING |
| 20.40 | **Kerjakan bersama** |
| 20.50 | **Unggah bersama**: repo `thelook-sql-analysis` |
| 21.15 | Tanya jawab |
| 21.35 | Penutup |

File kerja: `02_aggregation.sql`

---

## Recap sesi 1

- `SELECT` → `FROM` → `WHERE` → `ORDER BY` → `LIMIT`
- Teks pakai `'kutip'`, tabel pakai `` `backtick` ``
- Kemarin kita menghitung pesanan **satu status per query**

Hari ini: **semua status dalam satu query.**

---

<!-- _class: section -->

# Fungsi agregasi

Banyak baris → satu angka

---

## Fungsi agregasi

| Fungsi | Arti | Contoh |
| --- | --- | --- |
| `COUNT(*)` | jumlah baris | `COUNT(*)` |
| `COUNT(kolom)` | jumlah yang **tidak NULL** | `COUNT(shipped_at)` |
| `COUNT(DISTINCT kolom)` | jumlah nilai unik | `COUNT(DISTINCT user_id)` |
| `SUM` / `AVG` | total / rata-rata | `SUM(sale_price)` |
| `MIN` / `MAX` | terkecil / terbesar | `MIN(created_at)` |
| `ROUND(x, n)` | bulatkan n desimal | `ROUND(AVG(retail_price), 2)` |

Demo bagian A

---

## GROUP BY: satu angka per kelompok

```sql
SELECT
  status,                        -- kolom pengelompokan
  COUNT(*) AS jumlah_pesanan     -- agregasi per kelompok
FROM `bigquery-public-data.thelook_ecommerce.orders`
GROUP BY status
ORDER BY jumlah_pesanan DESC;
```

Bayangkan BigQuery memilah semua baris ke **keranjang** per `status`, lalu menghitung isi setiap keranjang.

---

## Aturan emas GROUP BY

Setiap kolom di `SELECT` harus:

1. **ada di `GROUP BY`**, atau
2. **dibungkus fungsi agregasi**

Kalau tidak:

> `SELECT list expression references column city which is neither grouped nor aggregated`

Demo bagian B: pesanan per status, pelanggan per negara, persentase per negara

---

## Pendapatan per kategori, tanpa JOIN dulu

Kategori ada di tabel `products`, harga jual ada di `order_items` → butuh **JOIN** (sesi 3).

Jalan pintas hari ini: `inventory_items` sudah menyimpan salinan kategori & harga.

```sql
SELECT
  product_category AS kategori,
  COUNT(*) AS barang_terjual,
  ROUND(SUM(product_retail_price), 0) AS perkiraan_pendapatan_usd
FROM `bigquery-public-data.thelook_ecommerce.inventory_items`
WHERE sold_at IS NOT NULL
GROUP BY kategori
ORDER BY perkiraan_pendapatan_usd DESC;
```

Ini **perkiraan**. Versi tepatnya di sesi 3.

---

## WHERE vs HAVING

| | `WHERE` | `HAVING` |
| --- | --- | --- |
| Memfilter | **baris**, sebelum dikelompokkan | **kelompok**, sesudahnya |
| Boleh pakai agregasi? | Tidak | Ya |
| Contoh | `WHERE department = 'Women'` | `HAVING COUNT(*) > 1000` |

Urutan menulis:
`SELECT` → `FROM` → `WHERE` → `GROUP BY` → `HAVING` → `ORDER BY` → `LIMIT`

Demo bagian D

---

<!-- _class: section -->

# Portofolio di GitHub

---

## Membuat repository

1. github.com → **+** (kanan atas) → **New repository**
2. Name: `thelook-sql-analysis`
3. Description: *Analisis kondisi bisnis e-commerce TheLook dengan SQL (BigQuery)*
4. **Public** 
5. Centang **Add a README file**
6. **Create repository**

Ketik `1` kalau repo sudah jadi

---

## Menambah file & folder

GitHub tidak bisa membuat folder kosong. Folder terbentuk saat file dibuat di dalamnya.

**Add file → Create new file**

- Nama file: `sql/01_basics.sql` ← tanda `/` membuat folder `sql`
- Tempel isi query → **Commit changes**

**Add file → Upload files**: untuk file yang sudah ada di laptop (masuk ke folder tujuan dulu)

**Edit**: buka file → ikon → ubah → **Commit changes**

> Pesan commit yang jelas: `Tambah query agregasi sesi 2`, bukan `update`

---

## Satu modul, satu repo portofolio

```
thelook-sql-analysis/
├── README.md       ← sesi 4 (Proyek SQL)
└── sql/            ← hari ini, sesi 3, sesi 4
```

| Modul | Repo | Dibuat di |
| --- | --- | --- |
| SQL | `thelook-sql-analysis` | hari ini |
| Python | `thelook-python-analysis` | sesi 5 |
| Power BI | `thelook-powerbi-dashboard` | sesi 10 |

Mulai sekarang: **unggah file setiap selesai sesi.**

---

<!-- _class: lead -->

# Kerjakan bersama · 10 menit

**B1.** Jumlah produk & rata-rata harga per **department**

**B2.** Jumlah pelanggan per **traffic_source**, dari terbanyak

Instruktur memandu langkah demi langkah · kamu mengetik bersamaan

---

## Unggah bersama & latihan mandiri

**Di akhir sesi ini**, repo `thelook-sql-analysis` berisi:
- `sql/01_basics.sql`
- `sql/02_aggregation.sql`

Kirim link repo-mu ke chat Zoom

**Latihan mandiri (opsional):** tidak wajib, tidak dinilai; jawaban dibagikan setelah kelas:
- L1: top 10 brand berdasarkan pendapatan + 1 kalimat temuan

---

## Ringkasan

- Agregasi: banyak baris → satu angka. `GROUP BY`: satu angka per kelompok
- Kolom di `SELECT` → ada di `GROUP BY` atau dibungkus agregasi
- `WHERE` filter baris, `HAVING` filter kelompok
- Repo portofolio sudah jadi 

**Sesi berikutnya:** Sabtu, 14 November 2026, **14.00 WIB**
JOIN: menggabungkan pesanan, produk, dan pelanggan
