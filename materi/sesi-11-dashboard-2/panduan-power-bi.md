# Panduan Power BI Desktop · Sesi 11

Kembali ke [README sesi 11](README.md) · Panduan Tableau: [panduan-tableau.md](panduan-tableau.md)

Buka `thelook_dashboard.pbix` dari sesi 10.

## 1. Filter tanggal (slicer)

1. Klik area kosong → **Visualizations → Slicer**.
2. Seret `penjualan[order_date]` ke **Field**.
3. Di **Format visual → Visual → Slicer settings → Options → Style**, pilih **Between**. Muncul slider rentang tanggal.
4. Letakkan di kanan atas.

## 2. Filter kategori

1. Slicer baru → seret `produk[category]`.
2. **Slicer settings → Options → Style: Dropdown**. Aktifkan **Multi-select with Ctrl** atau **Show "Select all" option**.
3. Letakkan di samping filter tanggal.

Uji: pilih satu kategori. Semua kartu dan grafik harus berubah. Kalau ada visual yang tidak berubah, cek relasinya di Model view.

> Ingin satu grafik tidak terpengaruh filter? Pilih slicer → **Format → Edit interactions** → klik ikon ⊘ di atas grafik itu.

## 3. Margin dan Margin %

Klik kanan tabel `penjualan` → **New measure**:

```dax
Margin = SUM(penjualan[sale_price]) - SUM(penjualan[cost])
```

```dax
Margin % = DIVIDE([Margin], [Pendapatan])
```

Pilih **Margin %** → **Measure tools → Format: Percentage**, 1 desimal.

Tambahkan **Card** untuk Margin % di samping kartu KPI lain.

**Latihan:** di grafik per kategori, tambahkan **Margin %** ke **Tooltips**. Arahkan mouse ke batang: kategori dengan pendapatan terbesar, apakah margin %-nya juga terbesar?

## 4. Headline dan rekomendasi

1. **Insert → Text box** di bagian atas → tulis headline (huruf besar, tebal).
2. **Insert → Text box** di bawah/samping → "Rekomendasi: ..." (1–2 kalimat).

## 5. Rapikan desain

- **View → Gridlines** dan **Snap to grid** supaya visual sejajar.
- Pilih beberapa visual (Ctrl + klik) → **Format → Align** → **Align top**/**Distribute horizontally**.
- Tema sederhana: **View → Themes** → pilih tema dengan latar putih; atau atur warna data satu per satu.
- Matikan judul sumbu yang tidak perlu dan legend untuk grafik satu warna.
- **Format page → Canvas settings**: ukuran 16:9.

## 6. Simpan dan ekspor

- **File → Save** (`thelook_dashboard.pbix`).
- **File → Export → Export to PDF** → `thelook_dashboard.pdf`.
- Screenshot → `dashboard_final.png`.

Unggah ke portofolio: `dashboard/thelook_dashboard.pbix`, `dashboard/thelook_dashboard.pdf`, `images/dashboard_final.png`.

> File `.pbix` di atas 25 MB tidak bisa diunggah lewat browser GitHub. Kalau terlalu besar, unggah PDF dan screenshot saja, lalu tulis di `dashboard/README.md` bahwa file `.pbix` tersedia atas permintaan.
