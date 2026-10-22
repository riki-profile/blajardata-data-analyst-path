# Sesi 11 · Filter, Measure Margin, Desain, dan Storytelling di Power BI

**Kamis, 3 Desember 2026 · 20.00–21.40 WIB**

| File | Fungsi |
| --- | --- |
| [panduan-power-bi.md](panduan-power-bi.md) | Filter, margin, dan desain di Power BI |
| [Template README Power BI](../../template-portofolio/thelook-powerbi-dashboard/README.md) | README repo `thelook-powerbi-dashboard` |

> **Tidak punya dashboard sesi 10?** Unduh `thelook_dashboard_cadangan.pbix` dari grup kelas sebelum sesi dimulai, buka di Power BI Desktop, lalu ikuti sesi ini seperti biasa.

## Tujuan sesi

Setelah sesi ini kamu bisa:

1. Menambahkan filter tanggal dan kategori yang memengaruhi seluruh dashboard.
2. Membuat measure **margin** dan **margin %** dengan DAX.
3. Merapikan dashboard dengan prinsip desain: hierarki, keselarasan, satu warna sorotan.
4. Mengubah dashboard menjadi **cerita satu halaman**: kesimpulan → bukti → rekomendasi.
5. Menulis README repo `thelook-powerbi-dashboard`, hasil akhir modul Power BI.

## Agenda

| Waktu (WIB) | Bagian |
| --- | --- |
| 20.00–20.05 | Recap sesi 10 |
| 20.05–20.25 | Demo: filter tanggal dan kategori |
| 20.25–20.40 | Demo: measure margin dan margin % |
| 20.40–21.00 | Desain dan storytelling: sebelum vs sesudah |
| 21.00–21.10 | **Kerjakan bersama**: headline + kotak rekomendasi |
| 21.10–21.25 | **Unggah bersama**: dashboard final + README `thelook-powerbi-dashboard` |
| 21.25–21.35 | Tanya jawab + pengenalan studi kasus sesi 12 (jalur penuh) |
| 21.35–21.40 | Penutup |

## 1. Filter

| Filter | Jenis | Kenapa |
| --- | --- | --- |
| Tanggal (`order_date`) | Rentang (*slider*/*between*) | Pembaca bisa melihat periode tertentu, misalnya 12 bulan terakhir |
| Kategori (`category`) | Dropdown, bisa pilih beberapa | Pembaca bisa fokus ke kategori tertentu |
| *(opsional)* Negara | Dropdown | |

Filter harus memengaruhi **semua** grafik di halaman, dan diletakkan di **satu baris di atas**, supaya jelas cakupannya.

## 2. Margin

**Margin** = pendapatan − biaya pokok. **Margin %** = margin ÷ pendapatan.

| Measure | DAX |
| --- | --- |
| Margin | `Margin = SUM(penjualan[sale_price]) - SUM(penjualan[cost])` |
| Margin % | `Margin % = DIVIDE([Margin], [Pendapatan])` |

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

## 5. Kerjakan bersama (±10 menit)

Instruktur mengerjakannya langkah demi langkah di layar, dan kamu mengikuti di dashboard-mu:

1. Tulis **headline** dashboard (satu kalimat kesimpulan dengan angka) dan tempatkan di bagian paling atas.
2. Tambahkan **kotak rekomendasi** (1–2 kalimat) di bawah atau di samping grafik.

2–3 peserta membacakan headline-nya di Zoom.

## 6. Unggah bersama (di kelas)

Bersama instruktur, di repo `thelook-powerbi-dashboard`:

1. **Ctrl + S**, lalu **File → Export → Export to PDF**. Unggah ulang `dashboard/thelook_dashboard.pbix` dan `dashboard/thelook_dashboard.pdf` (nama sama, menimpa versi sesi 10).
2. Screenshot → unggah `images/dashboard_final.png`.
3. `README.md` → tempel [template README Power BI](../../template-portofolio/thelook-powerbi-dashboard/README.md) → isi headline, isi dashboard, 2 temuan dari dashboard, dan rekomendasi → **Commit changes**.

Di akhir sesi, **portofolio modul Power BI-mu selesai**.

*(Jalur penuh)* Pilih fokus untuk studi kasus sesi 12: department `Women` atau `Men`, dan (opsional) satu negara. Lihat [kasusnya](../sesi-12-studi-kasus/README.md#kasusnya).

## 7. Latihan mandiri (opsional)

Tidak wajib dan tidak dinilai. Rapikan desain lebih jauh (tema warna, perataan, tooltip), atau tambahkan halaman kedua untuk analisis pelanggan (kelompok umur, traffic source).

## Ringkasan

- Filter di satu baris atas, berlaku untuk semua visual.
- Margin menunjukkan keuntungan; pendapatan besar belum tentu margin besar.
- Judul berisi kesimpulan; satu warna sorotan; pesan utama terbaca dalam 5 detik.
- Cerita satu halaman: headline → bukti → rekomendasi.
- **Modul Power BI selesai.** Repo `thelook-powerbi-dashboard` dengan README-nya adalah portofolio modul ini.

**Sesi berikutnya (jalur penuh):** Sabtu, 5 Desember 2026, 14.00 WIB. Studi kasus terpandu: kategori mana yang diprioritaskan? **Siapkan login BigQuery dan Colab.**
