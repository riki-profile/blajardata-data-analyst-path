---
marp: true
theme: default
paginate: true
size: 16:9
footer: "Sesi 1 · Mengenal Analisis Data & Dasar SQL"
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

# Data Analysis dengan BigQuery, Python & BI

## Sesi 1 · Mengenal Analisis Data & Dasar SQL

Selasa, 10 November 2026 · 20.00–22.00 WIB

---

## Selamat datang! 

- 13 sesi · Selasa & Kamis 20.00, Sabtu 14.00 WIB
- Kamu berperan sebagai **analis baru di TheLook**, toko pakaian online
- Hasil akhir: **portofolio analisis data di GitHub**, dibangun sedikit demi sedikit setiap sesi

| Modul | Tools | Sesi |
| --- | --- | --- |
| SQL | BigQuery | 1–4 |
| Python | Google Colab + pandas | 5–9 |
| Power BI | Power BI Desktop | 10–11 |
| Portofolio | GitHub | 12–13 |

---

## Aturan main

- Kamera dianjurkan, mikrofon mute kecuali bicara
- Setiap sesi direkam dan dibagikan di grup
- ⌨**Ketik dan jalankan sendiri**, jangan hanya menonton
- **Tanpa PR wajib**: latihan dikerjakan bersama, portofolio diunggah bersama di kelas

### Kode chat Zoom

| Ketik | Artinya |
| --- | --- |
| `1` | Sudah berhasil |
| `2` | Error / tertinggal |
| `?` + pertanyaan | Ada pertanyaan |

---

## Agenda hari ini

| Waktu | Bagian |
| --- | --- |
| 20.00 | Perkenalan & aturan main |
| 20.15 | Apa itu analisis data? Alur kerja analis |
| 20.35 | Demo: tur tabel, SELECT, WHERE, ORDER BY, LIMIT |
| 21.25 | **Kerjakan bersama** + simpan `01_basics.sql` |
| 21.40 | Tanya jawab |
| 21.55 | Penutup |

---

<!-- _class: section -->

# Apa itu analisis data?

---

## Data → jawaban → keputusan

Analis yang baik **tidak dimulai dari data**, tetapi dari **pertanyaan**.

| Bukan pertanyaan analisis | Pertanyaan analisis yang baik |
| --- | --- |
| "Coba lihat datanya." | "Kategori apa yang pendapatannya terbesar tahun ini?" |
| "Penjualan bagaimana?" | "Apakah pendapatan bulanan naik dalam 12 bulan terakhir?" |
| "Pelanggan kita siapa?" | "Dari negara mana sebagian besar pelanggan kita?" |

Pertanyaan yang baik: **spesifik**, **bisa diukur**, **berguna untuk keputusan**.

> Tulis satu pertanyaan bisnis untuk toko online di chat!

---

## Alur kerja analis

```
1. Tanya  →  2. Kumpulkan  →  3. Bersihkan  →  4. Analisis  →  5. Sajikan
```

| Langkah | Tools | Sesi |
| --- | --- | --- |
| Tanya | Kepala & catatanmu | Setiap sesi |
| Kumpulkan | SQL di BigQuery | 1–4 |
| Bersihkan & analisis | Python + pandas di Colab | 5–9 |
| Sajikan | Dashboard, README GitHub | 10–13 |

---

## Kenalan dengan TheLook

Manajemen punya 3 pertanyaan besar:

1. **Bagaimana kondisi bisnis kita?** pendapatan, pesanan, tren
2. **Siapa pelanggan kita?** negara, umur, gender, kebiasaan belanja
3. **Di mana peluang untuk tumbuh?** kategori, segmen, saluran pemasaran

Dataset: `bigquery-public-data.thelook_ecommerce`

```
users ──< orders ──< order_items >── products
```

Satu pelanggan → banyak pesanan → banyak barang → setiap barang adalah satu produk.

---

## Mengenal layar BigQuery

| Bagian | Fungsi |
| --- | --- |
| **Explorer** (kiri) | Daftar dataset & tabel. Klik tabel → *Schema*, *Details*, **Preview (gratis)** |
| **Editor** (tengah) | Tempat menulis query. Jalankan: **Ctrl/Cmd + Enter** |
| **Query results** (bawah) | Hasil query + *bytes processed* |

Nama tabel = `project.dataset.tabel`, ditulis dengan **backtick**:

```sql
`bigquery-public-data.thelook_ecommerce.products`
```

---

<!-- _class: section -->

# Dasar SQL

---

## Struktur query

```sql
SELECT kolom1, kolom2          -- 3. kolom apa yang ditampilkan
FROM `project.dataset.tabel`   -- 1. dari tabel mana
WHERE kondisi                  -- 2. baris mana yang diambil
ORDER BY kolom1 DESC           -- 4. diurutkan bagaimana
LIMIT 10;                      -- 5. berapa baris
```

Angka = **urutan BigQuery memproses** query, bukan urutan menulisnya.

---

## Demo A–B · Tur tabel & produk termahal

`01_basics.sql` bagian A dan B

```sql
-- Apa 10 produk termahal kita?
SELECT name, brand, category, retail_price
FROM `bigquery-public-data.thelook_ecommerce.products`
ORDER BY retail_price DESC
LIMIT 10;
```

- `ORDER BY ... DESC` = besar → kecil, `ASC` (default) = kecil → besar
- `AS` = memberi nama lain: `retail_price AS harga_usd`
- `SELECT DISTINCT category` = nilai unik saja

---

## Demo C · WHERE: memfilter baris

| Operator | Contoh |
| --- | --- |
| `=`, `!=` | `status = 'Complete'` |
| `>`, `>=`, `<` | `retail_price > 100` |
| `AND`, `OR` | `department = 'Men' AND retail_price > 100` |
| `IN (...)` | `country IN ('Japan', 'France')` |
| `BETWEEN` | `age BETWEEN 18 AND 24` (termasuk 18 dan 24) |
| `LIKE` | `name LIKE '%Hoodie%'` (`%` = teks apa saja) |
| `IS NULL` | `shipped_at IS NULL` |

---

## Demo C · Contoh

```sql
-- Produk pria dengan harga di atas 100 USD
SELECT name, category, retail_price
FROM `bigquery-public-data.thelook_ecommerce.products`
WHERE department = 'Men'
  AND retail_price > 100
ORDER BY retail_price DESC;
```

Coba juga: `'jeans'` huruf kecil → hasilnya kosong. Kenapa?

---

## Jebakan yang sering terjadi

| Salah | Benar | Kenapa |
| --- | --- | --- |
| `'bigquery-public-data...'` | `` `bigquery-public-data...` `` | Nama tabel pakai **backtick** |
| `WHERE category = 'jeans'` | `WHERE category = 'Jeans'` | Teks **membedakan huruf besar-kecil** |
| `WHERE shipped_at = NULL` | `WHERE shipped_at IS NULL` | NULL dicek dengan `IS NULL` |

**Biaya BigQuery = data yang dibaca**, bukan jumlah baris. `LIMIT` **tidak** menghemat biaya. Pilih kolom seperlunya, pakai **Preview** untuk melihat isi tabel.

---

## Demo D · Menghitung pesanan per status

```sql
SELECT DISTINCT status
FROM `bigquery-public-data.thelook_ecommerce.orders`;

SELECT COUNT(*) AS jumlah_pesanan
FROM `bigquery-public-data.thelook_ecommerce.orders`
WHERE status = 'Complete';
```

5 status → 5 query? Repot!
**Sesi 2:** kita lakukan sekaligus dengan `GROUP BY`.

---

<!-- _class: lead -->

# Kerjakan bersama · 15 menit

**B1.** 5 produk **termurah** di department `Women`, kategori `Dresses` (name, brand, retail_price)

**B2.** Ada berapa pesanan dengan status `Returned`?

Instruktur memandu langkah demi langkah · kamu mengetik bersamaan

---

## Simpan bersama & latihan mandiri

**Simpan bersama sekarang:** salin isi file ke Notepad / TextEdit (*Plain Text*) → simpan sebagai `01_basics.sql`
Kita unggah ke GitHub bersama di sesi 2.

**Latihan mandiri (opsional):** tidak wajib, tidak dinilai; jawaban dibagikan setelah kelas:
- L1–L5: lima query filter, masing-masing dengan komentar
- Lima pertanyaan bisnis untuk TheLook

---

## Ringkasan

- Analisis data dimulai dari **pertanyaan bisnis**
- `SELECT` kolom · `FROM` tabel · `WHERE` filter · `ORDER BY` urutan · `LIMIT` jumlah
- Teks `'kutip tunggal'`, tabel `` `backtick` ``, komentar `--`
- Biaya BigQuery dihitung dari data yang dibaca

**Sesi berikutnya:** Kamis, 12 November 2026, 20.00 WIB
Agregasi (`COUNT`, `SUM`, `GROUP BY`) + membuat repo portofolio di GitHub. **Login GitHub sebelum kelas!**
