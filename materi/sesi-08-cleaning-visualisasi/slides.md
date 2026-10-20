---
marp: true
theme: default
paginate: true
size: 16:9
footer: "Sesi 8 · Pembersihan Data & Visualisasi"
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

# Sesi 8 · Pembersihan Data & Visualisasi

Kamis, 26 November 2026 · 20.00–22.00 WIB (2 jam)

---

## Agenda

| Waktu | Bagian |
| --- | --- |
| 20.00 | Recap PR sesi 7 |
| 20.15 | **Bagian A**: membersihkan tabel `orders` |
| 20.55 | Istirahat 5 menit |
| 21.00 | **Bagian B**: prinsip grafik + 3 grafik + menyimpan gambar |
| 21.40 | Giliran kamu |
| 21.50 | Tanya jawab |
| 21.58 | Penutup & PR |

Notebook: `08_cleaning_and_charts.ipynb`

---

<!-- _class: section -->

# Bagian A · Pembersihan data

---

## Checklist pembersihan

| # | Cek | pandas |
| --- | --- | --- |
| 1 | Nilai kosong | `df.isna().sum()` |
| 2 | Duplikat | `df.duplicated().sum()` |
| 3 | Tipe data | `df.dtypes` |
| 4 | Nilai kategori aneh | `df["kolom"].value_counts()` |
| 5 | Logika bisnis | diterima sebelum dikirim? jumlah barang < 1? |

Lalu **tulis keputusanmu**: apa yang diubah, apa yang dibiarkan, dan kenapa.

---

## Kosong ≠ selalu salah

| status | `shipped_at` kosong | `delivered_at` kosong |
| --- | --- | --- |
| Processing | 100% | 100% |
| Cancelled | 100% | 100% |
| Shipped | 0% | 100% |
| Complete | 0% | 0% |

Pesanan yang belum/tidak dikirim **memang** belum punya tanggal kirim.
→ *Missing yang bermakna*: **jangan diisi, jangan dibuang.**

Mengisi tanggal palsu justru membuat data salah.

---

## Kolom baru & bulan berjalan

```python
orders["order_month"] = orders["created_at"].dt.to_period("M").dt.to_timestamp()
orders["hari_sampai"] = (orders["delivered_at"] - orders["created_at"]).dt.days

awal_bulan_ini = pd.Timestamp.today().normalize().replace(day=1)
orders_bersih = orders[orders["created_at"] < awal_bulan_ini].copy()
```

## Catatan pembersihan

| Temuan | Keputusan | Alasan |
| --- | --- | --- |
| `shipped_at` kosong (Processing/Cancelled) | Dibiarkan | Memang belum terjadi |
| Bulan berjalan belum lengkap | Dibuang | Tren tidak menyesatkan |

---

<!-- _class: section -->

# Bagian B · Visualisasi

---

## Prinsip grafik yang baik

1. **Satu grafik, satu pesan.** Tentukan pesannya dulu
2. **Judul = kesimpulan**: "Jeans menyumbang 12% pendapatan", bukan "Pendapatan per kategori"
3. **Bentuk sesuai tugas** (tabel berikutnya)
4. **Kurangi hiasan**: tanpa 3D, tanpa pelangi. Satu warna + satu warna sorotan
5. **Label** sumbu dan satuan (USD, %, orang)
6. **Satu sumbu Y saja**; dua ukuran berbeda → dua grafik

---

## Memilih bentuk grafik

| Ingin menunjukkan | Grafik | Di notebook |
| --- | --- | --- |
| Perubahan dari waktu ke waktu | Garis | Pendapatan bulanan |
| Membandingkan kategori | Batang horizontal, **diurutkan** | Porsi per kategori |
| Sebaran angka | Histogram, boxplot | Umur pelanggan |
| Hubungan dua angka | Scatter | (sesi 12) |

Hindari: pie dengan banyak irisan, 3D, dua sumbu Y.

---

## Grafik 1 · Tren pendapatan bulanan

- 24 bulan terakhir
- Judul dihitung dari data: *"Pendapatan 12 bulan terakhir naik X% dibanding tahun sebelumnya"*
- Sumbu Y **mulai dari 0**: perubahan tidak dilebih-lebihkan
- Titik & label angka di bulan terakhir
- Sumber data di bawah grafik

```python
plt.savefig("images/01_pendapatan_bulanan.png", dpi=150, bbox_inches="tight")
```

---

## Grafik 2 & 3

**Grafik 2 · Porsi pendapatan per kategori**
- Batang **horizontal** (nama kategori panjang)
- **Diurutkan** dari terbesar
- Kategori teratas disorot **oranye**, sisanya biru

**Grafik 3 · Sebaran umur pelanggan**
- Histogram, wadah (bin) per 5 tahun
- Garis median

> Judul otomatis tetap harus **dibaca dan dicek**: apakah sesuai dengan grafiknya?

---

## Menyimpan untuk portofolio

File di Colab **hilang** saat sesi ditutup → unduh sekarang!

```python
from google.colab import files
for nama_file in sorted(os.listdir("images")):
    files.download(f"images/{nama_file}")
```

GitHub: buat folder `images/` → unggah PNG.
Di README: `![Pendapatan bulanan](images/01_pendapatan_bulanan.png)`

---

<!-- _class: lead -->

# Giliran kamu · 10 menit

**G1.** Batang horizontal: jumlah pesanan per status, judul berupa kesimpulan

**G2.** Rata-rata `hari_sampai` per bulan, 12 bulan terakhir: makin cepat atau lambat?

---

## PR sesi 8

1. **Outlier harga** di `products`
   - IQR = Q3 − Q1 · batas = Q1 − 1,5×IQR dan Q3 + 1,5×IQR
   - Berapa produk outlier? Kategori apa?
   - Keputusan: dibuang, dibiarkan, atau dianalisis terpisah? **Kenapa?**
2. **3 grafik baru**, judul = kesimpulan, 1 kalimat insight per grafik
3. Unggah notebook + semua PNG ke `images/`

---

## Ringkasan

- Data kosong tidak selalu salah: pahami dulu kenapa kosong
- Dokumentasikan setiap keputusan pembersihan
- Satu grafik, satu pesan · judul = kesimpulan · satu warna sorotan
- Unduh gambarmu sebelum menutup Colab

**Sesi berikutnya:** Sabtu, 28 November 2026, **14.00 WIB**
Statistik deskriptif & analisis pelanggan (RFM)
