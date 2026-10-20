# Runsheet Sesi 9 · Statistik Deskriptif dan Analisis Pelanggan

**Sabtu, 28 November 2026 · 14.00–15.40 WIB** · Materi: [materi/sesi-09-analisis-pelanggan](../materi/sesi-09-analisis-pelanggan/)

## Persiapan

- [ ] Jalankan notebook dari awal. Catat: repeat-purchase rate, ukuran tiap segmen RFM, porsi pendapatan Champions. Judul grafik C4 dibuat otomatis; cek kalimatnya.
- [ ] Siapkan 1 contoh temuan yang baik dan 1 yang lemah untuk sesi tanya jawab.
- [ ] Setelah kelas: kirim **pengingat instalasi Power BI / Tableau** untuk sesi 10.

## Runsheet

| Waktu | Bagian | Poin utama |
| --- | --- | --- |
| 14.00 | Recap PR sesi 8 | Ringan (1 hari). 2 grafik peserta |
| 14.15 | Bagian A | Mean vs median; histogram miring ke kanan; analogi gaji: kalau satu miliarder masuk ruangan, rata-rata gaji naik, median tidak |
| 14.30 | Bagian B | Repeat-purchase rate; trik `.mean()` pada True/False |
| 14.40 | Bagian C1–C2 | R, F, M; tanggal acuan; `qcut` dan alasan F memakai aturan tetap |
| 14.50 | Bagian C3–C5 | Segmen = tindakan. Grafik porsi pelanggan vs pendapatan; `merge` = JOIN |
| 15.05 | Giliran kamu | G1–G2 |
| 15.15 | Menulis temuan 1 | Contoh temuan baik vs lemah (apa → kenapa penting → bukti). Lalu **5 menit**: semua peserta menulis temuan 1 di notebook (saran: repeat-purchase rate). Minta 2 orang membacakan |
| 15.25 | Tanya jawab | |
| 15.37 | Penutup | PR temuan 2–3; **install tools dashboard** |

## Poin penting

- RFM bukan rumus baku. Aturan skor dan segmen boleh disesuaikan, asal **ditulis**.
- Pada data TheLook, sebagian besar pelanggan hanya berbelanja sekali, sehingga repeat rate rendah. Ini temuan bisnis yang kuat untuk README.
- Temuan yang lemah: "Pendapatan Jeans 1,2 juta USD." Temuan yang baik: "Jeans dan Outerwear menyumbang X% pendapatan; ketergantungan pada dua kategori ini berisiko kalau tren musim berubah."

## Kunci jawaban

Versi lengkap (file kerja yang sudah terisi semua): [`kunci-jawaban/09_customer_analysis.ipynb`](kunci-jawaban/09_customer_analysis.ipynb). Ringkasannya:

```python
# G1. Repeat rate per negara (5 negara terbesar)
pp = pesanan.groupby("user_id").agg(jumlah_pesanan=("order_id", "nunique"),
                                    country=("country", "first"))
pp["berulang"] = pp["jumlah_pesanan"] >= 2
top5 = pp["country"].value_counts().head(5).index
(pp[pp["country"].isin(top5)].groupby("country")["berulang"].mean() * 100).round(1).sort_values(ascending=False)

# G2. Median monetary Champions vs Pelanggan Baru
median_m = rfm.groupby("segmen")["monetary"].median()
print(median_m)
print(f"{median_m['Champions'] / median_m['Pelanggan Baru']:.1f} kali lipat")
```

**PR (contoh temuan)**, sesuaikan angkanya dengan data hari itu:

> **Hanya sebagian kecil pelanggan yang kembali berbelanja.** Repeat-purchase rate X%: sebagian besar pelanggan berbelanja sekali lalu tidak kembali. Pertumbuhan pendapatan bergantung pada akuisisi pelanggan baru yang biayanya lebih mahal. *(Bukti: notebook 09, Bagian B.)*

## Untuk recap sesi 10

- Pilih 2 temuan peserta terbaik untuk dibacakan. Ingatkan bahwa temuan ini masuk README di sesi 11.
