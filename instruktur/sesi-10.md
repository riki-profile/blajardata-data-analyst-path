# Runsheet Sesi 10 · Dashboard Pertama di Power BI

**Selasa, 1 Desember 2026 · 20.00–21.40 WIB** · Materi: [materi/sesi-10-dashboard-1](../materi/sesi-10-dashboard-1/)

Sesi pertama **modul Power BI**. Yang hadir: peserta jalur penuh + peserta baru modul Power BI.

## Persiapan

- [ ] **Senin, 30 November:** jalankan `10_export_dashboard_data.ipynb`, unggah ketiga CSV ke **satu folder Google Drive** (akses: *Anyone with the link*), dan tambahkan file teks `cek_cepat.txt` berisi angka "Cek cepat" (pendapatan, jumlah pesanan, AOV). Bagikan link folder di grup kelas **sebelum** sesi.
- [ ] Buat dashboard lengkap sesi 10 sebagai cadangan, lalu mulai dari file kosong saat demo.
- [ ] **Siapkan `thelook_dashboard_cadangan.pbix`** untuk peserta yang dashboard-nya hilang (dibagikan setelah kelas). Data CSV ikut tersimpan di dalam `.pbix`, jadi file ini langsung bisa dibuka.
- [ ] Coba Power BI sekali di Windows berformat Indonesia untuk memastikan Langkah 0 (locale impor) cukup.
- [ ] **Peserta Mac:** pastikan mereka sudah menjalankan [panduan Parallels](../PANDUAN_MAC_PARALLELS.md) termasuk **uji grafik tanggal** sebelum kelas (tanyakan di grup hari Minggu/Senin). Peserta yang uji grafik tanggalnya gagal: arahkan ke installer 32-bit di panduan.
- [ ] Siapkan pesan sambutan untuk peserta baru modul Power BI.

## Runsheet

| Waktu | Bagian | Poin utama |
| --- | --- | --- |
| 20.00 | Recap & sambutan | Tutup modul Python singkat (1 README peserta). **Sambut peserta baru**: perkenalan di chat, tunjukkan KAMUS_DATA (tabel TheLook dan definisi pendapatan) |
| 20.10 | Apa itu dashboard + unduh data | Notebook/query = menemukan; dashboard = memantau dan membagikan. Semua peserta mengunduh 3 CSV dari link Drive ke satu folder |
| 20.20 | Muat data + relasi | Fakta vs dimensi; relasi = JOIN otomatis. **Locale impor dulu!** |
| 20.35 | Measure + KPI | Pendapatan, Jumlah Pesanan (distinct!), AOV. **Cocokkan dengan "Cek cepat"**: ketik 1 kalau angkanya sama |
| 20.45 | Grafik | Tren bulanan dan per kategori |
| 21.05 | **Kerjakan bersama** | Judul deskriptif (apa + satuan) untuk setiap grafik; ganti nama halaman jadi `Dashboard`; tambahkan grafik ketiga (pendapatan per negara). Jelaskan singkat kenapa bukan judul kesimpulan: filter mengubah angkanya |
| 21.15 | **Simpan bersama** | Save as `.pbix`, Export to PDF, screenshot. **Jangan lanjut** sampai mayoritas mengetik 1. Ini satu-satunya ketergantungan keras antar sesi di kursus ini |
| 21.22 | **Unggah bersama** | Buat repo `thelook-powerbi-dashboard`; unggah `.pbix`, PDF, `dashboard_v1.png` |
| 21.32 | Tanya jawab | Masalah instalasi/data, terutama peserta Mac |
| 21.38 | Penutup | Jalankan **checklist hasil** di bawah. Bagikan file dashboard cadangan di grup; latihan mandiri (opsional): grafik lain |

## Checklist hasil (cek sebelum penutup)

Jalankan **sebelum penutup** (2–3 menit): tampilkan daftar ini di layar, bacakan satu per satu, peserta mengetik `1` di chat kalau sudah. Yang belum: bantu sebentar, atau catat namanya untuk dibantu setelah kelas.

- [ ] 3 CSV terunduh dalam satu folder; relasi `produk`–`penjualan` dan `pelanggan`–`penjualan` benar
- [ ] Kartu KPI (Pendapatan, Jumlah Pesanan, AOV) **sama** dengan `cek_cepat.txt`
- [ ] 3 grafik (tren bulanan, per kategori, per negara) dengan **judul deskriptif**; halaman bernama `Dashboard`
- [ ] `thelook_dashboard.pbix` tersimpan di laptop
- [ ] Repo **`thelook-powerbi-dashboard`** berisi `dashboard/thelook_dashboard.pbix`, `dashboard/thelook_dashboard.pdf`, `images/dashboard_v1.png`

## Poin penting

- **Distinct count** untuk pesanan. Kesalahan paling umum: `Count of order_id` → angka barang, bukan pesanan.
- Relasi satu arah (produk/pelanggan → penjualan). Kalau peserta menghubungkan `produk` ke `pelanggan`, angka menjadi aneh.
- Cocokkan angka KPI dengan sumber lain. Kebiasaan ini mencegah dashboard yang salah sampai ke manajemen.
- **Dashboard ≠ laporan.** Peserta yang ikut sesi 8 sudah terbiasa dengan "judul = kesimpulan". Tegaskan: itu untuk grafik laporan yang angkanya tetap. Di dashboard, angka berubah mengikuti filter, jadi judulnya deskriptif. Kesimpulan ditulis di halaman Insight (sesi 11).
- Peserta baru modul Power BI belum pernah memakai SQL/Python di kelas ini. Hindari rujukan "seperti di sesi 3/8" tanpa penjelasan singkat; cukup katakan "relasi = cara menggabungkan tabel".

## Masalah yang sering muncul

Lihat tabel di [panduan Power BI](../materi/sesi-10-dashboard-1/panduan-power-bi.md#masalah-yang-sering-terjadi). Tambahan:

| Masalah | Solusi |
| --- | --- |
| Peserta Mac: Parallels belum terinstall | Minta menonton demo dulu dan menyelesaikan [panduan Parallels](../PANDUAN_MAC_PARALLELS.md) setelah kelas, lalu mengejar dengan rekaman + dashboard cadangan |
| Peserta Mac: grafik tanggal kosong/gagal dimuat | Masalah Power BI 64-bit di Windows ARM. Install ulang versi 32-bit (`PBIDesktopSetup.exe`), lihat langkah 4 panduan Parallels |
| Peserta Mac: lambat | Tutup aplikasi lain di Mac; di pengaturan Parallels, beri Windows lebih banyak RAM jika Mac punya 16 GB |
| Power BI tidak bisa diinstall (laptop kantor) | Minta izin IT, atau pakai laptop pribadi. Power BI versi web butuh akun kerja/sekolah dan tidak dipakai di kelas |
| Link Drive tidak bisa dibuka | Cek akses *Anyone with the link*; kirim ulang link |

## Untuk recap sesi 11 (5 menit)

- Tampilkan dashboard 1 peserta (dengan izin): KPI, relasi, judul deskriptif.
