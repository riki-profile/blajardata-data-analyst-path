---
marp: true
theme: default
paginate: true
size: 16:9
footer: "Sesi 6 · Dasar Python II"
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

# Sesi 6 · Dasar Python II

if/else, loop, dan function

Sabtu, 21 November 2026 · 14.00–15.40 WIB

---

## Agenda

| Waktu | Bagian |
| --- | --- |
| 14.00 | Recap PR sesi 5 |
| 14.10 | Perbandingan & if/elif/else |
| 14.25 | Loop for, akumulator, menghitung per kelompok |
| 14.45 | Function & studi kasus: label ukuran pesanan |
| 15.05 | Giliran kamu |
| 15.15 | Tanya jawab |
| 15.35 | Penutup & PR |

Notebook: `06_functions.ipynb`

---

## Hubungannya dengan SQL

| Python | Mirip dengan SQL |
| --- | --- |
| `if / elif / else` | `CASE WHEN ... ELSE ... END` |
| loop `for` + `if` | `WHERE` |
| akumulator `total += ...` | `SUM()` |
| dictionary penghitung | `GROUP BY` + `COUNT(*)` |
| function | query yang disimpan untuk dipakai ulang |

---

## Perbandingan → True / False

| Operator | Arti |
| --- | --- |
| `==` | sama dengan (**dua** tanda `=`) |
| `!=` | tidak sama dengan |
| `>`, `>=`, `<`, `<=` | lebih besar / kecil |
| `and`, `or`, `not` | menggabungkan kondisi |
| `in` | ada di dalam list |

```python
status in ["Cancelled", "Returned"]    # True / False
```

---

## if / elif / else

```python
total = 85.0

if total >= 150:
    print("Pesanan besar")
elif total >= 50:
    print("Pesanan sedang")
else:
    print("Pesanan kecil")
```

- **Titik dua** `:` di akhir baris `if`, `elif`, `else`
- **Indentasi** (4 spasi) wajib: menandai baris mana yang di dalam `if`
- Dicek dari atas ke bawah, persis seperti `CASE WHEN`

---

## Loop for & pola akumulator

```python
harga_terjual = [49.99, 15.00, 120.50, 32.75, 8.99]

total = 0
for harga in harga_terjual:
    total = total + harga        # atau: total += harga

print(f"Total: {total:.2f} USD")
```

| Putaran | `harga` | `total` |
| --- | --- | --- |
| 1 | 49.99 | 49.99 |
| 2 | 15.00 | 64.99 |
| 3 | 120.50 | 185.49 |

---

## Loop + if = WHERE + SUM

```python
pendapatan = 0
for pesanan in daftar_pesanan:
    if pesanan["status"] not in ["Cancelled", "Returned"]:
        pendapatan += pesanan["total"]
```

Menghitung per kelompok = `GROUP BY` + `COUNT(*)`:

```python
jumlah_per_status = {}
for pesanan in daftar_pesanan:
    status = pesanan["status"]
    if status in jumlah_per_status:
        jumlah_per_status[status] += 1
    else:
        jumlah_per_status[status] = 1
```

---

## Function

```python
def hitung_margin(harga_jual, biaya):
    """Mengembalikan margin (harga jual - biaya) dalam USD."""
    return harga_jual - biaya

hitung_margin(59.90, 27.30)

def harga_setelah_diskon(harga, persen_diskon=10):   # nilai default
    return round(harga * (1 - persen_diskon / 100), 2)
```

- `def` membuat function; kodenya jalan saat **dipanggil**
- Parameter = input · `return` = output
- `print` hanya menampilkan; `return` mengembalikan nilai yang bisa disimpan

---

## Studi kasus: label ukuran pesanan

| Label | Total pesanan |
| --- | --- |
| `kecil` | < 50 USD |
| `sedang` | 50 – < 150 USD |
| `besar` | ≥ 150 USD |

```python
def label_ukuran_pesanan(total):
    if total >= 150:
        return "besar"
    elif total >= 50:
        return "sedang"
    else:
        return "kecil"
```

**Uji nilai batas:** 50 → `sedang`? 150 → `besar`?

---

## Dari 7 pesanan ke 100 ribu pesanan

Hari ini dengan loop:

```python
for pesanan in daftar_pesanan:
    pesanan["ukuran"] = label_ukuran_pesanan(pesanan["total"])
```

Sesi 7–8 dengan pandas, function yang **sama**:

```python
df["ukuran"] = df["total"].apply(label_ukuran_pesanan)
```

---

## Error yang sering muncul

| Pesan | Penyebab |
| --- | --- |
| `IndentationError` | Spasi di awal baris tidak konsisten |
| `SyntaxError: expected ':'` | Lupa titik dua |
| `NameError` | Salah ketik / sel sebelumnya belum dijalankan |
| `KeyError: 'Status'` | Key dictionary salah tulis |
| `TypeError: unsupported operand` | Menjumlahkan teks dengan angka |

**Baca baris terakhir pesan error lebih dulu.**

---

<!-- _class: lead -->

# Giliran kamu · 10 menit

**G1.** `perlu_follow_up(status)`: `True` untuk Processing / Shipped

**G2.** Loop: total nilai pesanan yang **Cancelled**

---

## PR sesi 6

1. `kelompok_umur(umur)`: label **sama persis** dengan CASE WHEN sesi 4
2. `persen_margin(harga_jual, biaya)`: aman kalau harga jual 0
3. Loop: **pendapatan per negara** (pesanan sah saja)
4. `label_ukuran_pesanan_v2(total, batas_sedang=50, batas_besar=150)`

Unggah ke `notebooks/06_functions.ipynb`

---

## Ringkasan

- `if/elif/else` dicek dari atas ke bawah, seperti `CASE WHEN`
- Loop `for` mengulang untuk setiap isi list; akumulator untuk menjumlah
- Function = langkah yang dibungkus dan diberi nama; `return` mengembalikan hasil

**Sesi berikutnya:** Selasa, 24 November 2026, 20.00 WIB
pandas & memuat data BigQuery ke Colab. **Siapkan Project ID BigQuery-mu!**
