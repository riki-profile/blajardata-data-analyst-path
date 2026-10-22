# Dashboard Penjualan TheLook (Power BI)

<!--
CARA MEMAKAI TEMPLATE INI
- Ganti semua teks dalam <...> dengan isimu sendiri, lalu hapus komentar ini.
- Diisi bersama di kelas sesi 11. Headline dan rekomendasi sama dengan yang ada di dashboard-mu.
- Tulis dengan kata-katamu sendiri, dan pilih satu bahasa (Indonesia atau Inggris).
-->

**<Nama lengkap>** · <link LinkedIn>

## Ringkasan

<Headline dashboard-mu, satu kalimat dengan angka. Contoh: "Pendapatan tumbuh X%, didorong Outerwear dan Jeans; margin stabil di Y%.">

![Dashboard TheLook](images/dashboard_final.png)

**File:** [PDF dashboard](dashboard/thelook_dashboard.pdf) · [file Power BI (.pbix)](dashboard/thelook_dashboard.pbix)

## Pertanyaan bisnis

Dashboard ini membantu manajemen TheLook memantau setiap minggu:

1. Berapa pendapatan, jumlah pesanan, nilai pesanan rata-rata (AOV), dan margin kita?
2. Bagaimana trennya dari bulan ke bulan?
3. Kategori mana yang menyumbang pendapatan dan margin terbesar?

## Data & model

| | |
| --- | --- |
| Dataset | [`bigquery-public-data.thelook_ecommerce`](https://console.cloud.google.com/marketplace/product/bigquery-public-data/thelook-ecommerce), diekspor ke 3 file CSV |
| Model data | Tabel fakta `penjualan` + tabel dimensi `produk` dan `pelanggan` (relasi many-to-one) |
| Measure (DAX) | Pendapatan, Jumlah Pesanan (`DISTINCTCOUNT`), AOV, Margin, Margin % |
| Interaksi | Filter tanggal dan kategori untuk semua visual |

## Isi dashboard

- Kartu KPI: pendapatan, jumlah pesanan, AOV, margin %
- Tren pendapatan bulanan
- Pendapatan per kategori (dengan margin % di tooltip)
- <grafik tambahanmu>
- Kotak rekomendasi

## Temuan & rekomendasi

1. <Temuan dari dashboard, dengan angka>
2. <Temuan>

**Rekomendasi:** <satu tindakan konkret>

---

*Dibuat sebagai bagian dari kursus Data Analysis dengan BigQuery, Python & BI.*
