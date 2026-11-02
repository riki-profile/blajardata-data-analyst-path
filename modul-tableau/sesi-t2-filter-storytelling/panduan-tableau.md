# Panduan Tableau Public · Modul Tableau Sesi 2

Kembali ke [README sesi 2](README.md)

Buka dashboard sesi 1: **File → Open from Tableau Public**.

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
3. Pilih semua kartu KPI → **Layout** → samakan lebar dan tinggi.

Judul tetap deskriptif. Kesimpulan ditulis di dashboard Insight (bagian 4b).

## 4b. Dashboard Insight

1. **Duplikat sheet pendukung:** klik kanan tab `Tren Bulanan` → **Duplicate**, ganti nama `Insight Tren`. Lakukan juga untuk `Per Kategori` (→ `Insight Kategori`) dan satu sheet KPI.
2. **Lepaskan filter interaktif dari sheet Insight:** di sheet Dashboard mana pun, klik kanan filter tanggal → **Apply to Worksheets → Selected Worksheets...** → hilangkan centang sheet `Insight ...` → **OK**. Ulangi untuk filter kategori.
3. **Kunci periode di sheet Insight:** di setiap sheet `Insight ...`, seret **Order Date** ke **Filters** → **Range of dates** → isi periode 12 bulan terakhir yang lengkap → **OK**. Jangan tampilkan filternya.
4. **Dashboard → New Dashboard** → ganti nama `Insight`. Seret sheet `Insight ...` ke kanvas.
5. Objek **Text** di paling atas → tulis **headline**: kesimpulan + angka + periode. Judul sheet di dashboard ini boleh berupa kesimpulan, karena periodenya terkunci.
6. Objek **Text** di bawah → "Rekomendasi: ..." (1–2 kalimat).
7. Saat menyimpan ke Tableau Public, centang **Show sheets as tabs** supaya pembaca bisa berpindah antara Dashboard dan Insight.

> Dashboard Insight seperti laporan: angkanya untuk periode tertentu. Kalau data diperbarui, ubah periodenya dan tulis ulang headline.

## 5. Rapikan desain

- **Format → Workbook...** → pilih satu font untuk semua.
- Hapus garis grid yang tebal: klik kanan grafik → **Format** → **Lines**.
- Sembunyikan judul sumbu yang tidak perlu: klik kanan sumbu → hilangkan centang **Show Header** (atau edit judul sumbu).
- Pakai satu warna: kartu Marks → **Color** → pilih satu warna, kecuali untuk sorotan.

## 6. Simpan

- **File → Save to Tableau Public** (menimpa versi sesi 1, link tetap sama).
- Di halaman Tableau Public, klik **Edit Details** untuk menulis deskripsi singkat dashboard.
- Screenshot kedua dashboard → `images/dashboard_final.png` dan `images/insight.png`.
- Tulis link di `README.md` repo `thelook-tableau-dashboard`.
