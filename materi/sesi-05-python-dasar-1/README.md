# Sesi 5 · Dasar Python I: Variabel, Tipe Data, List, Dictionary

**Kamis, 19 November 2026 · 20.00–21.40 WIB**

> **Baru bergabung di modul Python?** Selamat datang! Pastikan langkah persiapan modul Python di [PERSIAPAN.md](../../PERSIAPAN.md#mulai-dari-modul-python-atau-power-bi) sudah selesai, dan baca [KAMUS_DATA.md](../../KAMUS_DATA.md) untuk mengenal dataset TheLook. Bagian recap di awal kelas membahas modul SQL; kamu cukup menyimak.

Notebook: [`05_python_basics.ipynb`](05_python_basics.ipynb) · [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/riki-profile/blajardata-data-analyst-path/blob/main/materi/sesi-05-python-dasar-1/05_python_basics.ipynb)

## Tujuan sesi

Setelah sesi ini kamu bisa:

1. Menjalankan dan menyimpan notebook di Google Colab.
2. Menyimpan data di variabel dan mengenali tipe data `int`, `float`, `str`, `bool`.
3. Memakai **list** untuk kumpulan nilai dan **dictionary** untuk data berlabel.
4. Menghitung total, rata-rata, nilai terbesar, dan nilai terkecil dari data pesanan.
5. Membuat repo portofolio modul Python, `thelook-python-analysis`, dan menyimpan notebook dari Colab ke sana.

## Agenda

| Waktu (WIB) | Bagian |
| --- | --- |
| 20.00–20.10 | Recap modul SQL, sambutan peserta baru modul Python |
| 20.10–20.20 | Kenapa Python setelah SQL? Tur Google Colab |
| 20.20–20.55 | Demo: variabel, tipe data, list, dictionary |
| 20.55–21.05 | **Kerjakan bersama** |
| 21.05–21.20 | **Unggah bersama**: buat repo `thelook-python-analysis`, unggah notebook |
| 21.20–21.37 | Tanya jawab |
| 21.37–21.40 | Penutup |

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
| 7 | Kerjakan bersama |
| 8 | Menyimpan notebook ke GitHub |
| 9 | Latihan mandiri (opsional) |

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

## Kerjakan bersama (±10 menit)

Instruktur mengerjakannya langkah demi langkah di layar, dan kamu mengetik bersamaan di file kerjamu. Tidak perlu menebak jawabannya sendiri dulu. Bagian 7 di notebook: membuat variabel produk dan menghitung ringkasan ongkir dari sebuah list.

## Unggah bersama (di kelas)

Bersama instruktur: buat repo **`thelook-python-analysis`** (langkahnya di [PANDUAN_GITHUB.md](../../PANDUAN_GITHUB.md)), buat folder `notebooks/`, dan unggah notebook sebagai `notebooks/05_python_basics.ipynb`. Langkah lengkapnya ada di bagian 8 notebook.

## Latihan mandiri (opsional)

Tidak wajib dan tidak dinilai. Untuk yang ingin berlatih lebih, kerjakan bagian **LATIHAN MANDIRI** di file kerja; jawabannya dibagikan instruktur setelah kelas. Bagian 9 di notebook: 4 latihan list dan dictionary.

## Ringkasan

- Variabel menyimpan nilai; `=` artinya "simpan ke".
- Tipe data utama: `int`, `float`, `str`, `bool`.
- List `[ ]` = kumpulan berurutan, indeks mulai dari 0. Dictionary `{ }` = pasangan key: value.
- List berisi dictionary = tabel sederhana, cikal bakal DataFrame.

**Sesi berikutnya:** Sabtu, 21 November 2026, 14.00 WIB. if/else, loop, dan function.
