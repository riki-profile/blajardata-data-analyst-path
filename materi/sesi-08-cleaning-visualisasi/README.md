# Sesi 8 · Pembersihan Data dan Visualisasi

**Kamis, 26 November 2026 · 20.00–22.00 WIB (2 jam)**

Notebook: [`08_cleaning_and_charts.ipynb`](08_cleaning_and_charts.ipynb) · [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/riki-profile/blajardata-data-analyst-path/blob/main/materi/sesi-08-cleaning-visualisasi/08_cleaning_and_charts.ipynb)

## Tujuan sesi

Setelah sesi ini kamu bisa:

1. Menjalankan checklist pembersihan: nilai kosong, duplikat, tipe data, nilai kategori, logika bisnis.
2. Membedakan data kosong yang **bermasalah** dari yang **bermakna**, dan mendokumentasikan keputusan pembersihan.
3. Memilih jenis grafik yang tepat untuk pesan yang ingin disampaikan.
4. Membuat grafik yang rapi dengan matplotlib: judul berupa kesimpulan, satu warna sorotan, label yang jelas.
5. Menyimpan grafik sebagai PNG untuk portofolio.

## Agenda

| Waktu (WIB) | Bagian |
| --- | --- |
| 20.00–20.15 | Recap PR sesi 7 (eksplorasi `users`) |
| 20.15–20.55 | **Bagian A**: membersihkan tabel `orders` |
| 20.55–21.00 | Istirahat singkat |
| 21.00–21.40 | **Bagian B**: prinsip grafik + 3 grafik (tren bulanan, kategori, umur) + menyimpan gambar |
| 21.40–21.50 | Giliran kamu |
| 21.50–21.58 | Tanya jawab |
| 21.58–22.00 | Penutup dan PR |

## Bagian A: checklist pembersihan

| # | Cek | pandas | Keputusan yang mungkin |
| --- | --- | --- | --- |
| 1 | Nilai kosong | `df.isna().sum()` | Biarkan (kalau bermakna), isi (`fillna`), atau buang (`dropna`) |
| 2 | Duplikat | `df.duplicated().sum()` | `drop_duplicates()` |
| 3 | Tipe data | `df.dtypes` | `pd.to_datetime()`, `astype()` |
| 4 | Nilai kategori | `df["x"].value_counts()` | `.str.strip().str.title()`, `replace()` |
| 5 | Logika bisnis | filter dengan kondisi | Selidiki, lalu buang atau tandai |

**Prinsip:** setiap keputusan pembersihan ditulis, beserta alasannya. Tabel "catatan pembersihan" di notebook (bagian A4) bisa langsung dipakai di README portofolio.

## Bagian B: memilih grafik

| Ingin menunjukkan | Grafik | Contoh di notebook |
| --- | --- | --- |
| Perubahan dari waktu ke waktu | Garis | Grafik 1: pendapatan bulanan |
| Membandingkan kategori | Batang horizontal, diurutkan | Grafik 2: porsi pendapatan per kategori |
| Sebaran angka | Histogram, boxplot | Grafik 3: umur pelanggan; PR: harga produk |

Hindari: diagram pie dengan banyak irisan, grafik 3D, dua sumbu Y dalam satu grafik, dan warna-warni tanpa makna.

**Judul = kesimpulan.** Di notebook, judul grafik disusun dari angka yang dihitung (misalnya persen pertumbuhan), sehingga tetap benar walaupun datanya diperbarui. Tetap baca grafiknya sebelum memakai judul itu.

## Giliran kamu (±10 menit)

1. Grafik batang jumlah pesanan per status.
2. Tren rata-rata lama pengiriman 12 bulan terakhir.

## PR (30–60 menit)

1. **Outlier harga** di tabel `products` dengan metode IQR dan boxplot. Tulis keputusanmu: dibuang, dibiarkan, atau dianalisis terpisah?
2. **Tiga grafik baru**, masing-masing dengan judul berupa kesimpulan dan satu kalimat insight.
3. Unggah:
   - `notebooks/08_cleaning_and_charts.ipynb`
   - semua PNG ke folder `images/`

## Ringkasan

- Data kosong tidak selalu salah. Pahami dulu kenapa kosong sebelum mengisi atau membuang.
- Dokumentasikan setiap keputusan pembersihan.
- Satu grafik, satu pesan; judul berupa kesimpulan; satu warna sorotan.
- File di Colab hilang saat sesi ditutup. Unduh gambarmu.

**Sesi berikutnya:** Sabtu, 28 November 2026, 14.00 WIB. Statistik deskriptif dan analisis pelanggan (RFM).
