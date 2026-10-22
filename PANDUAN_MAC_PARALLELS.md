# Power BI di Mac lewat Parallels (Free Trial)

Power BI Desktop hanya tersedia untuk Windows. Di Mac, kita menjalankan **Windows 11 di dalam Mac** dengan **Parallels Desktop**, yang bisa dicoba gratis selama **14 hari**.

> Kerjakan panduan ini **sebelum sesi 10**, idealnya hari **Minggu, 29 November 2026**. Proses lengkapnya 1–2 jam (sebagian besar menunggu unduhan). Jangan menunggu sampai hari kelas.

## Sebelum mulai

| Kebutuhan | Minimal |
| --- | --- |
| Mac | Apple silicon (M1–M4) atau Intel, dengan macOS versi yang didukung Parallels (cek di halaman unduhan) |
| RAM | 8 GB (16 GB lebih lancar) |
| Ruang disk kosong | ±40 GB |
| Internet | Stabil; Windows 11 yang diunduh berukuran beberapa GB |

**Kapan mulai trial?** Trial berlaku 14 hari sejak diaktifkan. Kalau dimulai **29 November**, trial berakhir sekitar **13 Desember**: cukup untuk sesi 10–11 (1 dan 3 Desember), sesi 13 (8 Desember), dan mengunggah hasil akhir. Mulai lebih awal berarti trial habis lebih cepat.

## Langkah 1. Install Parallels Desktop

1. Buka [parallels.com/products/desktop/download](https://www.parallels.com/products/desktop/download/) → unduh **Parallels Desktop** (trial).
2. Buka file unduhan dan ikuti instalasinya. Izinkan akses yang diminta macOS.
3. Saat diminta, buat atau masuk ke **akun Parallels** untuk mengaktifkan trial 14 hari.

## Langkah 2. Install Windows 11

1. Di **Installation Assistant** Parallels, pilih **Get Windows 11 from Microsoft** → **Install Windows**.
   Parallels mengunduh versi Windows yang tepat secara otomatis (di Mac Apple silicon: Windows 11 untuk ARM).
2. Tunggu sampai selesai. Unduhan dan instalasi bisa memakan 30–60 menit.
3. **Product key tidak diperlukan.** Windows tanpa aktivasi tetap bisa dipakai, hanya ada tanda air dan beberapa pengaturan tampilan terkunci.
4. Setelah Windows terbuka: **Start → Settings → Windows Update → Check for updates**, install semua pembaruan, lalu restart Windows.

## Langkah 3. Install Power BI Desktop (di dalam Windows)

1. Di Windows, buka **Microsoft Store** → cari **Power BI Desktop** → **Install**.
   Atau unduh dari [halaman unduhan Microsoft](https://www.microsoft.com/download/details.aspx?id=58494) → **Download** → pilih file **`PBIDesktopSetup_x64.exe`** (64-bit).
2. Buka Power BI Desktop sekali untuk memastikan berhasil.

## Langkah 4. Uji grafik tanggal (wajib)

Ada laporan pengguna bahwa di Windows ARM lewat Parallels, **visual yang memakai kolom tanggal bisa gagal dimuat** di Power BI versi 64-bit. Dashboard kita memakai grafik tren bulanan, jadi uji dulu:

1. Di Power BI Desktop: **Home → Enter data** → buat tabel kecil dua kolom: `tanggal` (isi 3 tanggal, misalnya `2026-01-01`, `2026-02-01`, `2026-03-01`) dan `nilai` (isi 3 angka) → **Load**.
2. Buat **Line chart**: X-axis = `tanggal`, Y-axis = `nilai`.
3. **Grafik muncul** → aman, lanjut ke sesi 10.
4. **Grafik gagal dimuat / kosong / error** → uninstall Power BI Desktop, lalu install versi **32-bit**: dari [halaman unduhan Microsoft](https://www.microsoft.com/download/details.aspx?id=58494), pilih file **`PBIDesktopSetup.exe`** (tanpa `_x64`). Ulangi uji ini.
5. Masih gagal? Kirim screenshot ke grup kelas sebelum sesi 10.

## Tips selama kelas

- **Kerjakan semuanya di dalam Windows**: unduh 3 file CSV, buka Power BI, simpan `.pbix`, ekspor PDF, ambil screenshot, dan unggah ke GitHub, semuanya lewat browser di Windows. Ini menghindari kebingungan folder antara Mac dan Windows.
- Saat Zoom berbagi layar: jalankan Zoom di Mac seperti biasa, lalu bagikan jendela Parallels.
- Kalau Mac terasa lambat, tutup aplikasi lain di Mac selama Power BI dipakai.

## Sebelum trial berakhir

- Pastikan `.pbix`, PDF, dan screenshot dashboard **sudah diunggah ke GitHub** (repo `thelook-powerbi-dashboard`).
- Setelah trial berakhir, Windows di Parallels tidak bisa dibuka tanpa membeli lisensi Parallels. File yang sudah di GitHub tetap aman.
- Kalau ingin lanjut memakai Power BI setelah kursus: beli lisensi Parallels, atau pakai komputer Windows.

## Sumber

- [Parallels: Install Power BI in Windows 11 running on a Mac with Apple silicon](https://kb.parallels.com/en/129794)
- [Parallels Desktop download & trial](https://www.parallels.com/products/desktop/download/)
