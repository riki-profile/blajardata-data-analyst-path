# Persiapan Sebelum Kelas

Semua tools di kursus ini gratis. Peserta jalur penuh dan modul SQL: selesaikan checklist di bawah **sebelum sesi 1 (Selasa, 10 November 2026)**, supaya waktu kelas dipakai untuk belajar, bukan untuk login. Total waktunya sekitar 20–30 menit.

Kalau ada langkah yang gagal, kirim screenshot pesan error-nya ke grup kelas sebelum hari Selasa.

Mengambil **modul Python** atau **modul Power BI** saja? Lihat [Mulai dari modul Python atau Power BI](#mulai-dari-modul-python-atau-power-bi).

| Tool | Dipakai untuk | Sesi |
| --- | --- | --- |
| BigQuery (Sandbox) | Menulis query SQL pada dataset kursus | 1–4, 7 |
| Google Colab | Notebook Python dan pandas | 5–9 |
| Power BI Desktop | Membuat dashboard | 10–11 |
| GitHub | Tempat portofolio (satu repo per modul); file diunggah lewat browser, tanpa command line | 2–13 |
| Zoom | Kelas online | 1–13 |

## Sebelum sesi 1

### 1. Akun Google

- [ ] Login dengan akun Google (buat baru di [accounts.google.com](https://accounts.google.com) kalau belum punya).

Gunakan **satu akun yang sama** untuk BigQuery dan Colab. Kalau di browser kamu login dengan beberapa akun Google sekaligus (misalnya akun kantor dan akun pribadi), sebaiknya pakai jendela profil Chrome terpisah agar tidak tertukar.

### 2. Aktifkan BigQuery Sandbox

- [ ] Buka [console.cloud.google.com/bigquery](https://console.cloud.google.com/bigquery).
- [ ] Setujui syarat layanan jika diminta, lalu buat project baru jika diminta (misalnya bernama `belajar-data`). **Tidak perlu kartu kredit.**
- [ ] Pastikan di bagian atas halaman ada tulisan **Sandbox**. Ini artinya kamu memakai versi gratis (kuota query 1 TB per bulan, jauh lebih dari cukup untuk kursus ini).
- [ ] Catat **Project ID** kamu (klik nama project di bagian atas; ID-nya seperti `belajar-data-123456`). Project ID ini kita pakai lagi di sesi 7.

### 3. Temukan dataset TheLook dan jalankan query uji

- [ ] Di panel **Explorer** sebelah kiri, klik **+ Add** → **Star a project by name** → ketik `bigquery-public-data` → **Star**.
- [ ] Buka `bigquery-public-data` → `thelook_ecommerce`. Kamu akan melihat tabel seperti `users`, `orders`, `order_items`, dan `products`.
- [ ] Klik **+** (tab query baru / Compose new query), tempel query di bawah, lalu klik **Run**.

```sql
-- Query uji kursus Data Analysis TheLook
SELECT
  COUNT(*) AS jumlah_pelanggan,
  COUNT(DISTINCT country) AS jumlah_negara
FROM `bigquery-public-data.thelook_ecommerce.users`;
```

Berhasil jika muncul satu baris hasil berisi jumlah pelanggan (sekitar 100 ribu) dan jumlah negara. Angka pastinya bisa sedikit berbeda dari temanmu, karena dataset ini diperbarui secara berkala.

> **Perhatikan tanda backtick** (`` ` ``), bukan tanda kutip biasa, di sekitar nama tabel. Di keyboard, tombolnya biasanya di kiri atas, di bawah tombol Esc.

### 4. Google Colab

- [ ] Buka [colab.research.google.com](https://colab.research.google.com) → **New notebook**.
- [ ] Ketik `print("halo")` di sel pertama, lalu tekan **Shift + Enter**.
- [ ] Berhasil jika muncul tulisan `halo` di bawah sel.

### 5. Akun GitHub

- [ ] Buat akun gratis di [github.com/signup](https://github.com/signup).
- [ ] Pilih **username yang profesional**, misalnya `budisantoso` atau `budi-santoso-data`. Username ini akan muncul di link portofoliomu (misalnya `github.com/username/thelook-sql-analysis`) yang nanti kamu tunjukkan ke perekrut.
- [ ] Verifikasi email dari GitHub.

Repository portofolio akan kita buat bersama di sesi 2. Belum perlu membuat apa-apa sekarang.

### 6. Zoom

- [ ] Install aplikasi Zoom desktop dan coba login.
- [ ] Kalau memungkinkan, pakai **dua layar**, atau atur jendela Zoom dan browser berdampingan, supaya kamu bisa menonton demo sambil mengetik.
- [ ] Pastikan mikrofon berfungsi. Kamu akan diminta berbagi layar sesekali saat ada error.

## Mulai dari modul Python atau Power BI

Kalau kamu bergabung mulai sesi 5 atau sesi 10, siapkan ini sebelum sesi pertamamu:

| Langkah | Modul Python (mulai sesi 5) | Modul Power BI (mulai sesi 10) |
| --- | --- | --- |
| [1. Akun Google](#1-akun-google) | Wajib | Wajib (untuk mengunduh data dari Google Drive) |
| [2. BigQuery Sandbox](#2-aktifkan-bigquery-sandbox) + catat **Project ID** | Wajib, sebelum sesi 7 | Tidak perlu |
| [3. Query uji TheLook](#3-temukan-dataset-thelook-dan-jalankan-query-uji) | Wajib, sebelum sesi 7 | Tidak perlu |
| [4. Google Colab](#4-google-colab) | Wajib | Tidak perlu |
| [5. Akun GitHub](#5-akun-github) | Wajib | Wajib |
| [6. Zoom](#6-zoom) | Wajib | Wajib |
| [Power BI Desktop](#sebelum-sesi-10) | Tidak perlu (kecuali jalur penuh) | Wajib |

Baca juga [KAMUS_DATA.md](KAMUS_DATA.md) (10 menit) untuk mengenal tabel TheLook dan definisi pendapatan yang dipakai di kelas. Repo portofolio modulmu dibuat bersama di sesi pertama modul; langkahnya ada di [PANDUAN_GITHUB.md](PANDUAN_GITHUB.md).

## Sebelum sesi 10

- [ ] **Windows:** install **Power BI Desktop** gratis dari Microsoft Store atau [aka.ms/pbidesktopstore](https://aka.ms/pbidesktopstore). Tidak perlu login untuk membuat dashboard di laptop sendiri.
- [ ] **Mac:** ikuti [PANDUAN_MAC_PARALLELS.md](PANDUAN_MAC_PARALLELS.md) untuk menjalankan Windows 11 dan Power BI lewat Parallels (trial gratis 14 hari). Mulai hari **Minggu, 29 November**, karena prosesnya 1–2 jam.
- [ ] Buka Power BI Desktop sekali untuk memastikan sudah terinstall dengan benar. Pengguna Mac: jalankan juga **uji grafik tanggal** di panduan Parallels.

Dashboard Power BI ditampilkan di portofolio sebagai PDF dan screenshot, ditambah file `.pbix`-nya.

## Masalah yang sering terjadi

| Masalah | Solusi |
| --- | --- |
| `Access Denied` atau `User does not have permission` saat menjalankan query | Pastikan project kamu sudah terpilih di bagian atas halaman BigQuery. Query dijalankan di project-mu, datanya dibaca dari `bigquery-public-data`. |
| `Syntax error: Unexpected string literal` | Kamu memakai tanda kutip `'...'` di sekitar nama tabel. Ganti dengan backtick `` `...` ``. |
| Diminta memasukkan kartu kredit | Kamu masuk ke halaman free trial, bukan sandbox. Kembali ke [console.cloud.google.com/bigquery](https://console.cloud.google.com/bigquery) dan lewati tawaran free trial. |
| Tidak menemukan `bigquery-public-data` di Explorer | Ulangi langkah "Star a project by name", atau langsung jalankan query uji. Query tetap jalan walaupun project-nya belum di-star. |
| Colab meminta login berulang kali | Izinkan cookie pihak ketiga untuk `colab.research.google.com`, atau coba browser Chrome. |
