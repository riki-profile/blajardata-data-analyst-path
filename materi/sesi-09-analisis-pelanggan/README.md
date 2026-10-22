# Sesi 9 · Statistik Deskriptif dan Analisis Pelanggan

**Sabtu, 28 November 2026 · 14.00–15.40 WIB**

Notebook: [`09_customer_analysis.ipynb`](09_customer_analysis.ipynb) · [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/riki-profile/blajardata-data-analyst-path/blob/main/materi/sesi-09-analisis-pelanggan/09_customer_analysis.ipynb)

## Tujuan sesi

Setelah sesi ini kamu bisa:

1. Memakai rata-rata, median, persentil, dan simpangan baku, dan tahu kapan median lebih jujur daripada rata-rata.
2. Menghitung **repeat-purchase rate**.
3. Membuat **segmentasi RFM** (Recency, Frequency, Monetary) dan menerjemahkannya menjadi tindakan bisnis.
4. Menulis temuan untuk manajemen dalam format apa → kenapa penting → bukti.

## Agenda

| Waktu (WIB) | Bagian |
| --- | --- |
| 14.00–14.05 | Recap sesi 8 |
| 14.05–14.20 | **Bagian A**: statistik deskriptif nilai pesanan |
| 14.20–14.30 | **Bagian B**: repeat-purchase rate |
| 14.30–14.50 | **Bagian C**: segmentasi RFM |
| 14.50–15.00 | **Kerjakan bersama** |
| 15.00–15.15 | **Tiga temuan + rekomendasi**, ditulis bersama |
| 15.15–15.30 | **Unggah bersama**: README `thelook-python-analysis` + notebook + grafik |
| 15.30–15.37 | Tanya jawab |
| 15.37–15.40 | Penutup |

## Konsep kunci

**Rata-rata vs median.** Data penjualan biasanya *miring ke kanan*: banyak pesanan kecil, sedikit pesanan sangat besar. Rata-rata tertarik ke atas oleh pesanan besar itu, sedangkan median tidak. Laporkan median sebagai "nilai tipikal".

**Repeat-purchase rate** = pelanggan dengan ≥ 2 pesanan ÷ semua pelanggan yang pernah berbelanja.

**RFM**

| | Pertanyaan | Skor |
| --- | --- | --- |
| Recency | Kapan terakhir belanja? | 1–4 (kuartil; makin baru makin tinggi) |
| Frequency | Berapa kali belanja? | 1, 2, 3+ |
| Monetary | Berapa total belanjanya? | 1–4 (kuartil) |

| Segmen | Aturan | Tindakan |
| --- | --- | --- |
| Champions | R ≥ 3, F ≥ 2 | Program loyalitas |
| Pelanggan Baru | R ≥ 3, F = 1 | Dorong pembelian kedua |
| Berisiko Pergi | R ≤ 2, F ≥ 2 | Kampanye *win-back* |
| Tidak Aktif | R ≤ 2, F = 1 | Email otomatis berbiaya rendah |

Aturan segmen ini sengaja dibuat sederhana. Di perusahaan, aturannya disesuaikan dengan kebutuhan bisnis, dan itu sah, asal ditulis dengan jelas.

## Kerjakan bersama (±10 menit)

Instruktur mengerjakannya langkah demi langkah di layar, dan kamu mengetik bersamaan di notebook-mu.

1. Repeat-purchase rate untuk 5 negara dengan pelanggan terbanyak.
2. Perbandingan median `monetary` Champions vs Pelanggan Baru.

## Tiga temuan untuk manajemen (bersama di kelas)

Kita menulis **tiga temuan dan satu rekomendasi** bersama-sama dari hasil sesi 7–9. Instruktur menunjukkan angkanya dan mengajukan pertanyaan pemandu; kamu menuliskannya dengan kata-katamu sendiri di bagian akhir notebook. Setiap temuan berisi:

1. **Apa**: temuannya, dengan angka.
2. **Kenapa penting**: dampaknya bagi bisnis.
3. **Bukti**: grafik atau tabel di notebook-mu.

Saran urutan: (1) repeat-purchase rate, (2) porsi pendapatan segmen Champions, (3) median vs rata-rata nilai pesanan.

## Unggah bersama (di kelas)

Bersama instruktur, di repo `thelook-python-analysis`:

1. `README.md` → tempel [template README Python](../../template-portofolio/thelook-python-analysis/README.md) → isi Ringkasan, 3 temuan, dan rekomendasi → **Commit changes**.
2. Unggah `notebooks/09_customer_analysis.ipynb` dan `images/04_segmen_rfm.png`.

Di akhir sesi, **portofolio modul Python-mu selesai**.

## Latihan mandiri (opsional)

Tidak wajib dan tidak dinilai: tambahkan analisis pendukung di sel terakhir notebook, misalnya repeat-purchase rate per `traffic_source` atau per kelompok umur.

## Ringkasan

- Untuk data yang miring, median lebih mewakili "pelanggan tipikal" daripada rata-rata.
- `.mean()` pada kolom True/False = proporsi.
- RFM mengubah ribuan pelanggan menjadi beberapa segmen yang bisa ditindaklanjuti.
- Temuan yang baik: apa → kenapa penting → bukti.
- **Modul Python selesai.** Repo `thelook-python-analysis` dengan README-nya adalah portofolio modul ini.
- Jalur penuh: **install Power BI Desktop sebelum sesi 10** (pengguna Mac: [panduan Parallels](../../PANDUAN_MAC_PARALLELS.md), mulai Minggu 29 November).

**Sesi berikutnya:** Selasa, 1 Desember 2026, 20.00 WIB. Dashboard pertama.
