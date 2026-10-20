# Runsheet Sesi 5 · Dasar Python I

**Rabu, 18 November 2026 · 20.00–21.40 WIB** · Materi: [materi/sesi-05-python-dasar-1](../materi/sesi-05-python-dasar-1/)

## Persiapan

- [ ] Uji tombol **Open in Colab** di README sesi (butuh repo publik dan branch `main`).
- [ ] Siapkan notebook kosong untuk mengetik ulang, dan notebook lengkap sebagai cadangan.
- [ ] Perbesar font editor Colab (**Tools → Settings → Editor**).

## Runsheet

| Waktu | Bagian | Poin utama |
| --- | --- | --- |
| 20.00 | Recap PR sesi 4 | Tabel analisis; tutup modul SQL |
| 20.15 | Kenapa Python | Tabel SQL vs Python di README. "SQL untuk mengambil, Python untuk mengolah dan menyajikan" |
| 20.20 | Tur Colab | Sel kode/teks, Shift+Enter, **Save a copy in Drive**, urutan menjalankan sel, Runtime → Run before. Semua peserta membuka notebook; "ketik 1" |
| 20.25 | Demo 1–3 | print, variabel, tipe data, operasi, f-string. Tunjukkan `"59.90" * 2` yang menghasilkan teks berulang |
| 20.40 | Demo 4 | List: indeks dari 0 (gambar kotak bernomor), slicing, fungsi bawaan |
| 20.50 | Demo 5–6 | Dictionary; list of dict sebagai "tabel"; hubungkan dengan hasil query |
| 21.00 | Giliran kamu | G1–G2 |
| 21.05 | Menyimpan ke GitHub | Demo **cara 1** (unduh → buat folder `notebooks/` → unggah) |
| 21.10 | Tanya jawab | |
| 21.35 | Penutup | PR |

## Poin penting

- **Indeks mulai dari 0.** Ulangi berkali-kali dengan contoh.
- **`=` bukan "sama dengan"** tapi "simpan ke". `==` untuk membandingkan (sesi 6).
- **Colab mengingat urutan eksekusi, bukan urutan sel.** Jalankan sel di bawah lebih dulu → `NameError`.
- Kode di sesi 5 sengaja tidak memakai loop. Bagian 6 notebook menjumlahkan satu per satu supaya peserta *merasakan* kenapa loop diperlukan di sesi 6.

## Error yang sering muncul

| Error | Penyebab |
| --- | --- |
| `NameError` | Sel sebelumnya belum dijalankan / salah ketik nama |
| `SyntaxError: unterminated string literal` | Tanda kutip tidak ditutup |
| `IndexError: list index out of range` | Indeks melebihi panjang list |
| `KeyError` | Key dictionary salah tulis |
| `TypeError: can only concatenate str (not "float") to str` | `"Harga: " + 49.99`; pakai f-string |

## Kunci jawaban

```python
# G1
nama_produk = "Levi's 501"
harga = 59.50
stok = 12
print(f"Produk {nama_produk} harganya {harga:.2f} USD, stok {stok}")

# G2
ongkir = [5.0, 7.5, 5.0, 12.0, 9.5]
print("Total    :", sum(ongkir))
print("Rata-rata:", sum(ongkir) / len(ongkir))
print("Termahal :", max(ongkir))

# PR1
harga_barang = [25.50, 42.00, 18.75]
total = sum(harga_barang)
print(f"Total     : {total:.2f} USD")
print(f"Rata-rata : {total / len(harga_barang):.2f} USD")
print(f"Tertinggi : {max(harga_barang):.2f} USD")

# PR2
produk = {"name": "Contoh Jacket", "brand": "Columbia", "category": "Outerwear & Coats",
          "cost": 48.30, "retail_price": 105.00}
produk["margin"] = produk["retail_price"] - produk["cost"]
produk["margin_persen"] = round(produk["margin"] / produk["retail_price"] * 100, 1)
print(produk)

# PR3
pelanggan_per_negara = {"China": 34000, "United States": 22500, "Brasil": 14600,
                        "South Korea": 5300, "France": 4700}
total_pelanggan = sum(pelanggan_per_negara.values())
negara_terbanyak = max(pelanggan_per_negara, key=pelanggan_per_negara.get)
persen = pelanggan_per_negara[negara_terbanyak] / total_pelanggan * 100
print(f"Total: {total_pelanggan:,}; terbanyak: {negara_terbanyak} ({persen:.1f}%)")

# PR4
pesanan_saya = [
    {"order_id": 1, "status": "Complete", "total": 40.0},
    {"order_id": 2, "status": "Shipped", "total": 75.5},
    {"order_id": 3, "status": "Processing", "total": 12.0},
]
print(pesanan_saya[1]["status"])
print(pesanan_saya[2]["total"])
```

## Untuk recap sesi 6

- PR3: tanyakan bagaimana kalau negaranya ada 15 dan kita ingin semua persentasenya → jembatan ke loop.
