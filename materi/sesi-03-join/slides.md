---
marp: true
theme: default
paginate: true
size: 16:9
footer: "Sesi 3 · JOIN: Menggabungkan Tabel"
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

# Sesi 3 · JOIN: Menggabungkan Tabel

Sabtu, 14 November 2026 · 14.00–15.40 WIB

---

## Agenda

| Waktu | Bagian |
| --- | --- |
| 14.00 | Recap PR sesi 2 (top 10 brand) |
| 14.10 | Key, relasi tabel, jenis JOIN |
| 14.30 | Demo JOIN |
| 15.05 | Giliran kamu |
| 15.15 | Tanya jawab |
| 15.35 | Penutup & PR |

File kerja: `03_joins.sql`

---

## Kenapa data dipisah ke beberapa tabel?

Kalau semua ada di satu tabel, nama & negara pelanggan ditulis ulang **di setiap barang** yang ia beli.

- Boros tempat
- Pelanggan pindah negara → ratusan baris harus diubah

Database memisahkan data per "hal": **pelanggan, pesanan, barang, produk**.
Tabel-tabel itu dihubungkan dengan **key**.

---

## Primary key & foreign key

- **Primary key**: unik di tabelnya sendiri → `users.id`, `products.id`
- **Foreign key**: menunjuk ke primary key tabel lain → `order_items.product_id`

```
users ──< orders ──< order_items >── products
  id   =  user_id
           order_id = order_id
                        product_id = id
```

Analogi: **KTP** (users) dan **struk belanja** (orders) dihubungkan oleh **NIK**.

---

## Jenis JOIN

| JOIN | Hasil | Kapan dipakai |
| --- | --- | --- |
| `JOIN` / `INNER JOIN` | Hanya baris yang **cocok di kedua tabel** | Hampir selalu |
| `LEFT JOIN` | **Semua** baris tabel kiri; kanan = NULL jika tidak cocok | Mencari yang "tidak punya" |

Contoh: 3 pelanggan, 2 punya pesanan
→ `INNER JOIN` = 2 pelanggan · `LEFT JOIN` = 3 pelanggan (1 dengan pesanan NULL)

---

## Bentuk query JOIN

```sql
SELECT
  p.category,
  ROUND(SUM(oi.sale_price), 0) AS pendapatan
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN `bigquery-public-data.thelook_ecommerce.products` AS p
  ON oi.product_id = p.id
WHERE oi.status NOT IN ('Cancelled', 'Returned')
GROUP BY p.category
ORDER BY pendapatan DESC;
```

- `AS oi`, `AS p` = **alias tabel**
- `oi.sale_price` = kolom `sale_price` dari tabel `oi`
- `ON` = pasangan key yang dicocokkan

---

## Demo A–B · JOIN pertama & pendapatan per kategori

1. Setiap barang terjual itu produk apa?
2. **Cek jumlah baris** setelah JOIN = jumlah baris `order_items`? (kebiasaan baik!)
3. Pendapatan per kategori **versi tepat**

> Bandingkan dengan sesi 2. Kenapa angkanya mirip tapi tidak sama?
> Petunjuk: apakah barang Cancelled/Returned ikut terhitung di sesi 2?

---

## Demo C–D · Pelanggan & tiga tabel

**C.** Negara mana yang paling banyak memesan? (`orders` + `users`)

**D.** Pendapatan per gender & kategori (`order_items` + `products` + `users`)

**AOV** (average order value) = pendapatan ÷ jumlah pesanan unik

```sql
ROUND(SUM(oi.sale_price) / COUNT(DISTINCT oi.order_id), 2) AS aov_usd
```

---

## Demo E · LEFT JOIN: yang "tidak punya"

```sql
-- Pelanggan yang belum pernah memesan
SELECT u.id, u.first_name, u.country
FROM `bigquery-public-data.thelook_ecommerce.users` AS u
LEFT JOIN `bigquery-public-data.thelook_ecommerce.orders` AS o
  ON u.id = o.user_id
WHERE o.order_id IS NULL;
```

LEFT JOIN menyimpan **semua** pelanggan. Yang tidak punya pesanan → `o.order_id` = NULL.

---

## Demo F · Jebakan fan-out

Setelah `orders` di-JOIN ke `order_items`, setiap pesanan muncul **sekali per barang**.

| Query | Hasil |
| --- | --- |
| `COUNT(*)` | jumlah **barang** (terlalu besar) |
| `COUNT(DISTINCT o.order_id)` | jumlah **pesanan** (benar) |

**Selalu hitung pesanan dengan `COUNT(DISTINCT order_id)` setelah JOIN.**

---

## Error yang sering muncul

| Error | Penyebab |
| --- | --- |
| `Column name id is ambiguous` | Lupa alias tabel (`oi.id` / `p.id`) |
| Angka sangat besar / query lama | `ON` salah, misalnya `oi.id = p.id` |
| `Unrecognized name: oi` | Alias belum didefinisikan (`AS oi`) |
| Jumlah pesanan terlalu besar | `COUNT(*)` setelah JOIN (fan-out) |

---

<!-- _class: lead -->

# Giliran kamu · 10 menit

**G1.** Pendapatan per **department** untuk setiap **negara** (10 teratas)

**G2.** AOV per negara, khusus pelanggan perempuan (`gender = 'F'`)

---

## PR sesi 3

1. **Pendapatan per kelompok umur & gender**
   Kelompok umur per 10 tahun: `FLOOR(u.age / 10) * 10` (23 → 20, 37 → 30)
   Kolom: kelompok umur, gender, pelanggan unik, pesanan unik, pendapatan
2. **2 kalimat temuan**: kelompok mana yang terbesar? Ada beda antar gender?
3. Unggah `sql/03_joins.sql`

---

## Ringkasan

- Tabel dihubungkan dengan **key**; `ON` menyebut pasangan key-nya
- `JOIN` = yang cocok saja; `LEFT JOIN` = semua baris tabel kiri
- Pakai alias tabel dan tulis `alias.kolom`
- Hitung pesanan dengan `COUNT(DISTINCT order_id)`

**Sesi berikutnya:** Selasa, 17 November 2026, 20.00 WIB
Tanggal, CASE WHEN, CTE, dan pembersihan data dasar
