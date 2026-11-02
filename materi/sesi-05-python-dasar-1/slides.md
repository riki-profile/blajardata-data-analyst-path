---
marp: true
theme: default
paginate: true
size: 16:9
footer: "Sesi 5 · Dasar Python I"
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

# Sesi 5 · Dasar Python I

Variabel, tipe data, list, dictionary

Kamis, 19 November 2026 · 20.00–21.40 WIB

---

## Agenda

| Waktu | Bagian |
| --- | --- |
| 20.00 | Recap modul SQL · selamat datang peserta modul Python |
| 20.10 | Kenapa Python? Tur Google Colab |
| 20.20 | Demo: variabel, tipe data, list, dictionary |
| 20.55 | **Kerjakan bersama** |
| 21.05 | **Unggah bersama**: repo `thelook-python-analysis` |
| 21.20 | Tanya jawab |
| 21.37 | Penutup |

Notebook: `05_python_basics.ipynb` (tombol **Open in Colab** di README sesi)

---

## Kenapa Python, kalau sudah bisa SQL?

| SQL | Python + pandas |
| --- | --- |
| Mengambil & meringkas data **di database** | Mengolah data **setelah diambil** |
| Sangat cepat untuk data besar | Fleksibel: pembersihan, statistik, grafik |
| Satu query = satu hasil | Banyak langkah, tersimpan rapi di notebook |

**SQL untuk mengambil, Python untuk mengolah dan menyajikan.**

---

## Tur Google Colab

- Notebook = kumpulan **sel**: sel **kode** dan sel **teks**
- Jalankan sel: **Shift + Enter**
- Tambah sel: **+ Code** / **+ Text**
- **File → Save a copy in Drive** ← lakukan dulu!
- Urutan menjalankan sel itu penting. `NameError`? → **Runtime → Run before**

Ketik `1` kalau notebook sudah terbuka dan tersimpan di Drive

---

## Variabel

Nama untuk menyimpan nilai. `=` artinya **"simpan ke"**, bukan "sama dengan".

```python
nama_toko = "TheLook"
jumlah_pesanan = 125
harga_jeans = 49.99

jumlah_pesanan = jumlah_pesanan + 5   # ada 5 pesanan baru
```

Nama variabel: huruf kecil, `pakai_garis_bawah`, tidak diawali angka, menjelaskan isinya.

---

## Tipe data

| Tipe | Nama | Contoh |
| --- | --- | --- |
| Bilangan bulat | `int` | `125` |
| Desimal | `float` | `49.99` |
| Teks | `str` | `"Complete"` |
| Benar/salah | `bool` | `True`, `False` |

```python
print(f"Pendapatan {kategori}: {pendapatan:,.2f} USD")   # f-string
float("59.90") * 2                                        # ubah teks → angka
```

---

## List: kumpulan berurutan

```python
harga_terjual = [49.99, 15.00, 120.50, 32.75, 8.99, 75.00]
# indeks:          0      1      2       3      4     5
#                 -6     -5     -4      -3     -2    -1

harga_terjual[0]      # 49.99   ← indeks mulai dari 0!
harga_terjual[-1]     # 75.0    ← dari belakang
harga_terjual[0:3]    # [49.99, 15.0, 120.5]

len(harga_terjual), sum(harga_terjual), max(harga_terjual)
harga_terjual.append(19.99)
sorted(harga_terjual, reverse=True)
```

---

## Dictionary: data berlabel

```python
pesanan = {
    "order_id": 1001,
    "status": "Complete",
    "total": 89.98,
}
pesanan["status"]               # ambil nilai
pesanan["country"] = "Japan"    # tambah / ubah
pesanan.get("gender", "tidak ada")
```

Cocok juga untuk ringkasan, mirip hasil `GROUP BY`:

```python
pendapatan_per_kategori = {"Jeans": 38990.25, "Sweaters": 30120.00}
max(pendapatan_per_kategori, key=pendapatan_per_kategori.get)
```

---

## List berisi dictionary = tabel kecil

```python
daftar_pesanan = [
    {"order_id": 1001, "status": "Complete",  "total": 89.98},
    {"order_id": 1002, "status": "Shipped",   "total": 35.50},
    {"order_id": 1003, "status": "Cancelled", "total": 120.00},
]
daftar_pesanan[2]["status"]     # 'Cancelled'
```

Setiap dictionary = satu baris. Cikal bakal **DataFrame** pandas (sesi 7).

Menjumlahkan semua total satu per satu itu merepotkan → **loop** di sesi 6.

---

<!-- _class: lead -->

# Kerjakan bersama · 10 menit

**B1.** Variabel produk → cetak: `Produk Levi's 501 harganya 59.50 USD, stok 12`

**B2.** `ongkir = [5.0, 7.5, 5.0, 12.0, 9.5]`: total, rata-rata, termahal

Instruktur memandu langkah demi langkah · kamu mengetik bersamaan

---

## Repo baru: `thelook-python-analysis`

1. GitHub → **New repository** → `thelook-python-analysis` · Public · Add a README (lihat `PANDUAN_GITHUB.md`)
2. Colab: jalankan semua sel → **File → Download → Download .ipynb**
3. Repo → **Add file → Create new file** → `notebooks/README.md` → commit (membuat folder)
4. Masuk folder `notebooks` → **Add file → Upload files** → seret `.ipynb`
5. Nama file harus `05_python_basics.ipynb` (hapus "Salinan dari ...")

---

## Latihan mandiri (opsional)

Tidak wajib, tidak dinilai; jawaban dibagikan setelah kelas.

Bagian 9 notebook:
1. List harga 3 barang → total, rata-rata, tertinggi
2. Dictionary satu produk → margin & persen margin
3. Pelanggan per negara → total, terbanyak, persentase
4. List berisi 3 dictionary pesanan

---

## Ringkasan

- Variabel menyimpan nilai; `=` = "simpan ke"
- Tipe data: `int`, `float`, `str`, `bool`
- List `[ ]`: berurutan, indeks mulai 0 · Dictionary `{ }`: key → value
- List berisi dictionary = tabel sederhana

**Sesi berikutnya:** Sabtu, 21 November 2026, **14.00 WIB**
if/else, loop, dan function
