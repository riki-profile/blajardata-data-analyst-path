# Panduan Power BI Desktop · Sesi 10

Kembali ke [README sesi 10](README.md) · Panduan Tableau: [panduan-tableau.md](panduan-tableau.md)

Siapkan 3 file CSV (`penjualan.csv`, `produk.csv`, `pelanggan.csv`) dalam satu folder, misalnya `Documents\thelook-dashboard\`.

## Langkah 0. Atur locale impor (penting untuk laptop berbahasa Indonesia)

File CSV kita memakai **titik** sebagai pemisah desimal (`49.99`). Kalau Windows-mu memakai format Indonesia (koma sebagai desimal), Power BI bisa membaca `49.99` sebagai `4999` atau sebagai teks.

1. Buka Power BI Desktop → **Blank report**.
2. **File → Options and settings → Options**.
3. Di bagian **CURRENT FILE** → **Regional Settings** → **Locale for import**: pilih **English (United States)** → **OK**.

Lakukan ini **sebelum** memuat data.

## Langkah 1. Memuat data

1. **Home → Get data → Text/CSV** → pilih `penjualan.csv` → **Open**.
2. Di jendela pratinjau, klik **Transform Data** (bukan Load) untuk mengecek tipe data di Power Query.
3. Pastikan ikon di judul kolom sesuai. Klik ikonnya untuk mengubah:

   | Kolom | Tipe |
   | --- | --- |
   | `order_item_id`, `order_id`, `user_id`, `product_id` | Whole Number (`123`) |
   | `order_date` | Date (ikon kalender) |
   | `sale_price`, `cost` | Decimal Number (`1.2`) |

4. Tambahkan dua file lain tanpa menutup Power Query: **Home → New Source → Text/CSV** → `produk.csv`, lalu `pelanggan.csv`. Cek tipe datanya (`retail_price` = Decimal Number, `age` = Whole Number).
5. **Home → Close & Apply**.

## Langkah 2. Relasi

1. Klik ikon **Model view** di panel kiri (ikon ketiga, bergambar tabel-tabel yang terhubung).
2. Power BI biasanya membuat relasi otomatis karena nama kolomnya sama. Pastikan ada dua garis:
   - `produk[product_id]` **1 ── \*** `penjualan[product_id]`
   - `pelanggan[user_id]` **1 ── \*** `penjualan[user_id]`
3. Kalau belum ada: seret `product_id` dari tabel `produk` ke `product_id` di tabel `penjualan`. Di dialog yang muncul, pastikan **Cardinality: Many to one (\*:1)** dan **Cross filter direction: Single** → **OK**.
4. Kalau ada relasi lain yang salah (misalnya antara `produk` dan `pelanggan`), klik kanan garisnya → **Delete**.

## Langkah 3. Measure

Kembali ke **Report view** (ikon pertama di panel kiri). Di panel **Data** sebelah kanan, klik kanan tabel `penjualan` → **New measure**, lalu ketik satu per satu (tekan Enter setiap selesai):

```dax
Pendapatan = SUM(penjualan[sale_price])
```

```dax
Jumlah Pesanan = DISTINCTCOUNT(penjualan[order_id])
```

```dax
AOV = DIVIDE([Pendapatan], [Jumlah Pesanan])
```

`DIVIDE` lebih aman daripada `/` karena tidak error jika pembaginya nol.

Atur format: klik measure di panel Data → tab **Measure tools** → **Format: Currency**, desimal `0` untuk Pendapatan dan `2` untuk AOV.

Tambahkan juga **kolom** untuk bulan, supaya grafik tren rapi: klik kanan `penjualan` → **New column**:

```dax
Bulan = DATE(YEAR(penjualan[order_date]), MONTH(penjualan[order_date]), 1)
```

Lalu di **Column tools**, ubah **Format** menjadi `mmm yyyy`.

## Langkah 4. Kartu KPI

1. Klik area kosong di kanvas. Di panel **Visualizations**, pilih **Card**.
2. Seret measure **Pendapatan** ke kotak **Fields**.
3. Ulangi untuk **Jumlah Pesanan** dan **AOV**. Susun ketiga kartu berjajar di bagian atas.
4. **Cocokkan angkanya** dengan bagian "Cek cepat" di notebook ekspor.

## Langkah 5. Grafik tren pendapatan bulanan

1. Klik area kosong → **Line chart**.
2. **X-axis:** `penjualan[Bulan]`. Kalau muncul *Date Hierarchy* (Year, Quarter, Month, Day), klik panah kecil di samping field → pilih **Bulan**.
3. **Y-axis:** measure **Pendapatan**.
4. Di **Format visual → Visual → X-axis**, pastikan **Type: Continuous**.

## Langkah 6. Grafik pendapatan per kategori

1. Klik area kosong → **Clustered bar chart** (batang horizontal).
2. **Y-axis:** `produk[category]`; **X-axis:** **Pendapatan**.
3. Klik **...** (More options) di pojok grafik → **Sort axis → Pendapatan**, lalu **Sort descending**.
4. **Format visual → Visual → Data labels: On**.

## Langkah 7. Judul dan rapikan

1. Untuk setiap grafik: **Format visual → General → Title → Text**. Tulis kesimpulan, bukan sekadar nama grafik.
2. Tambahkan judul halaman: **Insert → Text box** → "TheLook: Ringkasan Penjualan".
3. Pakai satu warna untuk semua batang/garis: **Format visual → Visual → Bars/Lines → Colors**.

## Langkah 8. Simpan

- **File → Save as** → `thelook_dashboard.pbix`.
- **File → Export → Export to PDF** untuk portofolio.

## Masalah yang sering terjadi

| Masalah | Solusi |
| --- | --- |
| Angka pendapatan 100x terlalu besar | Locale impor salah. Ulangi Langkah 0, lalu **Home → Transform data** → hapus langkah **Changed Type** di *Applied Steps* → atur ulang tipe data |
| Semua batang kategori sama panjang (= total) | Relasi belum ada atau salah arah. Cek Langkah 2 |
| Kartu menampilkan "Count of order_id" | Kamu menyeret kolom, bukan measure. Pakai measure **Jumlah Pesanan** (ikon kalkulator) |
| Garis tren hanya 4 titik (per kuartal) | Hierarki tanggal aktif. Pilih field **Bulan** tanpa hierarki (Langkah 5) |
