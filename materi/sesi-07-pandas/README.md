# Sesi 7 · Dasar pandas: Memuat Data BigQuery ke Colab

**Selasa, 24 November 2026 · 20.00–21.40 WIB**

Notebook: [`07_pandas_exploration.ipynb`](07_pandas_exploration.ipynb) · [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/riki-profile/blajardata-data-analyst-path/blob/main/materi/sesi-07-pandas/07_pandas_exploration.ipynb)

**Siapkan Project ID BigQuery-mu** (lihat [PERSIAPAN.md](../../PERSIAPAN.md#2-aktifkan-bigquery-sandbox)).

## Tujuan sesi

Setelah sesi ini kamu bisa:

1. Menghubungkan Colab ke BigQuery dan memuat hasil query sebagai DataFrame.
2. Mengenali data baru dengan `head`, `shape`, `info`, dan `describe`.
3. Memilih kolom, memfilter baris, mengurutkan, dan mengelompokkan data dengan pandas.
4. Membuat kolom baru, termasuk dengan function dari sesi 6.

## Agenda

| Waktu (WIB) | Bagian |
| --- | --- |
| 20.00–20.10 | Recap PR sesi 6 |
| 20.10–20.25 | Menghubungkan Colab ke BigQuery (semua peserta sampai berhasil) |
| 20.25–21.05 | Demo: tabel analisis sesi 4 → DataFrame; eksplorasi, filter, groupby, kolom baru |
| 21.05–21.15 | Giliran kamu |
| 21.15–21.35 | Tanya jawab |
| 21.35–21.40 | Penutup dan PR |

## Dari SQL ke pandas

| SQL | pandas |
| --- | --- |
| `SELECT a, b` | `df[["a", "b"]]` |
| `WHERE a = 'x'` | `df[df["a"] == "x"]` |
| `WHERE a = 'x' AND b > 10` | `df[(df["a"] == "x") & (df["b"] > 10)]` |
| `WHERE a IN ('x', 'y')` | `df[df["a"].isin(["x", "y"])]` |
| `ORDER BY a DESC` | `df.sort_values("a", ascending=False)` |
| `LIMIT 10` | `df.head(10)` |
| `COUNT(DISTINCT a)` | `df["a"].nunique()` |
| `GROUP BY a` + `COUNT(*)` | `df["a"].value_counts()` |
| `GROUP BY a` + `SUM(b)` | `df.groupby("a")["b"].sum()` |
| `SELECT b - c AS d` | `df["d"] = df["b"] - df["c"]` |

## Isi notebook

| Bagian | Isi |
| --- | --- |
| 1 | Login dan koneksi ke BigQuery; function `jalankan_query()` |
| 2 | Memuat tabel analisis (versi instruktur dari PR sesi 4) |
| 3 | `head`, `shape`, `columns`, `info`, `describe` |
| 4–5 | Memilih kolom dan memfilter baris |
| 6 | `sort_values`, `value_counts`, `nunique`, `groupby` + `agg` |
| 7 | Kolom baru, tanggal (`pd.to_datetime`, `.dt.year`), `.apply()` |
| 8 | Sekilas grafik dengan `.plot()` |
| 9 | Giliran kamu |
| 10 | PR: jelajahi tabel `users` |

## Masalah koneksi yang sering terjadi

| Error | Solusi |
| --- | --- |
| `403 Access Denied` / `Permission denied` | Login di Colab dengan akun Google yang sama dengan BigQuery |
| `Project ... not found` | `PROJECT_ID` salah. Pakai **ID**, bukan nama project |
| `NameError: name 'client' is not defined` | Sel koneksi belum dijalankan. **Runtime → Run before** |
| Login muncul lagi setelah lama tidak dipakai | Runtime Colab berhenti setelah idle. Jalankan ulang dari atas |

## Giliran kamu (±10 menit)

Bagian 9 di notebook: pelanggan unik per gender, dan pendapatan per kelompok umur.

## PR (30–60 menit)

Bagian 10 di notebook: muat tabel `users` dan jawab 5 pertanyaan eksplorasi, masing-masing dengan satu kalimat jawaban.

Unggah sebagai `notebooks/07_pandas_exploration.ipynb`.

> **Sebelum mengunggah:** ganti `PROJECT_ID` dengan teks `"isi-project-id-kamu"` kalau kamu tidak ingin Project ID-mu terlihat publik. Project ID bukan password, jadi tidak berbahaya, tapi lebih rapi kalau disembunyikan.

## Ringkasan

- SQL mengambil data dari BigQuery, pandas mengolahnya di Colab.
- Lima perintah pertama untuk data baru: `head`, `shape`, `columns`, `info`, `describe`.
- Filter dengan beberapa kondisi: `&`/`|` dan setiap kondisi diberi kurung.
- `groupby` + `agg` = `GROUP BY` dengan banyak ringkasan sekaligus.

**Sesi berikutnya:** Kamis, 26 November 2026, 20.00–22.00 WIB (**2 jam**). Pembersihan data dan visualisasi.
