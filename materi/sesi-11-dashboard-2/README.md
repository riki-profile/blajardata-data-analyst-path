# Sesi 11 · Filter, Calculated Field, Desain, dan Storytelling

**Kamis, 3 Desember 2026 · 20.00–21.40 WIB**

| File | Fungsi |
| --- | --- |
| [panduan-power-bi.md](panduan-power-bi.md) | Filter, margin, dan desain di Power BI |
| [panduan-tableau.md](panduan-tableau.md) | Filter, margin, dan desain di Tableau |
| [Template README portofolio](../../template-portofolio/thelook-analysis/README.md) | Untuk PR: draf README |

## Tujuan sesi

Setelah sesi ini kamu bisa:

1. Menambahkan filter tanggal dan kategori yang memengaruhi seluruh dashboard.
2. Membuat calculated field **margin** dan **margin %**.
3. Merapikan dashboard dengan prinsip desain: hierarki, keselarasan, satu warna sorotan.
4. Mengubah dashboard menjadi **cerita satu halaman**: kesimpulan → bukti → rekomendasi.
5. Memilih pertanyaan analisis mandiri dan membuat draf README portofolio.

## Agenda

| Waktu (WIB) | Bagian |
| --- | --- |
| 20.00–20.10 | Recap PR sesi 10: tunjukkan 2 grafik tambahanmu |
| 20.10–20.30 | Demo: filter tanggal dan kategori |
| 20.30–20.45 | Demo: calculated field margin dan margin % |
| 20.45–21.05 | Desain dan storytelling: sebelum vs sesudah |
| 21.05–21.15 | Giliran kamu |
| 21.15–21.35 | Tanya jawab + memilih pertanyaan analisis mandiri |
| 21.35–21.40 | Penutup dan PR |

## 1. Filter

| Filter | Jenis | Kenapa |
| --- | --- | --- |
| Tanggal (`order_date`) | Rentang (*slider*/*between*) | Pembaca bisa melihat periode tertentu, misalnya 12 bulan terakhir |
| Kategori (`category`) | Dropdown, bisa pilih beberapa | Pembaca bisa fokus ke kategori tertentu |
| *(opsional)* Negara | Dropdown | |

Filter harus memengaruhi **semua** grafik di halaman, dan diletakkan di **satu baris di atas**, supaya jelas cakupannya.

## 2. Margin

**Margin** = pendapatan − biaya pokok. **Margin %** = margin ÷ pendapatan.

| | Power BI (DAX) | Tableau |
| --- | --- | --- |
| Margin | `Margin = SUM(penjualan[sale_price]) - SUM(penjualan[cost])` | `SUM([Sale Price]) - SUM([Cost])` |
| Margin % | `Margin % = DIVIDE([Margin], [Pendapatan])` | `(SUM([Sale Price]) - SUM([Cost])) / SUM([Sale Price])` |

Kenapa margin penting? Kategori dengan pendapatan terbesar belum tentu yang paling **menguntungkan**. Bandingkan urutan kategori berdasarkan pendapatan dengan urutan berdasarkan margin %.

## 3. Prinsip desain dashboard

1. **Hierarki: yang paling penting di kiri atas.** Mata membaca seperti huruf Z: judul dan kesimpulan → KPI → tren → rincian.
2. **Judul halaman berisi kesimpulan**, bukan "Dashboard Penjualan". Contoh: "Pendapatan tumbuh 9%, didorong Outerwear dan Jeans; margin stabil di 52%".
3. **Satu warna utama, satu warna sorotan.** Warna lain hanya kalau punya arti.
4. **Sejajarkan dan beri jarak yang sama.** Pakai grid; ukuran kartu KPI sama.
5. **Buang yang tidak perlu:** garis bantu tebal, label sumbu ganda, legend untuk grafik satu warna, desimal berlebihan.
6. **Satuan selalu jelas:** USD, %, jumlah pesanan.
7. **5 detik:** orang yang baru melihat harus bisa menyebut pesan utamanya dalam 5 detik.

## 4. Storytelling: dashboard satu halaman

Ubah dashboard dari "kumpulan grafik" menjadi **cerita**:

| Bagian | Isi | Contoh |
| --- | --- | --- |
| **Headline** | Kesimpulan utama, 1 kalimat | "Pendapatan tumbuh, tapi hanya sedikit pelanggan yang kembali berbelanja" |
| **Bukti** | 3–4 visual yang mendukung headline | KPI, tren, kategori, segmen |
| **So what?** | Kotak teks rekomendasi | "Fokus ke program pembelian kedua untuk pelanggan baru" |

## 5. Giliran kamu (±10 menit)

Tulis **headline** dashboard-mu (satu kalimat kesimpulan) dan tempatkan di bagian paling atas. Bacakan di Zoom jika diminta.

## 6. PR (30–60 menit)

1. **Selesaikan dashboard:** filter tanggal dan kategori, kartu Margin %, headline, kotak rekomendasi.
2. Simpan versi final (Tableau Public / `.pbix` + PDF) dan screenshot ke `images/dashboard_final.png`.
3. **Pilih pertanyaan analisis mandirimu** untuk sesi 12. Lihat [daftar ide di sesi 12](../sesi-12-analisis-mandiri/README.md#ide-pertanyaan). Kirim pertanyaanmu ke grup kelas **paling lambat Jumat, 4 Desember pukul 20.00 WIB** supaya instruktur bisa memberi masukan.
4. **Draf README portofolio:** salin [template README](../../template-portofolio/thelook-analysis/README.md) ke `README.md` repo `thelook-analysis`-mu, lalu isi bagian Ringkasan, Pertanyaan bisnis, Data & metode, dan Dashboard. Bagian Temuan boleh memakai draf PR sesi 9.

## Ringkasan

- Filter di satu baris atas, berlaku untuk semua visual.
- Margin menunjukkan keuntungan; pendapatan besar belum tentu margin besar.
- Judul berisi kesimpulan; satu warna sorotan; pesan utama terbaca dalam 5 detik.
- Cerita satu halaman: headline → bukti → rekomendasi.

**Sesi berikutnya:** Sabtu, 5 Desember 2026, 14.00 WIB. Analisis mandiri dengan konsultasi satu-satu. **Bawa pertanyaanmu.**
