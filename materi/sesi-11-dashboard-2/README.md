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
4. Membedakan **dashboard** (memantau) dan **halaman Insight** (melaporkan), lalu membuat halaman Insight: kesimpulan → bukti → rekomendasi.
5. Menulis README repo `thelook-powerbi-dashboard`, hasil akhir modul Power BI.

## Agenda

| Waktu (WIB) | Bagian |
| --- | --- |
| 20.00–20.05 | Recap sesi 10 |
| 20.05–20.25 | Demo: filter tanggal dan kategori |
| 20.25–20.40 | Demo: measure margin dan margin % |
| 20.40–21.00 | Desain dashboard; dashboard vs laporan; membuat halaman **Insight** |
| 21.00–21.10 | **Kerjakan bersama**: headline + rekomendasi di halaman Insight |
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

1. **Hierarki: yang paling penting di kiri atas.** Mata membaca seperti huruf Z: judul dan filter → KPI → tren → rincian.
2. **Judul deskriptif**: apa yang diukur + satuan ("Pendapatan bulanan (USD)"). Angka di dashboard berubah mengikuti filter, jadi judulnya tidak boleh berisi kesimpulan yang bisa menjadi salah.
3. **Satu warna utama, satu warna sorotan.** Warna lain hanya kalau punya arti.
4. **Sejajarkan dan beri jarak yang sama.** Pakai grid; ukuran kartu KPI sama.
5. **Buang yang tidak perlu:** garis bantu tebal, label sumbu ganda, legend untuk grafik satu warna, desimal berlebihan.
6. **Satuan selalu jelas:** USD, %, jumlah pesanan.
7. **5 detik:** orang yang baru melihat harus langsung tahu apa yang dipantau dan di mana angkanya.

## 4. Dashboard vs halaman Insight

Dashboard adalah **helicopter view**: pembaca memantau dan menjelajah sendiri dengan filter. Tapi manajemen juga butuh **kesimpulan** dari analis. Kesimpulan itu kita tulis di **halaman kedua** dalam file yang sama, bukan di atas dashboard.

| | Halaman **Dashboard** | Halaman **Insight** |
| --- | --- | --- |
| Tujuan | Memantau, menjelajah dengan filter | Menyampaikan satu kesimpulan + rekomendasi |
| Judul | Deskriptif: "Pendapatan bulanan (USD)" | Kesimpulan + angka + periode: "Pendapatan naik 9% (Nov 2025–Okt 2026)" |
| Filter | Aktif, pembaca yang memilih | Dikunci ke periode yang disebut di headline |
| Yang menyimpulkan | Pembaca | Analis (kamu) |
| Diperbarui | Otomatis saat data baru | Ditulis ulang saat data baru (seperti laporan) |

Isi halaman Insight:

| Bagian | Isi | Contoh |
| --- | --- | --- |
| **Headline** | Kesimpulan utama, 1 kalimat dengan angka **dan periodenya** | "Nov 2025–Okt 2026: pendapatan naik 9%, didorong Outerwear dan Jeans" |
| **Bukti** | 2–3 visual yang mendukung headline | tren bulanan, kategori, margin % |
| **So what?** | Kotak teks rekomendasi | "Prioritaskan promosi kategori bermargin tinggi" |

Cara membuatnya ada di [panduan Power BI bagian 4](panduan-power-bi.md#4-halaman-insight): duplikat halaman Dashboard, hapus filter interaktifnya, kunci periodenya, lalu tambahkan headline dan rekomendasi.

> Grafik di notebook sesi 8 memakai judul kesimpulan karena grafik itu juga **laporan**: angkanya tetap. Aturannya sama: **judul kesimpulan hanya untuk tampilan yang angkanya tidak berubah.**

## 5. Kerjakan bersama (±10 menit)

Instruktur mengerjakannya langkah demi langkah di layar, dan kamu mengikuti di dashboard-mu:

1. Buat halaman **Insight** (duplikat halaman Dashboard, hapus slicer, kunci periode).
2. Tulis **headline** di paling atas: satu kalimat kesimpulan dengan angka dan periodenya.
3. Tambahkan **kotak rekomendasi** (1–2 kalimat).

2–3 peserta membacakan headline-nya di Zoom.

## 6. Unggah bersama (di kelas)

Bersama instruktur, di repo `thelook-powerbi-dashboard`:

1. **Ctrl + S**, lalu **File → Export → Export to PDF** (PDF berisi kedua halaman). Unggah ulang `dashboard/thelook_dashboard.pbix` dan `dashboard/thelook_dashboard.pdf` (nama sama, menimpa versi sesi 10).
2. Screenshot kedua halaman → unggah `images/dashboard_final.png` (halaman Dashboard) dan `images/insight.png` (halaman Insight).
3. `README.md` → tempel [template README Power BI](../../template-portofolio/thelook-powerbi-dashboard/README.md) → isi headline dari halaman Insight, isi dashboard, 2 temuan, dan rekomendasi → **Commit changes**.

Di akhir sesi, **portofolio modul Power BI-mu selesai**.

*(Jalur penuh)* Pilih fokus untuk studi kasus sesi 12: department `Women` atau `Men`, dan (opsional) satu negara. Lihat [kasusnya](../sesi-12-studi-kasus/README.md#kasusnya).

## 7. Latihan mandiri (opsional)

Tidak wajib dan tidak dinilai. Rapikan desain lebih jauh (tema warna, perataan, tooltip), atau tambahkan halaman ketiga untuk analisis pelanggan (kelompok umur, traffic source).

## Checklist hasil (dicek bersama sebelum kelas ditutup)

Sebelum kelas ditutup, instruktur membacakan daftar ini satu per satu. Ketik `1` di chat kalau sudah, `2` kalau belum; yang belum akan dibantu. Kalau kamu absen, pakai daftar ini untuk mengecek hasilmu setelah menonton rekaman.

- [ ] Halaman **Dashboard**: slicer tanggal + kategori mengubah semua visual; kartu Margin % ada; judul deskriptif
- [ ] Halaman **Insight**: tanpa slicer, periode terkunci, headline berisi **kesimpulan + angka + periode**, 2–3 visual, kotak rekomendasi
- [ ] Uji: ubah slicer di halaman Dashboard → angka di halaman Insight **tidak** berubah
- [ ] Repo berisi `.pbix` + PDF **2 halaman** terbaru, `images/dashboard_final.png`, `images/insight.png`
- [ ] `README.md` repo `thelook-powerbi-dashboard` lengkap; headline sama dengan halaman Insight
- [ ] **Modul Power BI selesai**. Jalur penuh: fokus studi kasus sesi 12 sudah dipilih

## Ringkasan

- Filter di satu baris atas, berlaku untuk semua visual.
- Margin menunjukkan keuntungan; pendapatan besar belum tentu margin besar.
- Halaman Dashboard: judul deskriptif, filter aktif, satu warna sorotan.
- Halaman Insight: headline (kesimpulan + angka + periode) → bukti → rekomendasi, dengan periode terkunci.
- **Modul Power BI selesai.** Repo `thelook-powerbi-dashboard` dengan README-nya adalah portofolio modul ini.

**Sesi berikutnya (jalur penuh):** Sabtu, 5 Desember 2026, 14.00 WIB. Studi kasus terpandu: kategori mana yang diprioritaskan? **Siapkan login BigQuery dan Colab.**
