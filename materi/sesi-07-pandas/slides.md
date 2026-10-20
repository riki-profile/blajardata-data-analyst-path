---
marp: true
theme: default
paginate: true
size: 16:9
footer: "Sesi 7 · Dasar pandas & BigQuery di Colab"
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

# Sesi 7 · Dasar pandas

Memuat data BigQuery ke Colab

Selasa, 24 November 2026 · 20.00–21.40 WIB

---

## Agenda

| Waktu | Bagian |
| --- | --- |
| 20.00 | Recap PR sesi 6 |
| 20.10 | Menghubungkan Colab ke BigQuery (**semua sampai berhasil**) |
| 20.25 | Tabel analisis → DataFrame; eksplorasi, filter, groupby |
| 21.05 | Giliran kamu |
| 21.15 | Tanya jawab |
| 21.35 | Penutup & PR |

Notebook: `07_pandas_exploration.ipynb` · **Siapkan Project ID**

---

## SQL bertemu Python

```
BigQuery (SQL)  ──query──▶  DataFrame (pandas di Colab)  ──▶  analisis & grafik
```

- **DataFrame** = tabel di Python: baris & kolom, seperti hasil query
- **pandas** = library untuk mengolah DataFrame

---

## Langkah 1 · Login & koneksi

```python
from google.colab import auth
auth.authenticate_user()          # pilih akun yang SAMA dengan BigQuery

import pandas as pd
from google.cloud import bigquery

PROJECT_ID = "isi-project-id-kamu"   # GANTI: ID, bukan nama project
client = bigquery.Client(project=PROJECT_ID)

def jalankan_query(sql):
    return client.query(sql).to_dataframe()

jalankan_query("SELECT 'Terhubung ke BigQuery!' AS pesan")
```

Ketik `1` kalau muncul "Terhubung ke BigQuery!"

---

## Kalau koneksi gagal

| Error | Solusi |
| --- | --- |
| `403 Access Denied` | Login Colab dengan akun Google yang sama dengan BigQuery |
| `Project ... not found` | `PROJECT_ID` salah: pakai **ID** (`belajar-data-123456`) |
| `NameError: client` | Sel koneksi belum dijalankan → **Runtime → Run before** |
| Diminta login lagi | Runtime Colab berhenti setelah idle → jalankan ulang dari atas |

---

## Langkah 2 · Memuat tabel analisis

Query = versi instruktur dari **PR sesi 4** (satu baris per barang terjual).

```python
SQL_TABEL_ANALISIS = """
WITH item_valid AS ( ... )
SELECT ... FROM item_valid AS i
JOIN ... products ... JOIN ... users ...
"""
df = jalankan_query(SQL_TABEL_ANALISIS)
```

Query panjang ditulis di antara `"""` tiga tanda kutip `"""`.

---

## 5 perintah pertama untuk data baru

| Perintah | Menjawab |
| --- | --- |
| `df.head()` | Seperti apa isinya? |
| `df.shape` | Berapa baris & kolom? |
| `df.columns` | Apa nama kolomnya? |
| `df.info()` | Tipe data? Ada yang kosong? |
| `df.describe()` | Bagaimana sebaran angkanya? |

`describe()`: `mean` = rata-rata · `50%` = **median** · `std` = sebaran

> Rata-rata `sale_price` lebih besar dari median? Apa artinya?

---

## Dari SQL ke pandas

| SQL | pandas |
| --- | --- |
| `SELECT a, b` | `df[["a", "b"]]` |
| `WHERE a = 'x'` | `df[df["a"] == "x"]` |
| `WHERE a = 'x' AND b > 10` | `df[(df["a"] == "x") & (df["b"] > 10)]` |
| `WHERE a IN ('x', 'y')` | `df[df["a"].isin(["x", "y"])]` |
| `ORDER BY a DESC` | `df.sort_values("a", ascending=False)` |
| `COUNT(DISTINCT a)` | `df["a"].nunique()` |
| `GROUP BY a` + `COUNT(*)` | `df["a"].value_counts()` |
| `GROUP BY a` + `SUM(b)` | `df.groupby("a")["b"].sum()` |

Filter majemuk: `&` / `|`, **setiap kondisi diberi kurung**

---

## groupby + agg

```python
per_kategori = (
    df.groupby("category")
      .agg(pendapatan=("sale_price", "sum"),
           margin=("margin", "sum"),
           pesanan=("order_id", "nunique"),
           harga_rata=("sale_price", "mean"))
      .sort_values("pendapatan", ascending=False)
)
```

Format: `nama_baru=("kolom_sumber", "fungsi")`

---

## Kolom baru

```python
pk = per_kategori
pk["margin_persen"] = pk["margin"] / pk["pendapatan"] * 100

df["order_date"] = pd.to_datetime(df["order_date"])   # dbdate → datetime
df["tahun"] = df["order_date"].dt.year                # .dt = bagian tanggal

df["label_harga"] = df["sale_price"].apply(label_harga)   # function sesi 6!
```

---

<!-- _class: lead -->

# Giliran kamu · 10 menit

**G1.** Pelanggan unik (`user_id`) per `gender`

**G2.** Pendapatan & pesanan unik per `age_band`

---

## PR sesi 7 · Jelajahi tabel users

1. Jumlah baris & kolom? Kolom mana yang kosong?
2. Umur rata-rata, median, termuda, tertua?
3. 5 negara dengan pelanggan terbanyak + persentasenya
4. `traffic_source` terbanyak? Beda antara pria & wanita?
5. Tahun berapa paling banyak pelanggan mendaftar?

Setiap jawaban: **1 kalimat** di sel teks. Unggah `notebooks/07_pandas_exploration.ipynb`

---

## Ringkasan

- SQL mengambil dari BigQuery, pandas mengolah di Colab
- `head`, `shape`, `columns`, `info`, `describe` untuk data baru
- Filter majemuk: `&` / `|` + kurung
- `groupby` + `agg` = `GROUP BY` dengan banyak ringkasan

**Sesi berikutnya:** Kamis, 26 November 2026, 20.00–**22.00** WIB (2 jam)
Pembersihan data dan visualisasi
