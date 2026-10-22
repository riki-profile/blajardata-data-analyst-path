# Modul Tableau · Sesi 1 · Dashboard Pertama di Tableau Public

**Durasi:** 1,5 jam (±100 menit) · Jadwal mengikuti kelas

**Wajib sebelum kelas:** Tableau Public sudah terinstall, akun Tableau Public sudah dibuat. Lihat [persiapan modul Tableau](../README.md#persiapan-peserta).

| File | Fungsi |
| --- | --- |
| **3 file CSV** (link Google Drive dibagikan di grup kelas) | Data penjualan, produk, dan pelanggan TheLook |
| [panduan-tableau.md](panduan-tableau.md) | Langkah demi langkah di Tableau Public |

## Tujuan sesi

Setelah sesi ini kamu bisa:

1. Memuat file data ke Tableau Public dan mengecek tipe datanya.
2. Membuat **relationship** antar tabel (seperti JOIN, tapi di Tableau).
3. Membuat *calculated field*: pendapatan, jumlah pesanan, dan AOV.
4. Membuat kartu KPI dan 2 grafik (tren bulanan, pendapatan per kategori), lalu menyusunnya di satu dashboard.
5. Menyimpan dashboard ke Tableau Public dan membuat repo portofolio `thelook-tableau-dashboard`.

## Agenda

| Menit | Bagian |
| --- | --- |
| 0–10 | Perkenalan dan aturan main (kode chat `1`/`2`/`?`) |
| 10–20 | Apa itu dashboard; unduh 3 file CSV |
| 20–35 | Demo: memuat data, tipe data, relationship |
| 35–65 | Demo: calculated field, kartu KPI, grafik tren bulanan, grafik kategori, dashboard |
| 65–75 | Giliran kamu |
| 75–90 | Tanya jawab |
| 90–97 | **Simpan ke Tableau Public bersama-sama** (wajib, di kelas) |
| 97–100 | Penutup dan PR |

## 1. Apa itu dashboard?

Dashboard adalah **satu halaman** yang menjawab pertanyaan rutin dengan cepat, seperti "bagaimana penjualan bulan ini?", dan bisa dijelajahi sendiri oleh pembacanya lewat filter. Query atau notebook cocok untuk **menemukan** jawaban; dashboard cocok untuk **memantau** dan **membagikan** jawaban itu.

Dashboard yang kita bangun di sesi 1–2, dibaca dari atas ke bawah:

| Posisi | Isi |
| --- | --- |
| Atas | Judul berisi kesimpulan utama · filter tanggal dan kategori |
| Baris KPI | Pendapatan · Jumlah pesanan · AOV · Margin % |
| Tengah | Tren pendapatan bulanan (garis) |
| Bawah | Pendapatan per kategori (batang horizontal) · grafik tambahan (PR) |

## 2. Data: 3 file CSV

Unduh ketiga file dari link Google Drive di grup kelas, lalu simpan dalam **satu folder**, misalnya `Documents/thelook-dashboard/`. Tableau menampilkan file lain di folder yang sama, sehingga relationship mudah dibuat.

| File | Satu baris = | Kolom |
| --- | --- | --- |
| `penjualan.csv` (fakta) | satu barang terjual | `order_item_id`, `order_id`, `user_id`, `product_id`, `order_date`, `sale_price`, `cost` |
| `produk.csv` (dimensi) | satu produk | `product_id`, `product_name`, `category`, `brand`, `department`, `retail_price` |
| `pelanggan.csv` (dimensi) | satu pelanggan | `user_id`, `age`, `age_band`, `gender`, `country`, `traffic_source` |

Data sudah **tanpa** barang `Cancelled`/`Returned` dan tanpa bulan berjalan. Angka untuk dicocokkan ada di `cek_cepat.txt`.

```
produk (1) ───< penjualan >─── (1) pelanggan
  product_id = product_id   user_id = user_id
```

## 3. Calculated field utama

| Field | Rumus Tableau |
| --- | --- |
| Pendapatan | `SUM([Sale Price])` |
| Jumlah Pesanan | `COUNTD([Order Id])` |
| AOV | `SUM([Sale Price]) / COUNTD([Order Id])` |

`COUNTD` = count distinct: satu pesanan bisa berisi banyak barang. **Cocokkan** kartu KPI dengan `cek_cepat.txt`.

## 4. Demo

Ikuti [panduan Tableau Public](panduan-tableau.md) langkah demi langkah bersama instruktur.

## 5. Giliran kamu (±10 menit)

Ubah judul kedua grafik menjadi **kalimat kesimpulan**. Contoh: "Pendapatan naik 9% dalam 12 bulan terakhir".

## 6. Simpan ke Tableau Public (di kelas, sebelum Zoom ditutup)

Tableau Public **tidak bisa menyimpan ke laptop**. Kalau aplikasinya ditutup tanpa disimpan, dashboard hilang. Kita simpan bersama-sama:

**File → Save to Tableau Public As...** → login → nama `TheLook Dashboard` → **Save**. Browser membuka dashboard-mu; salin link-nya.

Ketik `1` di chat Zoom setelah berhasil. Sesi 2 melanjutkan dashboard ini (**File → Open from Tableau Public**).

> **Dashboard hilang?** Instruktur membagikan dashboard cadangan (`.twbx`) di grup kelas.

## 7. PR (30–60 menit)

1. Tambahkan **2 grafik lagi**: per negara, per kelompok umur, per traffic source, atau Men vs Women. **Simpan lagi** ke Tableau Public.
2. Ambil **screenshot** dashboard (Windows: **Win + Shift + S**; Mac: **Cmd + Shift + 4**).
3. Buat repo **`thelook-tableau-dashboard`** ([PANDUAN_GITHUB.md](../../PANDUAN_GITHUB.md)), unggah `images/dashboard_v1.png`, dan tulis link Tableau Public di `README.md`.

## Ringkasan

- Dashboard = satu halaman untuk memantau dan membagikan jawaban.
- Tabel fakta + tabel dimensi, dihubungkan dengan relationship.
- Pesanan dihitung dengan `COUNTD`.
- Selalu cocokkan angka KPI dengan sumber lain.
- Tableau Public hanya menyimpan ke web: **simpan sebelum menutup aplikasi**.
