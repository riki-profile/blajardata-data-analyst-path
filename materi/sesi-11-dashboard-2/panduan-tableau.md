# Panduan Tableau Public · Sesi 11

Kembali ke [README sesi 11](README.md) · Panduan Power BI: [panduan-power-bi.md](panduan-power-bi.md)

Buka dashboard sesi 10: **File → Open from Tableau Public**.

## 1. Filter tanggal

1. Buka sheet `Tren Bulanan`. Seret **Order Date** ke kotak **Filters** → pilih **Range of Dates** → **OK**.
2. Klik kanan pil filter → **Show Filter**.
3. Klik kanan pil filter lagi → **Apply to Worksheets → All Using This Data Source**. Sekarang semua sheet ikut terfilter.

## 2. Filter kategori

1. Seret **Category** ke **Filters** → **Use all** → **OK**.
2. Klik kanan → **Show Filter**, lalu **Apply to Worksheets → All Using This Data Source**.
3. Di kartu filter (kanan), klik panah kecil → pilih **Multiple Values (dropdown)**.

## 3. Margin dan Margin %

**Analysis → Create Calculated Field...**

| Nama | Rumus |
| --- | --- |
| `Margin` | `SUM([Sale Price]) - SUM([Cost])` |
| `Margin %` | `(SUM([Sale Price]) - SUM([Cost])) / SUM([Sale Price])` |

Klik kanan **Margin %** → **Default Properties → Number Format → Percentage**, 1 desimal.

Buat sheet `KPI Margin` seperti kartu KPI lainnya.

**Latihan:** di sheet `Per Kategori`, seret **Margin %** ke **Tooltip** di kartu Marks. Kategori dengan pendapatan terbesar, apakah margin %-nya juga terbesar? Coba juga seret **Margin %** ke **Color**: batang dengan margin lebih tinggi menjadi lebih gelap.

## 4. Menyusun ulang dashboard

1. Buka dashboard → seret `KPI Margin` ke baris KPI.
2. Filter otomatis muncul di kanan. Pindahkan ke **atas**: seret kartu filter ke area di samping judul. Gunakan objek **Horizontal** untuk menyusunnya sebaris.
3. Ganti teks judul dengan **headline**.
4. Tambahkan objek **Text** berisi "Rekomendasi: ...".
5. Pilih semua kartu KPI → **Layout** → samakan lebar dan tinggi.

## 5. Rapikan desain

- **Format → Workbook...** → pilih satu font untuk semua.
- Hapus garis grid yang tebal: klik kanan grafik → **Format** → **Lines**.
- Sembunyikan judul sumbu yang tidak perlu: klik kanan sumbu → hilangkan centang **Show Header** (atau edit judul sumbu).
- Pakai satu warna: kartu Marks → **Color** → pilih satu warna, kecuali untuk sorotan.

## 6. Simpan

- **File → Save to Tableau Public** (menimpa versi sesi 10, link tetap sama).
- Di halaman Tableau Public, klik **Edit Details** untuk menulis deskripsi singkat dashboard.
- Screenshot → `images/dashboard_final.png`.
- Tulis link di `dashboard/README.md` portofoliomu.
