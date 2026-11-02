# Dashboard Penjualan TheLook (Power BI)

<!--
CARA MEMAKAI TEMPLATE INI
- Ganti semua teks dalam <...> dengan isimu sendiri, lalu hapus komentar ini.
- Diisi bersama di kelas sesi 11. Headline dan rekomendasi sama dengan yang ada di halaman Insight.
- Tulis dengan kata-katamu sendiri, dan pilih satu bahasa (Indonesia atau Inggris).
-->

**<Nama lengkap>** · <link LinkedIn>

## Ringkasan

<Headline dari halaman Insight: kesimpulan + angka + periode. Contoh: "Nov 2025–Okt 2026: pendapatan tumbuh X%, didorong Outerwear dan Jeans; margin stabil di Y%.">

File Power BI ini punya dua halaman:

| Halaman | Isi |
| --- | --- |
| **Dashboard** | Untuk memantau: KPI, tren, kategori, filter tanggal dan kategori |
| **Insight** | Kesimpulan untuk manajemen: headline, 2–3 visual pendukung, rekomendasi (periode terkunci) |

![Halaman Dashboard](images/dashboard_final.png)

![Halaman Insight](images/insight.png)

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
| Interaksi | Halaman Dashboard: filter tanggal dan kategori untuk semua visual. Halaman Insight: periode dikunci |

## Isi dashboard

**Halaman Dashboard**
- Kartu KPI: pendapatan, jumlah pesanan, AOV, margin %
- Tren pendapatan bulanan
- Pendapatan per kategori (dengan margin % di tooltip)
- Pendapatan per negara
- <grafik tambahanmu>

**Halaman Insight**
- Headline: <kesimpulanmu>
- <2–3 visual pendukung>
- Kotak rekomendasi

## Temuan & rekomendasi

1. <Temuan dari dashboard, dengan angka dan periodenya>
2. <Temuan>

**Rekomendasi:** <satu tindakan konkret>

---

*Dibuat sebagai bagian dari kursus Data Analysis dengan BigQuery, Python & BI.*
