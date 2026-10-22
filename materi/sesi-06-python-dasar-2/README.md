# Sesi 6 · Dasar Python II: if/else, Loop, dan Function

**Sabtu, 21 November 2026 · 14.00–15.40 WIB**

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
| 14.00–14.05 | Recap sesi 5 |
| 14.05–14.20 | Demo: perbandingan dan if/elif/else |
| 14.20–14.35 | Demo: loop for, akumulator, menghitung per kelompok |
| 14.35–14.55 | Demo: function dan studi kasus label ukuran pesanan |
| 14.55–15.10 | **Kerjakan bersama** |
| 15.10–15.20 | **Unggah bersama** `06_functions.ipynb` |
| 15.20–15.37 | Tanya jawab |
| 15.37–15.40 | Penutup |

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
| 7 | Kerjakan bersama |
| 8 | Latihan mandiri (opsional) |

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

## Kerjakan bersama (±15 menit)

Instruktur mengerjakannya langkah demi langkah di layar, dan kamu mengetik bersamaan di file kerjamu. Tidak perlu menebak jawabannya sendiri dulu. Bagian 7 di notebook: function `perlu_follow_up(status)` dan loop untuk menghitung nilai pesanan yang dibatalkan.

## Unggah bersama (di kelas)

Bersama instruktur: Colab → **File → Download .ipynb** → repo `thelook-python-analysis` → folder `notebooks` → **Upload files** → `06_functions.ipynb`.

## Latihan mandiri (opsional)

Tidak wajib dan tidak dinilai. Untuk yang ingin berlatih lebih, kerjakan bagian **LATIHAN MANDIRI** di file kerja; jawabannya dibagikan instruktur setelah kelas. Bagian 8 di notebook: 4 latihan function (kelompok umur, persen margin, pendapatan per negara, label dengan batas yang bisa diatur).

## Ringkasan

- `if/elif/else` dicek dari atas ke bawah, persis seperti `CASE WHEN`.
- Loop `for` mengulang untuk setiap isi list; pola akumulator untuk menjumlah.
- Function = langkah yang dibungkus dan diberi nama; `return` mengembalikan hasilnya.
- Baca baris terakhir pesan error lebih dulu.

**Sesi berikutnya:** Selasa, 24 November 2026, 20.00 WIB. pandas dan memuat data BigQuery ke Colab. **Siapkan Project ID BigQuery-mu.**
