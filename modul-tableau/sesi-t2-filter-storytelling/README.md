# Modul Tableau · Sesi 2 · Filter, Margin, Desain, dan Storytelling

**Durasi:** 1,5 jam (±100 menit) · Jadwal mengikuti kelas

| File | Fungsi |
| --- | --- |
| [panduan-tableau.md](panduan-tableau.md) | Filter, margin, dan desain di Tableau Public |
| [Template README Tableau](../template-portofolio/README.md) | README repo `thelook-tableau-dashboard` |

> **Dashboard sesi 1 hilang?** Unduh dashboard cadangan (`.twbx`) dari grup kelas, buka dengan **File → Open**, simpan ke akun Tableau Public-mu, lalu ikuti sesi ini seperti biasa.

## Tujuan sesi

Setelah sesi ini kamu bisa:

1. Menambahkan filter tanggal dan kategori yang memengaruhi seluruh dashboard.
2. Membuat calculated field **margin** dan **margin %**.
3. Merapikan dashboard dengan prinsip desain: hierarki, keselarasan, satu warna sorotan.
4. Mengubah dashboard menjadi **cerita satu halaman**: kesimpulan → bukti → rekomendasi.
5. Menulis README repo `thelook-tableau-dashboard`, hasil akhir modul Tableau.

## Agenda

| Menit | Bagian |
| --- | --- |
| 0–10 | Recap PR sesi 1: tunjukkan 2 grafik tambahanmu |
| 10–30 | Demo: filter tanggal dan kategori |
| 30–45 | Demo: calculated field margin dan margin % |
| 45–65 | Desain dan storytelling: sebelum vs sesudah |
| 65–75 | Giliran kamu: headline |
| 75–85 | README `thelook-tableau-dashboard`: tempel template, isi headline + link |
| 85–95 | Tanya jawab |
| 95–100 | Penutup dan PR |

## 1. Filter

| Filter | Jenis | Kenapa |
| --- | --- | --- |
| Tanggal (`Order Date`) | Range of dates | Pembaca bisa melihat periode tertentu |
| Kategori (`Category`) | Multiple values (dropdown) | Pembaca bisa fokus ke kategori tertentu |

Filter harus memengaruhi **semua** sheet: klik kanan filter → **Apply to Worksheets → All Using This Data Source**. Letakkan filter di **satu baris di atas**.

## 2. Margin

**Margin** = pendapatan − biaya pokok. **Margin %** = margin ÷ pendapatan.

| Field | Rumus Tableau |
| --- | --- |
| Margin | `SUM([Sale Price]) - SUM([Cost])` |
| Margin % | `(SUM([Sale Price]) - SUM([Cost])) / SUM([Sale Price])` |

Kategori dengan pendapatan terbesar belum tentu yang paling **menguntungkan**. Taruh Margin % di **Tooltip** grafik kategori, lalu bandingkan.

## 3. Prinsip desain dashboard

1. **Hierarki: yang paling penting di kiri atas.** Judul dan kesimpulan → KPI → tren → rincian.
2. **Judul halaman berisi kesimpulan**, bukan "Dashboard Penjualan".
3. **Satu warna utama, satu warna sorotan.**
4. **Sejajarkan dan beri jarak yang sama**; ukuran kartu KPI sama.
5. **Buang yang tidak perlu:** garis grid tebal, legend untuk grafik satu warna, desimal berlebihan.
6. **Satuan selalu jelas:** USD, %, jumlah pesanan.
7. **5 detik:** pesan utama harus terbaca dalam 5 detik.

## 4. Storytelling: dashboard satu halaman

| Bagian | Isi | Contoh |
| --- | --- | --- |
| **Headline** | Kesimpulan utama, 1 kalimat | "Pendapatan tumbuh 9%, didorong Outerwear dan Jeans" |
| **Bukti** | 3–4 visual yang mendukung headline | KPI, tren, kategori |
| **So what?** | Objek Text berisi rekomendasi | "Prioritaskan promosi kategori bermargin tinggi" |

## 5. Giliran kamu (±10 menit)

Tulis **headline** dashboard-mu (satu kalimat kesimpulan dengan angka) dan letakkan di paling atas.

## 6. PR (30–60 menit)

1. **Selesaikan dashboard:** filter, kartu Margin %, headline, kotak rekomendasi. **File → Save to Tableau Public** (link tetap sama).
2. Di halaman Tableau Public-mu: **Edit Details** → tulis deskripsi singkat dashboard.
3. Screenshot `images/dashboard_final.png`, unggah ke repo `thelook-tableau-dashboard`.
4. **Lengkapi README** dengan [template README Tableau](../template-portofolio/README.md): headline, link dashboard, isi dashboard, temuan, rekomendasi. README ini adalah hasil akhir modul Tableau.

## Ringkasan

- Filter di satu baris atas, berlaku untuk semua sheet.
- Pendapatan besar belum tentu margin besar.
- Judul berisi kesimpulan; satu warna sorotan; pesan utama terbaca dalam 5 detik.
- Cerita satu halaman: headline → bukti → rekomendasi.
- **Modul Tableau selesai.** Link Tableau Public + repo `thelook-tableau-dashboard` adalah portofolionya.
