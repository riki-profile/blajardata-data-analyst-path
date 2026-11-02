# Analisis Kondisi Bisnis TheLook dengan SQL (BigQuery)

<!--
CARA MEMAKAI TEMPLATE INI
- Ganti semua teks dalam <...> dengan isimu sendiri, lalu hapus komentar ini.
- Temuan diambil dari Proyek SQL yang dikerjakan bersama di sesi 4 (query P1, P2, P3).
- Tulis dengan kata-katamu sendiri, dan pilih satu bahasa (Indonesia atau Inggris).
-->

**<Nama lengkap>** · <link LinkedIn>

## Ringkasan

<2–3 kalimat. Contoh: "Saya menganalisis data penjualan toko pakaian online TheLook dengan SQL di BigQuery. Pendapatan 12 bulan terakhir naik X%, tetapi Y% pelanggan hanya berbelanja sekali. Saya merekomendasikan program untuk mendorong pembelian kedua.">

## Pertanyaan bisnis

Manajemen TheLook ingin mengetahui:

1. **Bagaimana kondisi bisnis kita?** Pendapatan, jumlah pesanan, dan nilai pesanan rata-rata.
2. **Di mana uang kita dihasilkan?** Kategori mana yang menyumbang pendapatan dan margin terbesar.
3. **Apakah pelanggan kembali berbelanja?**

## Data & metode

| | |
| --- | --- |
| Dataset | [`bigquery-public-data.thelook_ecommerce`](https://console.cloud.google.com/marketplace/product/bigquery-public-data/thelook-ecommerce): data e-commerce sintetis dari Google |
| Periode | <misalnya 12 bulan terakhir yang lengkap, dibandingkan dengan 12 bulan sebelumnya> |
| Definisi pendapatan | Total `sale_price` dari barang yang tidak dibatalkan atau dikembalikan |
| Tools | SQL di Google BigQuery: agregasi, JOIN, CASE WHEN, CTE, fungsi tanggal |

## Temuan

### 1. <Judul berupa kesimpulan, misalnya "Pendapatan naik X%, didorong jumlah pesanan">

<Apa yang kamu temukan, dengan angka, dan kenapa penting. Dari query P1.>

### 2. <Judul temuan>

<Dari query P2.>

### 3. <Judul temuan>

<Dari query P3.>

> Tip: tambahkan screenshot tabel hasil query (atau grafik dari tab **Chart** BigQuery) ke folder `images/`, lalu tampilkan dengan `![deskripsi](images/nama_file.png)`.

## Rekomendasi

<Satu tindakan konkret untuk manajemen, dan cara mengukur keberhasilannya.>

## Keterbatasan

- Data TheLook bersifat sintetis, sehingga pola tertentu mungkin tidak mencerminkan perilaku pelanggan sungguhan.
- <keterbatasan lain>

## Isi repository

| File | Isi |
| --- | --- |
| [`sql/01_basics.sql`](sql/01_basics.sql) | Eksplorasi tabel, filter, dan pengurutan |
| [`sql/02_aggregation.sql`](sql/02_aggregation.sql) | Agregasi: pendapatan per kategori, pelanggan per negara, top 10 brand |
| [`sql/03_joins.sql`](sql/03_joins.sql) | JOIN: pendapatan per kategori, negara, umur, dan gender |
| [`sql/04_dates_case_cte.sql`](sql/04_dates_case_cte.sql) | Tren bulanan, CASE WHEN, CTE, dan **Proyek SQL** (P1–P3) |

---

*Dibuat sebagai bagian dari kursus Data Analysis dengan BigQuery, Python & BI.*
