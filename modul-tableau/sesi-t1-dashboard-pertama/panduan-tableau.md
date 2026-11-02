# Panduan Tableau Public · Modul Tableau Sesi 1

Kembali ke [README sesi 1](README.md)

Siapkan 3 file CSV (`penjualan.csv`, `produk.csv`, `pelanggan.csv`, dari link Google Drive di grup kelas) dalam **satu folder**, misalnya `Documents/thelook-dashboard/`.

> Tableau Public hanya bisa menyimpan dashboard ke **web** (profil Tableau Public-mu), tidak ke laptop, dan semua yang disimpan bersifat **publik**. Ini tidak masalah, karena TheLook adalah data publik dan link publik itulah yang kita pasang di portofolio.

## Langkah 1. Memuat data dan membuat relasi

1. Buka Tableau Public → di panel **Connect**, pilih **Text file** → pilih `penjualan.csv`.
2. Halaman **Data Source** terbuka dan `penjualan.csv` sudah ada di kanvas.
3. Di panel kiri, bagian **Files**, terlihat `produk.csv` dan `pelanggan.csv` (karena satu folder). Seret `produk.csv` ke kanvas, di sebelah kanan `penjualan.csv`. Akan muncul garis penghubung (*noodle*) dan dialog relasi.
4. Pastikan relasinya **Product Id = Product Id**. Kalau Tableau memilih kolom lain, klik nama kolomnya dan ganti.
5. Seret `pelanggan.csv` ke kanvas dan hubungkan **ke `penjualan`** (bukan ke `produk`) dengan **User Id = User Id**.

## Langkah 2. Cek tipe data

Di tabel pratinjau di bawah kanvas, lihat ikon di atas setiap kolom:

| Kolom | Ikon yang benar |
| --- | --- |
| `Order Date` | kalender (Date) |
| `Sale Price`, `Cost`, `Retail Price` | `#` (Number decimal) |
| `Category`, `Brand`, `Country`, dll. | `Abc` (String) |

Kalau salah, klik ikonnya dan pilih tipe yang benar. Kalau angka harga terlihat aneh (misalnya `4999` untuk `49.99`), tanyakan di kelas: biasanya karena pengaturan region di laptop.

## Langkah 3. Calculated field

Klik **Sheet 1** di bawah. Lalu **Analysis → Create Calculated Field...** untuk setiap field berikut:

| Nama | Rumus |
| --- | --- |
| `Pendapatan` | `SUM([Sale Price])` |
| `Jumlah Pesanan` | `COUNTD([Order Id])` |
| `AOV` | `SUM([Sale Price]) / COUNTD([Order Id])` |

`COUNTD` = count distinct, sama seperti `COUNT(DISTINCT order_id)` di SQL.

Atur format angka: di panel **Data**, klik kanan field → **Default Properties → Number Format...** → **Currency (Custom)**, desimal `0` untuk Pendapatan dan `2` untuk AOV.

## Langkah 4. Kartu KPI (satu sheet per KPI)

1. Seret **Pendapatan** ke kotak **Text** di kartu **Marks**.
2. Klik **Text** → **...** → atur ukuran huruf besar (misalnya 28, tebal), lalu tambahkan baris kecil "Pendapatan" di atas angkanya.
3. Ganti nama sheet (klik kanan tab di bawah → **Rename**) menjadi `KPI Pendapatan`.
4. Buat sheet baru (ikon di samping tab) untuk **Jumlah Pesanan** dan **AOV**.
5. **Cocokkan angkanya** dengan angka di `cek_cepat.txt` (folder Google Drive yang sama dengan CSV).

## Langkah 5. Grafik tren pendapatan bulanan

1. Sheet baru. Seret **Order Date** ke **Columns**.
2. Klik kanan pil **YEAR(Order Date)** → pilih **Month** di kelompok **kedua** (yang contohnya seperti "May 2015"). Pilnya berubah hijau (*continuous*).
3. Seret **Pendapatan** ke **Rows**.
4. Ganti nama sheet: `Tren Bulanan`.

## Langkah 6. Grafik pendapatan per kategori

1. Sheet baru. Seret **Category** ke **Rows** dan **Pendapatan** ke **Columns**.
2. Klik ikon **Sort Descending** di toolbar atas.
3. Klik **Label** di kartu Marks → centang **Show mark labels**.
4. Ganti nama sheet: `Per Kategori`.

## Langkah 7. Menyusun dashboard

1. **Dashboard → New Dashboard**.
2. Di panel kiri, **Size**: pilih **Fixed size**, 1200 × 900, atau **Automatic**.
3. Seret ketiga sheet KPI ke bagian atas, `Tren Bulanan` di tengah, `Per Kategori` di bawah.
4. Seret objek **Text** (panel kiri bawah, **Objects**) ke paling atas untuk judul: "TheLook: Ringkasan Penjualan".
5. Beri setiap sheet **judul deskriptif** (apa yang diukur + satuan, misalnya "Pendapatan bulanan (USD)"): klik dua kali judul sheet → ketik. Jangan menulis kesimpulan di dashboard ini, karena angkanya berubah mengikuti filter.
6. Ganti nama dashboard: klik kanan tab **Dashboard 1** → **Rename** → `Dashboard`.

## Langkah 8. Simpan ke Tableau Public (dilakukan bersama di akhir kelas)

1. **File → Save to Tableau Public As...** → login (buat akun gratis jika belum).
2. Beri nama `TheLook Dashboard` → **Save**. Browser akan membuka dashboard-mu.
3. Salin link dari address bar, untuk portofolio.
4. Untuk melanjutkan nanti: **File → Open from Tableau Public**.

## Masalah yang sering terjadi

| Masalah | Solusi |
| --- | --- |
| Semua kategori menunjukkan angka yang sama | Relasi salah. Kembali ke **Data Source**, klik garis relasi, cek kolom yang dicocokkan |
| `Jumlah Pesanan` terlalu besar | Kamu memakai `SUM([Order Id])` atau `COUNT`. Harus `COUNTD([Order Id])` |
| Garis tren hanya beberapa titik per tahun | Order Date masih level YEAR. Pilih **Month** continuous (Langkah 5) |
| Tidak bisa Save ke laptop | Memang begitu di Tableau Public; simpan ke web (Langkah 8) |
