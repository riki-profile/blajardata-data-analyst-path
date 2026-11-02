# Dashboard Penjualan TheLook (Tableau)

<!--
CARA MEMAKAI TEMPLATE INI
- Ganti semua teks dalam <...> dengan isimu sendiri, lalu hapus komentar ini.
- Diisi bersama di kelas sesi T2. Headline dan rekomendasi sama dengan yang ada di dashboard Insight.
- Tulis dengan kata-katamu sendiri, dan pilih satu bahasa (Indonesia atau Inggris).
-->

**<Nama lengkap>** · <link LinkedIn>

## Ringkasan

<Headline dari dashboard Insight: kesimpulan + angka + periode. Contoh: "Nov 2025–Okt 2026: pendapatan tumbuh X%, didorong Outerwear dan Jeans; margin stabil di Y%.">

**Dashboard interaktif:** <link Tableau Public> (dua tab: **Dashboard** untuk memantau, **Insight** untuk kesimpulan)

![Dashboard](images/dashboard_final.png)

![Insight](images/insight.png)

## Pertanyaan bisnis

Dashboard ini membantu manajemen TheLook memantau:

1. Berapa pendapatan, jumlah pesanan, nilai pesanan rata-rata (AOV), dan margin kita?
2. Bagaimana trennya dari bulan ke bulan?
3. Kategori mana yang menyumbang pendapatan dan margin terbesar?

## Data & model

| | |
| --- | --- |
| Dataset | [`bigquery-public-data.thelook_ecommerce`](https://console.cloud.google.com/marketplace/product/bigquery-public-data/thelook-ecommerce), diekspor ke 3 file CSV |
| Model data | Tabel fakta `penjualan` + tabel dimensi `produk` dan `pelanggan` (relationship Tableau) |
| Calculated field | Pendapatan, Jumlah Pesanan (`COUNTD`), AOV, Margin, Margin % |
| Interaksi | Filter tanggal dan kategori untuk semua sheet |

## Isi dashboard

- Kartu KPI: pendapatan, jumlah pesanan, AOV, margin %
- Tren pendapatan bulanan
- Pendapatan per kategori (dengan margin % di tooltip)
- <grafik tambahanmu>
- Dashboard Insight: headline, 2–3 sheet pendukung, kotak rekomendasi

## Temuan & rekomendasi

1. <Temuan dari dashboard, dengan angka>
2. <Temuan>

**Rekomendasi:** <satu tindakan konkret>

---

*Dibuat sebagai bagian dari kursus Data Analysis dengan BigQuery, Python & BI (modul Tableau).*
