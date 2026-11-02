# Runsheet Modul Tableau · Sesi 1 · Dashboard Pertama

Materi: [sesi-t1-dashboard-pertama](../sesi-t1-dashboard-pertama/) · Durasi ±100 menit

## Persiapan

- [ ] **H-2:** jalankan [`10_export_dashboard_data.ipynb`](../../materi/sesi-10-dashboard-1/10_export_dashboard_data.ipynb), unggah 3 CSV + `cek_cepat.txt` (pendapatan, jumlah pesanan, AOV) ke satu folder Google Drive (*Anyone with the link*), bagikan link di grup.
- [ ] **H-2:** ingatkan peserta menginstall Tableau Public dan membuat akun Tableau Public.
- [ ] Buat dashboard lengkap sesi 1 sebagai cadangan, lalu mulai dari file kosong saat demo.
- [ ] **Siapkan dashboard cadangan:** publikasikan dashboard cadanganmu di Tableau Public dan aktifkan izin unduh workbook (**Settings → Allow access → Workbook downloads**). Peserta yang dashboard-nya hilang mengunduh `.twbx` lewat tombol **Download**, membukanya dengan **File → Open**, lalu menyimpannya ke akun mereka sendiri.

## Runsheet

| Menit | Bagian | Poin utama |
| --- | --- | --- |
| 0 | Pembukaan | Perkenalan, kode chat `1`/`2`/`?`, rekaman, ketik sendiri. Tunjukkan KAMUS_DATA sekilas |
| 10 | Dashboard + unduh data | Query/notebook = menemukan; dashboard = memantau dan membagikan. Semua mengunduh 3 CSV ke **satu folder** |
| 20 | Muat data + relationship | Connect → Text file. Seret produk & pelanggan ke kanvas, hubungkan **ke penjualan**. Cek ikon tipe data |
| 35 | Calculated field + KPI | Pendapatan, Jumlah Pesanan (`COUNTD`!), AOV. **Cocokkan dengan `cek_cepat.txt`**: ketik 1 kalau sama |
| 45 | Grafik | Tren bulanan (Month continuous, pil hijau); per kategori (sort descending) |
| 55 | Dashboard | New Dashboard, ukuran, susun sheet, objek Text untuk judul |
| 65 | **Kerjakan bersama** | Judul deskriptif (apa + satuan); ganti nama dashboard jadi `Dashboard`; grafik ketiga (pendapatan per negara). Jelaskan: filter mengubah angka, jadi kesimpulan ditaruh di dashboard Insight (sesi 2) |
| 75 | **Simpan bersama** | Save to Tableau Public As... + screenshot. **Jangan lanjut** sampai mayoritas mengetik 1 |
| 82 | **Unggah bersama** | Repo `thelook-tableau-dashboard`: screenshot + link di README |
| 92 | Tanya jawab | Masalah instalasi/data dengan berbagi layar |
| 98 | Penutup | Jalankan **checklist hasil** di bawah. Bagikan link dashboard cadangan; latihan mandiri (opsional) |

## Checklist hasil (cek sebelum penutup)

Jalankan **sebelum penutup** (2–3 menit): tampilkan daftar ini di layar, bacakan satu per satu, peserta mengetik `1` di chat kalau sudah. Yang belum: bantu sebentar, atau catat namanya untuk dibantu setelah kelas.

- [ ] 3 CSV dalam satu folder; relationship ke tabel `penjualan` benar
- [ ] Kartu KPI (Pendapatan, Jumlah Pesanan, AOV) **sama** dengan `cek_cepat.txt`
- [ ] 3 sheet grafik (tren bulanan, per kategori, per negara) dengan **judul deskriptif**; dashboard bernama `Dashboard`
- [ ] Workbook tersimpan di **Tableau Public** dan link-nya sudah disalin
- [ ] Repo **`thelook-tableau-dashboard`** berisi `images/dashboard_v1.png` dan link Tableau Public di `README.md`

## Poin penting

- **Tableau Public tidak bisa menyimpan ke laptop.** Ulangi berkali-kali; ini kehilangan data paling umum.
- `COUNTD([Order Id])`, bukan `SUM` atau `COUNT`.
- Relationship ke tabel fakta, bukan antar dimensi.
- Semua yang disimpan di Tableau Public **publik**. Aman untuk TheLook; ingatkan untuk tidak memakai data kantor di akun ini.

## Masalah yang sering muncul

Lihat tabel di [panduan Tableau](../sesi-t1-dashboard-pertama/panduan-tableau.md#masalah-yang-sering-terjadi). Tambahan:

| Masalah | Solusi |
| --- | --- |
| `produk.csv` tidak muncul di panel Files | File tidak satu folder dengan `penjualan.csv` |
| Angka harga aneh (`4999` untuk `49.99`) | Pengaturan region laptop memakai koma desimal. Ubah tipe kolom, atau ubah format region sistem ke English (US) sementara |
| Gagal login saat Save | Cek email verifikasi akun Tableau Public |
