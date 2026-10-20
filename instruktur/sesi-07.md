# Runsheet Sesi 7 · pandas dan Memuat Data BigQuery

**Selasa, 24 November 2026 · 20.00–21.40 WIB** · Materi: [materi/sesi-07-pandas](../materi/sesi-07-pandas/)

## Persiapan

- [ ] Jalankan notebook dari nol di **akun Google yang belum pernah dipakai** (atau jendela incognito), supaya alur login sama persis dengan yang dialami peserta.
- [ ] Catat jumlah baris tabel analisis (bandingkan dengan catatan sesi 4).
- [ ] Siapkan asisten/co-host untuk membantu peserta yang gagal login. Ini bagian paling rawan di seluruh kursus.

## Runsheet

| Waktu | Bagian | Poin utama |
| --- | --- | --- |
| 20.00 | Recap PR sesi 6 | `kelompok_umur()` = CASE WHEN |
| 20.10 | Koneksi BigQuery | Semua peserta menjalankan sel login dan uji koneksi. **Jangan lanjut** sampai mayoritas mengetik 1. Yang gagal → *breakout room* dengan asisten |
| 20.25 | Demo 2–3 | Muat tabel analisis; 5 perintah pertama; cara membaca `info()` dan `describe()`. Diskusi mean vs median `sale_price` (jembatan ke sesi 9) |
| 20.40 | Demo 4–6 | Memilih kolom, filter (`&`, kurung), `sort_values`, `value_counts`, `groupby` + `agg`. Tampilkan tabel SQL ↔ pandas di README |
| 20.55 | Demo 7–8 | Kolom baru, `pd.to_datetime`, `.apply()` dengan function sesi 6; teaser grafik |
| 21.05 | Giliran kamu | G1–G2 |
| 21.15 | Tanya jawab | |
| 21.35 | Penutup | PR: eksplorasi `users`. Sesi 8 = **2 jam** |

## Poin penting

- `df["a"]` (Series) vs `df[["a", "b"]]` (DataFrame): kurung ganda karena isinya list.
- Filter majemuk: `&`/`|`, bukan `and`/`or`, dan **wajib kurung**. Tunjukkan error-nya.
- `dbdate` dari BigQuery → `pd.to_datetime`.
- Data lengkap tabel analisis ±ratusan ribu baris. Masih ringan untuk Colab, tapi ini alasan kita meringkas di SQL kalau datanya jauh lebih besar.

## Error yang sering muncul

| Error | Penyebab |
| --- | --- |
| `Forbidden: 403 ... USER_PROJECT_DENIED` / `Access Denied` | Akun login Colab ≠ akun BigQuery, atau `PROJECT_ID` salah |
| `ValueError: The truth value of a Series is ambiguous` | Memakai `and`/`or`, atau lupa kurung di filter |
| `KeyError: 'Category'` | Nama kolom salah (huruf besar-kecil) |
| `AttributeError: Can only use .dt accessor with datetimelike values` | Kolom tanggal belum diubah dengan `pd.to_datetime` |

## Kunci jawaban

```python
# G1
df.groupby("gender")["user_id"].nunique()

# G2
(df.groupby("age_band")
   .agg(pendapatan=("sale_price", "sum"), pesanan=("order_id", "nunique"))
   .sort_values("pendapatan", ascending=False))

# PR1
print(users.shape)
users.isna().sum()

# PR2
users["age"].agg(["mean", "median", "min", "max"])

# PR3
top5 = users["country"].value_counts().head(5)
porsi5 = users["country"].value_counts(normalize=True).head(5) * 100
pd.DataFrame({"pelanggan": top5, "persen": porsi5.round(1)})

# PR4
print(users["traffic_source"].value_counts())
users.groupby(["gender", "traffic_source"]).size().unstack()

# PR5
users["tahun_daftar"] = pd.to_datetime(users["created_at"]).dt.year
users["tahun_daftar"].value_counts().sort_index()
```

Catatan: di data TheLook (sintetis), komposisi traffic source pria dan wanita hampir sama. Ini jawaban yang sah. Pujilah peserta yang menuliskannya dengan jujur, bukan memaksakan perbedaan.

## Untuk recap sesi 8

- Tampilkan `users.isna().sum()`: apakah ada kolom yang kosong? Jembatan ke checklist pembersihan.
