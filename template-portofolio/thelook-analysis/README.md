# Analisis Penjualan & Pelanggan TheLook E-commerce

<!--
CARA MEMAKAI TEMPLATE INI
- Ganti semua teks dalam <...> dengan isimu sendiri, lalu hapus komentar ini.
- Tulis dengan kata-katamu sendiri. Temuan dan rekomendasimu itulah yang membuat portofolio ini milikmu.
- Pilih satu bahasa (Indonesia atau Inggris) dan konsisten.
-->

**<Nama lengkap>** · <link LinkedIn> · <email (opsional)>

## Ringkasan

<2–3 kalimat: konteks, pertanyaan, hasil utama. Contoh: "Saya menganalisis lebih dari 100 ribu transaksi toko pakaian online TheLook untuk memahami kinerja penjualan dan perilaku pelanggan. Pendapatan tumbuh X% dalam setahun terakhir, tetapi hanya Y% pelanggan yang berbelanja lebih dari sekali. Saya merekomendasikan program untuk mendorong pembelian kedua.">

![Dashboard TheLook](images/dashboard_final.png)

**Dashboard interaktif:** <link Tableau Public, atau link ke dashboard/thelook_dashboard.pdf>

## Pertanyaan bisnis

Manajemen TheLook ingin mengetahui:

1. Bagaimana kinerja bisnis: pendapatan, jumlah pesanan, dan tren?
2. Siapa pelanggan kita, dan apakah mereka kembali berbelanja?
3. Di mana peluang untuk tumbuh?

## Data & metode

| | |
| --- | --- |
| Dataset | [`bigquery-public-data.thelook_ecommerce`](https://console.cloud.google.com/marketplace/product/bigquery-public-data/thelook-ecommerce): data e-commerce sintetis dari Google |
| Periode | <misalnya Januari 2019 – Oktober 2026> |
| Definisi pendapatan | Total `sale_price` dari barang yang tidak dibatalkan atau dikembalikan |
| Tools | SQL (BigQuery), Python (pandas, matplotlib) di Google Colab, <Tableau Public / Power BI> |

Langkah analisis:

1. **SQL** untuk eksplorasi, agregasi, dan menggabungkan tabel pesanan, produk, dan pelanggan → [`sql/`](sql/)
2. **Python** untuk pembersihan data, visualisasi, statistik deskriptif, dan segmentasi pelanggan (RFM) → [`notebooks/`](notebooks/)
3. **Dashboard** untuk memantau KPI dengan filter tanggal dan kategori → [`dashboard/`](dashboard/)

## Temuan

### 1. <Judul temuan berupa kesimpulan>

<Apa yang kamu temukan, dengan angka. Kenapa penting bagi bisnis.>

![<deskripsi grafik>](images/01_pendapatan_bulanan.png)

### 2. <Judul temuan>

<...>

![<deskripsi grafik>](images/02_porsi_kategori.png)

### 3. <Judul temuan>

<...>

![<deskripsi grafik>](images/04_segmen_rfm.png)

## Rekomendasi

<Satu rekomendasi yang konkret: apa yang sebaiknya dilakukan, untuk siapa, dan bagaimana mengukur keberhasilannya. Contoh: "Kirim voucher pembelian kedua kepada segmen Pelanggan Baru dalam 30 hari setelah pembelian pertama. Ukur keberhasilannya dari kenaikan repeat-purchase rate dari X% ke Y%.">

## Studi kasus: kategori mana yang sebaiknya diprioritaskan?

- **Pertanyaan:** Dengan anggaran promosi terbatas, kategori produk mana yang sebaiknya diprioritaskan untuk kuartal depan?
- **Fokus:** <Women/Men, dan negara jika ada>
- **Metode:** membandingkan porsi pendapatan, pertumbuhan 12 bulan, margin %, dan tingkat retur setiap kategori, lalu mengelompokkannya ke matriks prioritas (Andalan, Mesin Uang, Bintang Baru, Perlu Ditinjau)
- **Jawaban:** <2–3 kalimat dengan angka, dengan kata-katamu sendiri>
- **Rekomendasi:** <...>
- **File:** [`my_question/`](my_question/)

![Matriks prioritas kategori](images/12_matriks_prioritas_<women atau men>.png)

## Keterbatasan

- Data TheLook bersifat sintetis (dibuat oleh program), sehingga pola tertentu mungkin tidak mencerminkan perilaku pelanggan sungguhan.
- <keterbatasan lain, misalnya tidak ada data biaya pemasaran>

## Isi repository

```
thelook-analysis/
├── README.md
├── sql/            ← query BigQuery (sesi 1–4)
├── notebooks/      ← notebook Colab (sesi 5–9)
├── dashboard/      ← dashboard Tableau/Power BI
├── my_question/    ← studi kasus
└── images/         ← grafik dan screenshot dashboard
```

| File | Isi |
| --- | --- |
| [`sql/01_basics.sql`](sql/01_basics.sql) | Eksplorasi tabel, filter dan pengurutan |
| [`sql/02_aggregation.sql`](sql/02_aggregation.sql) | Agregasi: pendapatan per kategori, pelanggan per negara, top 10 brand |
| [`sql/03_joins.sql`](sql/03_joins.sql) | JOIN: pendapatan per kategori, negara, umur, dan gender |
| [`sql/04_dates_case_cte.sql`](sql/04_dates_case_cte.sql) | Tren bulanan, kelompok umur, CTE, tabel analisis |
| [`notebooks/05_python_basics.ipynb`](notebooks/05_python_basics.ipynb) | Dasar Python dengan data pesanan |
| [`notebooks/06_functions.ipynb`](notebooks/06_functions.ipynb) | Function untuk label ukuran pesanan |
| [`notebooks/07_pandas_exploration.ipynb`](notebooks/07_pandas_exploration.ipynb) | Eksplorasi data dengan pandas |
| [`notebooks/08_cleaning_and_charts.ipynb`](notebooks/08_cleaning_and_charts.ipynb) | Pembersihan data dan visualisasi |
| [`notebooks/09_customer_analysis.ipynb`](notebooks/09_customer_analysis.ipynb) | Repeat-purchase rate dan segmentasi RFM |

---

*Proyek ini dibuat sebagai bagian dari kursus Data Analysis dengan BigQuery, Python & BI.*
