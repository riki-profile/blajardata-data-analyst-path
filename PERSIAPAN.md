# Persiapan Sebelum Kelas

Semua tools di kursus ini gratis. Selesaikan checklist di bawah **sebelum sesi 1 (Senin, 9 November 2026)**, supaya waktu kelas dipakai untuk belajar, bukan untuk login. Total waktunya sekitar 20–30 menit.

Kalau ada langkah yang gagal, kirim screenshot pesan error-nya ke grup kelas sebelum hari Senin.

| Tool | Dipakai untuk | Sesi |
| --- | --- | --- |
| BigQuery (Sandbox) | Menulis query SQL pada dataset kursus | 1–4, 7 |
| Google Colab | Notebook Python dan pandas | 5–9 |
| Power BI Desktop atau Tableau Public | Membuat dashboard | 10–13 |
| GitHub | Tempat portofolio; file diunggah lewat browser, tanpa command line | 2–13 |
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
- [ ] Pilih **username yang profesional**, misalnya `budisantoso` atau `budi-santoso-data`. Username ini akan muncul di link portofoliomu (`github.com/username/thelook-analysis`) yang nanti kamu tunjukkan ke perekrut.
- [ ] Verifikasi email dari GitHub.

Repository portofolio akan kita buat bersama di sesi 2. Belum perlu membuat apa-apa sekarang.

### 6. Zoom

- [ ] Install aplikasi Zoom desktop dan coba login.
- [ ] Kalau memungkinkan, pakai **dua layar**, atau atur jendela Zoom dan browser berdampingan, supaya kamu bisa menonton demo sambil mengetik.
- [ ] Pastikan mikrofon berfungsi. Kamu akan diminta berbagi layar sesekali saat ada error.

## Sebelum sesi 10

Install salah satu, sesuai keputusan kelas:

- [ ] **Power BI Desktop** (khusus Windows): install gratis dari Microsoft Store atau [aka.ms/pbidesktopstore](https://aka.ms/pbidesktopstore). Tidak perlu login untuk membuat dashboard di laptop sendiri.
- [ ] **Tableau Public** (Mac/Windows): unduh gratis dari [public.tableau.com/app/discover](https://public.tableau.com/app/discover) → **Create** → **Download Tableau Public**, lalu buat akun Tableau Public. Dashboard yang kamu simpan akan mendapat link publik untuk portofolio.

Tableau Public memberi setiap dashboard link publik untuk portofoliomu. Dashboard Power BI ditampilkan di portofolio sebagai screenshot atau PDF, ditambah file `.pbix`-nya.

Jalankan aplikasinya sekali sebelum sesi 10 untuk memastikan sudah terinstall dengan benar.

## Masalah yang sering terjadi

| Masalah | Solusi |
| --- | --- |
| `Access Denied` atau `User does not have permission` saat menjalankan query | Pastikan project kamu sudah terpilih di bagian atas halaman BigQuery. Query dijalankan di project-mu, datanya dibaca dari `bigquery-public-data`. |
| `Syntax error: Unexpected string literal` | Kamu memakai tanda kutip `'...'` di sekitar nama tabel. Ganti dengan backtick `` `...` ``. |
| Diminta memasukkan kartu kredit | Kamu masuk ke halaman free trial, bukan sandbox. Kembali ke [console.cloud.google.com/bigquery](https://console.cloud.google.com/bigquery) dan lewati tawaran free trial. |
| Tidak menemukan `bigquery-public-data` di Explorer | Ulangi langkah "Star a project by name", atau langsung jalankan query uji. Query tetap jalan walaupun project-nya belum di-star. |
| Colab meminta login berulang kali | Izinkan cookie pihak ketiga untuk `colab.research.google.com`, atau coba browser Chrome. |
