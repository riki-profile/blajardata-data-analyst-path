# Panduan GitHub untuk Portofolio

Semua langkah lewat browser, tanpa command line. Panduan ini dipakai di awal setiap modul:

| Modul | Sesi | Nama repository | Deskripsi repository |
| --- | --- | --- | --- |
| SQL | 2 | `thelook-sql-analysis` | `Analisis kondisi bisnis e-commerce TheLook dengan SQL (BigQuery)` |
| Python | 5 | `thelook-python-analysis` | `Analisis pelanggan e-commerce TheLook dengan Python (pandas)` |
| Power BI | 10 | `thelook-powerbi-dashboard` | `Dashboard penjualan e-commerce TheLook dengan Power BI` |

Belum punya akun GitHub? Lihat langkah 5 di [PERSIAPAN.md](PERSIAPAN.md#5-akun-github).

## 1. Membuat repository

1. Login ke [github.com](https://github.com) → tombol **+** di kanan atas → **New repository**.
2. **Repository name:** nama dari tabel di atas, persis sama (huruf kecil, pakai tanda `-`).
3. **Description:** deskripsi dari tabel di atas.
4. Pilih **Public** (portofolio harus bisa dilihat orang lain).
5. Centang **Add a README file**.
6. Klik **Create repository**.

## 2. Membuat folder dan mengunggah file

GitHub tidak bisa membuat folder kosong. Folder otomatis terbentuk saat kamu membuat file di dalamnya.

**Cara 1: Create new file (untuk file teks seperti `.sql` atau `README.md`)**

1. Di halaman repo → **Add file** → **Create new file**.
2. Di kotak nama file, ketik nama folder + `/` + nama file, misalnya `sql/01_basics.sql`. Saat kamu mengetik `/`, GitHub otomatis membuat foldernya.
3. Tempel isi file ke editor.
4. Klik **Commit changes...** → tulis pesan singkat, misalnya `Tambah query dasar sesi 1` → **Commit changes**.

**Cara 2: Upload files (untuk file dari laptop: `.ipynb`, `.png`, `.pbix`, `.pdf`)**

1. Kalau foldernya belum ada, buat dulu dengan Cara 1, misalnya `notebooks/README.md` berisi satu baris `Notebook Colab`.
2. Masuk ke folder tujuan (klik nama foldernya).
3. **Add file** → **Upload files** → seret file ke halaman.
4. Tulis pesan commit → **Commit changes**.

> Batas unggah lewat browser: **25 MB per file**. File yang lebih besar (misalnya `.pbix` yang berat) cukup diganti PDF + screenshot.

## 3. Mengganti isi file yang sudah ada

Buka file di GitHub → ikon **pensil** (Edit this file) → ubah → **Commit changes**.

Untuk mengganti file non-teks (gambar, notebook), unggah ulang file dengan **nama yang sama** di folder yang sama; GitHub akan menimpanya.

> **Commit** = menyimpan perubahan beserta catatan apa yang diubah. Tulis pesan commit yang jelas, misalnya `Tambah PR sesi 2: top 10 brand`, bukan `update`.

## 4. Menulis README

`README.md` adalah halaman depan repo-mu, yang pertama dibaca orang. Template untuk setiap repo ada di [template-portofolio/](template-portofolio/):

1. Buka template yang sesuai → tombol **Raw** → salin semua teksnya.
2. Di repo-mu: buka `README.md` → ikon pensil → hapus isinya → tempel template.
3. Ganti semua teks dalam `<...>` dengan isimu sendiri → **Commit changes**.

Menampilkan gambar di README:

```markdown
![Pendapatan bulanan](images/01_pendapatan_bulanan.png)
```

Nama file harus sama persis (huruf besar-kecil) dan tanpa spasi.
