# Analisis Pelanggan TheLook dengan Python (pandas)

<!--
CARA MEMAKAI TEMPLATE INI
- Ganti semua teks dalam <...> dengan isimu sendiri, lalu hapus komentar ini.
- Temuan dan rekomendasi ditulis bersama di kelas sesi 9.
- Bagian "Studi kasus" hanya untuk peserta jalur penuh (sesi 12); hapus kalau tidak ikut.
- Tulis dengan kata-katamu sendiri, dan pilih satu bahasa (Indonesia atau Inggris).
-->

**<Nama lengkap>** · <link LinkedIn>

## Ringkasan

<2–3 kalimat. Contoh: "Saya membersihkan dan menganalisis data pesanan toko pakaian online TheLook dengan Python. Hanya X% pelanggan yang berbelanja lebih dari sekali, sementara segmen Champions (Y% pelanggan) menyumbang Z% pendapatan.">

![Pendapatan bulanan](images/01_pendapatan_bulanan.png)

## Pertanyaan bisnis

1. Bagaimana tren pendapatan TheLook, dan kategori apa yang menopangnya?
2. Siapa pelanggan terbaik kita, dan apakah mereka kembali berbelanja?

## Data & metode

| | |
| --- | --- |
| Dataset | [`bigquery-public-data.thelook_ecommerce`](https://console.cloud.google.com/marketplace/product/bigquery-public-data/thelook-ecommerce), dimuat dari BigQuery ke Google Colab |
| Periode | <misalnya Januari 2019 – Oktober 2026, tanpa bulan berjalan> |
| Tools | Python, pandas, matplotlib di Google Colab |
| Metode | Pembersihan data, visualisasi, statistik deskriptif, repeat-purchase rate, segmentasi RFM |

**Catatan pembersihan:** <ringkas dari tabel catatan pembersihan di notebook 08, misalnya "tanggal kirim yang kosong untuk pesanan Processing/Cancelled dibiarkan karena memang belum terjadi">

## Temuan

### 1. <Judul berupa kesimpulan>

<Apa, dengan angka → kenapa penting.>

![<deskripsi grafik>](images/04_segmen_rfm.png)

### 2. <Judul temuan>

<...>

### 3. <Judul temuan>

<...>

## Rekomendasi

<Satu tindakan konkret, dan cara mengukur keberhasilannya.>

## Studi kasus: kategori mana yang sebaiknya diprioritaskan? *(jalur penuh, sesi 12)*

- **Pertanyaan:** Dengan anggaran promosi terbatas, kategori produk mana yang sebaiknya diprioritaskan untuk kuartal depan?
- **Fokus:** <Women/Men, dan negara jika ada>
- **Metode:** porsi pendapatan, pertumbuhan 12 bulan, margin %, dan tingkat retur per kategori → matriks prioritas
- **Jawaban:** <2–3 kalimat dengan angka>
- **Rekomendasi:** <...>
- **File:** [`my_question/`](my_question/)

![Matriks prioritas kategori](images/12_matriks_prioritas_<women atau men>.png)

## Keterbatasan

- Data TheLook bersifat sintetis.
- <keterbatasan lain>

## Isi repository

| File | Isi |
| --- | --- |
| [`notebooks/05_python_basics.ipynb`](notebooks/05_python_basics.ipynb) | Dasar Python dengan data pesanan |
| [`notebooks/06_functions.ipynb`](notebooks/06_functions.ipynb) | Function untuk label ukuran pesanan |
| [`notebooks/07_pandas_exploration.ipynb`](notebooks/07_pandas_exploration.ipynb) | Eksplorasi data dengan pandas |
| [`notebooks/08_cleaning_and_charts.ipynb`](notebooks/08_cleaning_and_charts.ipynb) | Pembersihan data dan visualisasi |
| [`notebooks/09_customer_analysis.ipynb`](notebooks/09_customer_analysis.ipynb) | Repeat-purchase rate dan segmentasi RFM |
| [`my_question/`](my_question/) | *(jalur penuh)* Studi kasus prioritas kategori |

---

*Dibuat sebagai bagian dari kursus Data Analysis dengan BigQuery, Python & BI.*
