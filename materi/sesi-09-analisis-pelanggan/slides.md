---
marp: true
theme: default
paginate: true
size: 16:9
footer: "Sesi 9 · Statistik Deskriptif & Analisis Pelanggan"
style: |
  section {
    font-family: 'Segoe UI', 'Helvetica Neue', Arial, sans-serif;
    font-size: 30px;
    color: #202124;
    background: #ffffff;
    padding: 48px 64px;
    justify-content: flex-start;
  }
  h1 { color: #2a78d6; font-size: 46px; margin-bottom: 12px; }
  h2 { color: #2a78d6; font-size: 38px; margin-bottom: 12px; }
  h3 { color: #5f6368; font-size: 30px; }
  strong { color: #c4501f; }
  a { color: #2a78d6; }
  table { font-size: 24px; border-collapse: collapse; }
  th { background: #e8f0fb; color: #1a4f91; }
  th, td { padding: 6px 12px; border: 1px solid #dadce0; }
  code { background: #f1f3f4; color: #202124; border-radius: 4px; padding: 0 4px; }
  pre { font-size: 21px; line-height: 1.35; border-radius: 6px; }
  pre code { background: transparent; padding: 0; }
  blockquote { border-left: 6px solid #eb6834; color: #3c4043; background: #fdf1ec; padding: 10px 18px; }
  footer { color: #9aa0a6; font-size: 14px; }
  section::after { color: #9aa0a6; font-size: 14px; }
  section.lead { background: #2a78d6; color: #ffffff; justify-content: center; }
  section.lead h1, section.lead h2, section.lead h3, section.lead strong { color: #ffffff; }
  section.lead footer, section.lead::after { color: #d2e3fc; }
  section.lead code { background: rgba(255,255,255,0.2); color: #ffffff; }
  section.section { background: #f8f9fa; justify-content: center; }
  section.section h1 { font-size: 52px; }
  section.small { font-size: 25px; }
  section.small table { font-size: 20px; }
  section.small pre { font-size: 18px; }
---

<!-- _class: lead -->
<!-- _paginate: false -->

# Sesi 9 · Statistik Deskriptif & Analisis Pelanggan

Sabtu, 28 November 2026 · 14.00–15.40 WIB

---

## Agenda

| Waktu | Bagian |
| --- | --- |
| 14.00 | Recap PR sesi 8 |
| 14.15 | **A**: statistik deskriptif |
| 14.30 | **B**: repeat-purchase rate |
| 14.40 | **C**: segmentasi RFM |
| 15.05 | Giliran kamu |
| 15.15 | Cara menulis temuan + **tulis temuan pertamamu** |
| 15.25 | README `thelook-python-analysis` |
| 15.32 | Tanya jawab |
| 15.37 | Penutup & PR |

Notebook: `09_customer_analysis.ipynb`

---

## Pertanyaan manajemen hari ini

> **"Siapa pelanggan terbaik kita, dan apakah mereka kembali berbelanja?"**

Data: **satu baris per pesanan** (barang dijumlahkan per pesanan di SQL)

---

<!-- _class: section -->

# A · Statistik deskriptif

---

## Ukuran yang paling sering dipakai

| Ukuran | Arti | pandas |
| --- | --- | --- |
| Rata-rata (*mean*) | Jumlah ÷ banyaknya data | `.mean()` |
| Median | Nilai tengah setelah diurutkan | `.median()` |
| Simpangan baku | Seberapa menyebar | `.std()` |
| Persentil | Posisi tertentu (misalnya 90%) | `.quantile(0.9)` |

---

## Kenapa rata-rata bisa menipu

Data penjualan biasanya **miring ke kanan**: banyak pesanan kecil, sedikit pesanan sangat besar.

- Rata-rata **tertarik ke atas** oleh pesanan besar
- Median **tidak terpengaruh**

> Analogi: kalau satu miliarder masuk ruangan, rata-rata gaji di ruangan naik drastis. Median hampir tidak berubah.

**Laporkan median sebagai "nilai tipikal".**

---

<!-- _class: section -->

# B · Repeat-purchase rate

---

## Repeat-purchase rate

**= pelanggan dengan ≥ 2 pesanan ÷ semua pelanggan yang pernah belanja**

```python
pesanan_per_pelanggan = pesanan.groupby("user_id")["order_id"].nunique()
repeat_rate = (pesanan_per_pelanggan >= 2).mean() * 100
```

Trik: `.mean()` pada kolom True/False = **proporsi True**

Kenapa penting? Mendatangkan pelanggan baru biasanya **jauh lebih mahal** daripada membuat pelanggan lama kembali.

---

<!-- _class: section -->

# C · Segmentasi RFM

---

## R, F, M

| Huruf | Pertanyaan | Skor |
| --- | --- | --- |
| **R**ecency | Kapan terakhir belanja? | 1–4 (kuartil; makin baru makin tinggi) |
| **F**requency | Berapa kali belanja? | 1, 2, 3+ |
| **M**onetary | Berapa total belanjanya? | 1–4 (kuartil) |

```python
peringkat = rfm["recency"].rank(method="first")   # peringkat unik
rfm["skor_r"] = pd.qcut(peringkat, 4, labels=[4, 3, 2, 1]).astype(int)
rfm["skor_f"] = rfm["frequency"].clip(upper=3)
```

F memakai aturan tetap karena kebanyakan pelanggan hanya belanja sekali.

---

## Dari skor menjadi tindakan

| Segmen | Aturan | Tindakan |
| --- | --- | --- |
| **Champions** | R ≥ 3, F ≥ 2 | Program loyalitas |
| **Pelanggan Baru** | R ≥ 3, F = 1 | Dorong pembelian kedua |
| **Berisiko Pergi** | R ≤ 2, F ≥ 2 | Kampanye *win-back* |
| **Tidak Aktif** | R ≤ 2, F = 1 | Email otomatis saja |

Aturan ini bukan rumus baku. Boleh disesuaikan, **asal ditulis jelas**.

Grafik: **% pelanggan vs % pendapatan** per segmen. Segmen kecil, pendapatan besar?

---

<!-- _class: lead -->

# Giliran kamu · 10 menit

**G1.** Repeat-purchase rate untuk 5 negara terbesar

**G2.** Median `monetary` Champions vs Pelanggan Baru: berapa kali lipat?

---

## Menulis temuan untuk manajemen

**Apa** (dengan angka) → **kenapa penting** → **bukti**

| Lemah | Kuat |
| --- | --- |
| "Pendapatan Jeans 1,2 juta USD." | "Hanya X% pelanggan berbelanja lebih dari sekali. Pertumbuhan bergantung pada pelanggan baru yang biaya akuisisinya mahal. *(Bukti: Bagian B)*" |

**5 menit: tulis temuan 1 di notebook sekarang.**

---

## PR sesi 9

- Temuan 1 sudah ditulis di kelas
- Tulis **temuan 2 dan 3** dari sesi 7–9 + **1 rekomendasi**
- Lengkapi **README `thelook-python-analysis`** (template README Python)

Unggah `notebooks/09_customer_analysis.ipynb` + `images/04_segmen_rfm.png`

Jalur penuh: **install Power BI Desktop sebelum sesi 10** (Mac: panduan Parallels, mulai Minggu 29 Nov)

---

## Ringkasan

- Data miring → median lebih mewakili "tipikal" daripada rata-rata
- `.mean()` pada True/False = proporsi
- RFM: ribuan pelanggan → beberapa segmen yang bisa ditindaklanjuti
- Temuan: apa → kenapa penting → bukti
- **Modul Python selesai!** Repo `thelook-python-analysis` = portofolio modul ini

**Sesi berikutnya:** Selasa, 1 Desember 2026, 20.00 WIB · Dashboard pertama
