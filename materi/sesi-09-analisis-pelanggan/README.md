# Sesi 9 · Statistik Deskriptif dan Analisis Pelanggan

**Kamis, 26 November 2026 · 20.00–21.40 WIB**

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
| 20.00–20.15 | Recap PR sesi 8 (outlier dan 3 grafik) |
| 20.15–20.30 | **Bagian A**: statistik deskriptif nilai pesanan |
| 20.30–20.40 | **Bagian B**: repeat-purchase rate |
| 20.40–21.05 | **Bagian C**: segmentasi RFM |
| 21.05–21.15 | Giliran kamu |
| 21.15–21.35 | Tanya jawab + cara menulis temuan |
| 21.35–21.40 | Penutup dan PR |

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

## Giliran kamu (±10 menit)

1. Repeat-purchase rate untuk 5 negara dengan pelanggan terbanyak.
2. Perbandingan median `monetary` Champions vs Pelanggan Baru.

## PR (30–60 menit): tiga temuan untuk manajemen

Tulis 3 temuan dari sesi 7–9. Setiap temuan berisi:

1. **Apa**: temuannya, dengan angka.
2. **Kenapa penting**: dampaknya bagi bisnis.
3. **Bukti**: grafik atau tabel di notebook-mu.

Temuan ini menjadi bahan README portofolio di sesi 11. Unggah `notebooks/09_customer_analysis.ipynb` dan `images/04_segmen_rfm.png`.

## Ringkasan

- Untuk data yang miring, median lebih mewakili "pelanggan tipikal" daripada rata-rata.
- `.mean()` pada kolom True/False = proporsi.
- RFM mengubah ribuan pelanggan menjadi beberapa segmen yang bisa ditindaklanjuti.
- Temuan yang baik: apa → kenapa penting → bukti.
- Modul Python selesai. **Install Power BI Desktop atau Tableau Public sebelum sesi 10.**

**Sesi berikutnya:** Senin, 30 November 2026, 20.00 WIB. Dashboard pertama.
