# Sesi 6 · Dasar Python II: if/else, Loop, dan Function

**Kamis, 19 November 2026 · 20.00–21.40 WIB**

Notebook: [`06_functions.ipynb`](06_functions.ipynb) · [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/riki-profile/blajardata-data-analyst-path/blob/main/materi/sesi-06-python-dasar-2/06_functions.ipynb)

## Tujuan sesi

Setelah sesi ini kamu bisa:

1. Membuat Python mengambil keputusan dengan `if`, `elif`, `else`.
2. Mengulang pekerjaan untuk setiap isi list dengan loop `for`.
3. Membuat function sendiri dengan `def` dan `return`.
4. Menulis function yang memberi label pesanan **kecil**, **sedang**, atau **besar**.

## Agenda

| Waktu (WIB) | Bagian |
| --- | --- |
| 20.00–20.15 | Recap PR sesi 5 |
| 20.15–20.30 | Demo: perbandingan dan if/elif/else |
| 20.30–20.45 | Demo: loop for, akumulator, menghitung per kelompok |
| 20.45–21.05 | Demo: function dan studi kasus label ukuran pesanan |
| 21.05–21.15 | Giliran kamu |
| 21.15–21.35 | Tanya jawab |
| 21.35–21.40 | Penutup dan PR |

## Hubungannya dengan SQL

| Python | Mirip dengan SQL |
| --- | --- |
| `if / elif / else` | `CASE WHEN ... THEN ... ELSE ... END` |
| loop `for` + `if` | `WHERE` |
| akumulator `total += ...` | `SUM()` |
| dictionary penghitung | `GROUP BY` + `COUNT(*)` |
| function | menyimpan query untuk dipakai ulang |

## Isi notebook

| Bagian | Isi |
| --- | --- |
| 1 | Operator perbandingan dan logika |
| 2 | `if`, `elif`, `else`, dan indentasi |
| 3 | Loop `for`, pola akumulator, menghitung per kelompok, `range`, `enumerate` |
| 4 | Function: `def`, parameter, `return`, nilai default |
| 5 | Studi kasus: `label_ukuran_pesanan()` dan `ringkas_pesanan()` |
| 6 | Error yang sering muncul dan cara membacanya |
| 7 | Giliran kamu |
| 8 | PR |

## Cheat sheet

```python
if total >= 150:
    label = "besar"
elif total >= 50:
    label = "sedang"
else:
    label = "kecil"

total = 0
for harga in harga_list:
    total += harga

def label_ukuran_pesanan(total):
    """Memberi label ukuran pesanan."""
    if total >= 150:
        return "besar"
    elif total >= 50:
        return "sedang"
    return "kecil"
```

Ingat: **titik dua** `:` di akhir baris `if`/`for`/`def`, dan **indentasi** 4 spasi di baris berikutnya.

## Giliran kamu (±10 menit)

Bagian 7 di notebook: function `perlu_follow_up(status)` dan loop untuk menghitung nilai pesanan yang dibatalkan.

## PR (30–60 menit)

Bagian 8 di notebook: 4 latihan function, yaitu kelompok umur (sama dengan `CASE WHEN` sesi 4), persen margin, pendapatan per negara, dan label ukuran pesanan dengan batas yang bisa diatur.

Unggah sebagai `notebooks/06_functions.ipynb`.

## Ringkasan

- `if/elif/else` dicek dari atas ke bawah, persis seperti `CASE WHEN`.
- Loop `for` mengulang untuk setiap isi list; pola akumulator untuk menjumlah.
- Function = langkah yang dibungkus dan diberi nama; `return` mengembalikan hasilnya.
- Baca baris terakhir pesan error lebih dulu.

**Sesi berikutnya:** Senin, 23 November 2026, 20.00 WIB. pandas dan memuat data BigQuery ke Colab. **Siapkan Project ID BigQuery-mu.**
