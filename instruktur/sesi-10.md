# Runsheet Sesi 10 · Dashboard Pertama

**Selasa, 1 Desember 2026 · 20.00–21.40 WIB** · Materi: [materi/sesi-10-dashboard-1](../materi/sesi-10-dashboard-1/)

## Persiapan

- [ ] Tools kelas sudah diputuskan (lihat [README instruktur](README.md#timeline-persiapan-sebelum-kelas)) dan diumumkan.
- [ ] Jalankan `10_export_dashboard_data.ipynb`, simpan ketiga CSV, catat angka "Cek cepat".
- [ ] Buat dashboard lengkap sesi 10 sebagai cadangan, lalu mulai dari file kosong saat demo.
- [ ] **Power BI:** coba sekali di Windows berbahasa/berformat Indonesia untuk memastikan Langkah 0 (locale) cukup.
- [ ] Siapkan ketiga CSV di Google Drive sebagai cadangan, untuk peserta yang notebook ekspornya gagal.

## Runsheet

| Waktu | Bagian | Poin utama |
| --- | --- | --- |
| 20.00 | Recap PR sesi 9 | 2 temuan terbaik |
| 20.10 | Apa itu dashboard | Notebook = menemukan; dashboard = memantau dan membagikan. Tunjukkan sketsa layout di README |
| 20.15 | Ekspor data | Semua peserta menjalankan notebook ekspor dan menyimpan 3 CSV dalam satu folder |
| 20.20 | Muat data + relasi | Fakta vs dimensi; relasi = JOIN otomatis. **Power BI:** locale impor dulu! |
| 20.35 | Measure + KPI | Pendapatan, Jumlah Pesanan (distinct!), AOV. **Cocokkan dengan "Cek cepat"**: ketik 1 kalau angkanya sama |
| 20.45 | Grafik | Tren bulanan dan per kategori, membangun ulang grafik sesi 8 |
| 21.00 | Judul | Ubah judul menjadi kesimpulan |
| 21.05 | Giliran kamu | |
| 21.15 | Tanya jawab | Sediakan waktu untuk berbagi layar masalah instalasi/data |
| 21.35 | Penutup | PR: 2 grafik tambahan, simpan, screenshot, unggah |

## Poin penting

- **Distinct count** untuk pesanan. Kesalahan paling umum: `Count of order_id` → angka barang, bukan pesanan.
- Relasi satu arah (produk/pelanggan → penjualan). Kalau peserta menghubungkan `produk` ke `pelanggan`, angka menjadi aneh.
- Cocokkan angka KPI dengan sumber lain. Kebiasaan ini mencegah dashboard yang salah sampai ke manajemen.

## Masalah yang sering muncul

Lihat tabel di [panduan Power BI](../materi/sesi-10-dashboard-1/panduan-power-bi.md#masalah-yang-sering-terjadi) dan [panduan Tableau](../materi/sesi-10-dashboard-1/panduan-tableau.md#masalah-yang-sering-terjadi). Tambahan:

| Masalah | Solusi |
| --- | --- |
| Peserta Mac di kelas Power BI | Arahkan ke Tableau Public dengan panduan Tableau; bantu di sesi tanya jawab |
| Power BI tidak bisa diinstall (laptop kantor) | Pakai Tableau Public, atau Power BI versi web (butuh akun kerja/sekolah) |
| CSV gagal terunduh dari Colab | Bagikan CSV cadangan dari Google Drive |

## Untuk recap sesi 11

- Minta 2 peserta menunjukkan grafik tambahannya (berbagi layar 1 menit masing-masing).
