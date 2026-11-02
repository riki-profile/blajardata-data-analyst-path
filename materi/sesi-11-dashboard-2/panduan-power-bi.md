# Panduan Power BI Desktop · Sesi 11

Kembali ke [README sesi 11](README.md)

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

## 4. Halaman Insight

Halaman Dashboard tetap seperti sekarang (judul deskriptif, filter aktif). Kesimpulan ditulis di halaman kedua.

1. Klik kanan tab **Dashboard** di bawah → **Duplicate page**. Klik dua kali tab baru → ganti nama menjadi `Insight`.
2. Di halaman Insight, **hapus kedua slicer** (pilih → Delete). Hapus juga visual yang tidak mendukung kesimpulanmu; sisakan 2–3 visual.
3. **Kunci periodenya:** panel **Filters** → **Filters on this page** → seret `order_date` ke sana → **Filter type: Advanced filtering** → *is on or after* tanggal awal periode, **And** *is before* awal bulan berikutnya setelah data terakhir. Contoh: on or after `1/11/2025` and before `1/11/2026`.
4. Kalau angka di halaman Insight ikut berubah saat slicer di halaman Dashboard dipakai: **View → Sync slicers** → hilangkan centang halaman Insight.
5. **Insert → Text box** di bagian atas → tulis **headline**: kesimpulan + angka + periode, huruf besar dan tebal. Ambil angkanya dari kartu KPI di halaman ini.
6. Ganti judul setiap grafik di halaman ini menjadi kalimat kesimpulan (boleh, karena periodenya terkunci).
7. **Insert → Text box** di bawah/samping → "Rekomendasi: ..." (1–2 kalimat).

> Halaman Insight seperti laporan: angkanya untuk periode tertentu. Kalau data diperbarui, ubah periode filter dan tulis ulang headline-nya.

## 5. Rapikan desain

- **View → Gridlines** dan **Snap to grid** supaya visual sejajar.
- Pilih beberapa visual (Ctrl + klik) → **Format → Align** → **Align top**/**Distribute horizontally**.
- Tema sederhana: **View → Themes** → pilih tema dengan latar putih; atau atur warna data satu per satu.
- Matikan judul sumbu yang tidak perlu dan legend untuk grafik satu warna.
- **Format page → Canvas settings**: ukuran 16:9.

## 6. Simpan dan ekspor

- **File → Save** (`thelook_dashboard.pbix`).
- **File → Export → Export to PDF** → `thelook_dashboard.pdf`.
- Screenshot kedua halaman → `dashboard_final.png` (Dashboard) dan `insight.png` (Insight).

Unggah ke portofolio: `dashboard/thelook_dashboard.pbix`, `dashboard/thelook_dashboard.pdf`, `images/dashboard_final.png`, `images/insight.png`.

> File `.pbix` di atas 25 MB tidak bisa diunggah lewat browser GitHub. Kalau terlalu besar, unggah PDF dan screenshot saja, lalu tulis di `dashboard/README.md` bahwa file `.pbix` tersedia atas permintaan.
