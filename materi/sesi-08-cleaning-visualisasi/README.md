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
| 20.00–20.05 | Recap sesi 7 |
| 20.05–20.45 | **Bagian A**: membersihkan tabel `orders` |
| 20.45–20.50 | Istirahat singkat |
| 20.50–21.30 | **Bagian B**: prinsip grafik + 3 grafik (tren bulanan, kategori, umur) + menyimpan gambar |
| 21.30–21.40 | **Kerjakan bersama** |
| 21.40–21.50 | **Unggah bersama**: notebook + 3 gambar |
| 21.50–21.57 | Tanya jawab |
| 21.57–22.00 | Penutup |

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
| Sebaran angka | Histogram, boxplot | Grafik 3: umur pelanggan; latihan mandiri: harga produk |

Hindari: diagram pie dengan banyak irisan, grafik 3D, dua sumbu Y dalam satu grafik, dan warna-warni tanpa makna.

**Judul = kesimpulan.** Di notebook, judul grafik disusun dari angka yang dihitung (misalnya persen pertumbuhan), sehingga tetap benar walaupun datanya diperbarui. Tetap baca grafiknya sebelum memakai judul itu.

## Kerjakan bersama (±10 menit)

Instruktur mengerjakannya langkah demi langkah di layar, dan kamu mengetik bersamaan di file kerjamu. Tidak perlu menebak jawabannya sendiri dulu.

1. Grafik batang jumlah pesanan per status.
2. Tren rata-rata lama pengiriman 12 bulan terakhir.

## Unggah bersama (di kelas)

Bersama instruktur, ke repo `thelook-python-analysis`:

- `notebooks/08_cleaning_and_charts.ipynb`
- 3 gambar grafik ke folder `images/` (buat foldernya dengan `images/README.md` kalau belum ada)

## Latihan mandiri (opsional)

Tidak wajib dan tidak dinilai. Untuk yang ingin berlatih lebih, kerjakan bagian **LATIHAN MANDIRI** di file kerja; jawabannya dibagikan instruktur setelah kelas.

1. **Outlier harga** di tabel `products` dengan metode IQR dan boxplot.
2. **Tiga grafik baru**, masing-masing dengan judul berupa kesimpulan dan satu kalimat insight.

## Ringkasan

- Data kosong tidak selalu salah. Pahami dulu kenapa kosong sebelum mengisi atau membuang.
- Dokumentasikan setiap keputusan pembersihan.
- Satu grafik, satu pesan; judul berupa kesimpulan; satu warna sorotan.
- File di Colab hilang saat sesi ditutup. Unduh gambarmu.

**Sesi berikutnya:** Sabtu, 28 November 2026, 14.00 WIB. Statistik deskriptif dan analisis pelanggan (RFM).
