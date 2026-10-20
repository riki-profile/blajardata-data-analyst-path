# Sesi 5 · Dasar Python I: Variabel, Tipe Data, List, Dictionary

**Rabu, 18 November 2026 · 20.00–21.40 WIB**

Notebook: [`05_python_basics.ipynb`](05_python_basics.ipynb) · [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/riki-profile/blajardata-data-analyst-path/blob/main/materi/sesi-05-python-dasar-1/05_python_basics.ipynb)

## Tujuan sesi

Setelah sesi ini kamu bisa:

1. Menjalankan dan menyimpan notebook di Google Colab.
2. Menyimpan data di variabel dan mengenali tipe data `int`, `float`, `str`, `bool`.
3. Memakai **list** untuk kumpulan nilai dan **dictionary** untuk data berlabel.
4. Menghitung total, rata-rata, nilai terbesar, dan nilai terkecil dari data pesanan.
5. Menyimpan notebook dari Colab ke GitHub.

## Agenda

| Waktu (WIB) | Bagian |
| --- | --- |
| 20.00–20.15 | Recap PR sesi 4 (tabel analisis) dan penutupan modul SQL |
| 20.15–20.25 | Kenapa Python setelah SQL? Tur Google Colab |
| 20.25–21.00 | Demo: variabel, tipe data, list, dictionary |
| 21.00–21.10 | Giliran kamu + cara menyimpan notebook ke GitHub |
| 21.10–21.35 | Tanya jawab |
| 21.35–21.40 | Penutup dan PR |

## Kenapa Python, kalau sudah bisa SQL?

| SQL | Python + pandas |
| --- | --- |
| Mengambil dan meringkas data **di database** | Mengolah data **setelah diambil** |
| Sangat cepat untuk data besar | Fleksibel: pembersihan rumit, statistik, grafik |
| Satu query = satu hasil | Banyak langkah, tersimpan rapi di notebook beserta penjelasannya |

Di dunia kerja keduanya dipakai bersama: **SQL untuk mengambil, Python untuk mengolah dan menyajikan.** Hari ini dan sesi 6 kita belajar dasar bahasanya dulu. Di sesi 7 keduanya kita sambungkan.

## Cara membuka notebook

- **Klik tombol Open in Colab** di atas, lalu **File → Save a copy in Drive**. Salinan di Drive-mu adalah yang kamu kerjakan.
- Atau unduh file `.ipynb`, lalu di Colab: **File → Upload notebook**.

## Isi notebook

| Bagian | Isi |
| --- | --- |
| 1–2 | `print`, komentar, variabel |
| 3 | Tipe data, operasi angka, f-string, mengubah tipe |
| 4 | List: indeks, slicing, `len`/`sum`/`max`/`min`, `append`, `sorted` |
| 5 | Dictionary: key/value, mengubah dan menambah data |
| 6 | List berisi dictionary: "tabel kecil" pesanan TheLook |
| 7 | Giliran kamu |
| 8 | Menyimpan notebook ke GitHub |
| 9 | PR |

## Cheat sheet

```python
harga = 49.99                       # variabel (float)
status = "Complete"                 # teks (str)
print(f"Harga: {harga:,.2f} USD")   # f-string, 2 desimal

harga_list = [49.99, 15.0, 120.5]   # list
harga_list[0]                       # isi pertama (indeks mulai dari 0)
harga_list[-1]                      # isi terakhir
sum(harga_list) / len(harga_list)   # rata-rata

pesanan = {"order_id": 1001, "total": 89.98}   # dictionary
pesanan["total"]                               # ambil nilai
pesanan["status"] = "Complete"                 # tambah/ubah
```

## Giliran kamu (±10 menit)

Bagian 7 di notebook: membuat variabel produk dan menghitung ringkasan ongkir dari sebuah list.

## PR (30–60 menit)

Bagian 9 di notebook: 4 latihan list dan dictionary dengan data pesanan dan produk.

Lalu buat folder `notebooks/` di repo portofoliomu dan unggah notebook sebagai `notebooks/05_python_basics.ipynb`. Langkah lengkapnya ada di bagian 8 notebook.

## Ringkasan

- Variabel menyimpan nilai; `=` artinya "simpan ke".
- Tipe data utama: `int`, `float`, `str`, `bool`.
- List `[ ]` = kumpulan berurutan, indeks mulai dari 0. Dictionary `{ }` = pasangan key: value.
- List berisi dictionary = tabel sederhana, cikal bakal DataFrame.

**Sesi berikutnya:** Kamis, 19 November 2026, 20.00 WIB. if/else, loop, dan function.
