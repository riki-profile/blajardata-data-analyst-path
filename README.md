# Data Analysis dengan BigQuery, Python & BI

Kursus 13 sesi via Zoom untuk belajar menjawab pertanyaan bisnis dengan data: **SQL di BigQuery**, **Python di Google Colab**, dan **dashboard di Power BI**. Di akhir kursus kamu punya **portofolio analisis data di GitHub** yang kamu bangun sedikit demi sedikit setiap sesi.

Kursus ini bisa diambil **penuh (13 sesi)** atau **per modul** (SQL, Python, atau Power BI saja). Setiap modul menghasilkan satu repository portofolio sendiri. Lihat [Pilihan kelas](#pilihan-kelas-penuh-atau-per-modul).

Sepanjang kursus kamu berperan sebagai analis baru di **TheLook**, toko pakaian online fiktif. Manajemen ingin tahu bagaimana kondisi bisnis, siapa pelanggannya, dan di mana peluang untuk tumbuh. Semua sesi memakai dataset yang sama, yaitu `bigquery-public-data.thelook_ecommerce`, dan setiap sesi menjawab satu bagian dari pertanyaan besar itu.

## Setelah kursus ini kamu bisa

1. Menulis query SQL di BigQuery untuk memfilter, mengagregasi, dan menggabungkan tabel.
2. Memakai Python dan pandas di Colab untuk membersihkan, menganalisis, dan membuat grafik dari data.
3. Membuat dashboard interaktif di Power BI.
4. Menerbitkan portofolio GitHub yang menyajikan analisismu sebagai cerita yang jelas, lengkap dengan rekomendasi.

## Info kelas

| | |
| --- | --- |
| Mulai | Selasa, 10 November 2026 |
| Jadwal | **Selasa & Kamis pukul 20.00 WIB**, **Sabtu pukul 14.00 WIB** |
| Durasi | 13 sesi, 1,5–2 jam (sesi 1 dan 8 berlangsung penuh 2 jam) |
| Tempat | Zoom (link dibagikan di grup kelas) |
| Bahasa | Bahasa Indonesia |
| PR | 30–60 menit setelah setiap sesi, termasuk update portofolio |
| Prasyarat | Tidak ada. Terbiasa dengan spreadsheet akan membantu; tidak perlu pengalaman coding |
| Yang perlu disiapkan | Laptop dan akun Google. Power BI Desktop butuh Windows; pengguna Mac memakai Windows virtual lewat Parallels (panduan di [PERSIAPAN.md](PERSIAPAN.md#sebelum-sesi-10)) |

**Sebelum sesi 1, selesaikan [PERSIAPAN.md](PERSIAPAN.md).** Waktu kelas dipakai untuk belajar, bukan untuk urusan login.

## Jadwal

| # | Tanggal & jam (WIB) | Modul | Topik | Materi | File portofolio |
| --- | --- | --- | --- | --- | --- |
| 1 | Sel, 10 Nov 2026, 20.00 *(2 jam)* | Dasar + SQL | Apa itu analisis data; SELECT, WHERE, ORDER BY, LIMIT | [Sesi 1](materi/sesi-01-dasar-sql/) | `01_basics.sql` |
| 2 | Kam, 12 Nov 2026, 20.00 | SQL | Agregasi: COUNT, SUM, AVG, GROUP BY, HAVING; membuat portofolio di GitHub | [Sesi 2](materi/sesi-02-agregasi/) | repo `thelook-sql-analysis` + `01_basics.sql`, `02_aggregation.sql` |
| 3 | Sab, 14 Nov 2026, 14.00 | SQL | JOIN | [Sesi 3](materi/sesi-03-join/) | `03_joins.sql` |
| 4 | Sel, 17 Nov 2026, 20.00 | SQL | Tanggal, CASE WHEN, CTE + **Proyek SQL** | [Sesi 4](materi/sesi-04-tanggal-case-cte/) | `04_dates_case_cte.sql` + **README SQL** |
| 5 | Kam, 19 Nov 2026, 20.00 | Python | Dasar Python I: variabel, tipe data, list, dictionary | [Sesi 5](materi/sesi-05-python-dasar-1/) | repo `thelook-python-analysis` + `05_python_basics.ipynb` |
| 6 | Sab, 21 Nov 2026, 14.00 | Python | Dasar Python II: if/else, loop, function | [Sesi 6](materi/sesi-06-python-dasar-2/) | `06_functions.ipynb` |
| 7 | Sel, 24 Nov 2026, 20.00 | Python | Dasar pandas; memuat data BigQuery ke Colab | [Sesi 7](materi/sesi-07-pandas/) | `07_pandas_exploration.ipynb` |
| 8 | Kam, 26 Nov 2026, 20.00 *(2 jam)* | Python | Pembersihan data dan visualisasi | [Sesi 8](materi/sesi-08-cleaning-visualisasi/) | `08_cleaning_and_charts.ipynb` + gambar grafik |
| 9 | Sab, 28 Nov 2026, 14.00 | Python | Statistik deskriptif dan analisis pelanggan | [Sesi 9](materi/sesi-09-analisis-pelanggan/) | `09_customer_analysis.ipynb` + **README Python** |
| 10 | Sel, 1 Des 2026, 20.00 | Power BI | Dashboard pertama: koneksi data, relasi, grafik, kartu KPI | [Sesi 10](materi/sesi-10-dashboard-1/) | repo `thelook-powerbi-dashboard` + file dashboard + screenshot |
| 11 | Kam, 3 Des 2026, 20.00 | Power BI | Filter, measure margin, desain, dan storytelling | [Sesi 11](materi/sesi-11-dashboard-2/) | dashboard final + **README Power BI** |
| 12 | Sab, 5 Des 2026, 14.00 | Jalur penuh | Studi kasus terpandu: kategori mana yang diprioritaskan? | [Sesi 12](materi/sesi-12-studi-kasus/) | `my_question/` di repo Python |
| 13 | Sel, 8 Des 2026, 20.00 | Jalur penuh | Merapikan dan menerbitkan portofolio | [Sesi 13](materi/sesi-13-publikasi/) | 3 repo rapi + README profil GitHub |

Sebelum sesi 10, install **Power BI Desktop**. Pengguna Mac: ikuti panduan Parallels di [PERSIAPAN.md](PERSIAPAN.md#sebelum-sesi-10).

## Pilihan kelas: penuh atau per modul

| Pilihan | Sesi | Tanggal | Prasyarat | Hasil portofolio |
| --- | --- | --- | --- | --- |
| **Jalur penuh** | 1–13 | 10 Nov – 8 Des 2026 | Tidak ada | 3 repo + studi kasus + README profil GitHub |
| **Modul SQL** | 1–4 | 10–17 Nov 2026 | Tidak ada | Repo `thelook-sql-analysis` |
| **Modul Python** | 5–9 | 19–28 Nov 2026 | Bisa membaca query SQL sederhana (SELECT, WHERE, GROUP BY, JOIN) | Repo `thelook-python-analysis` |
| **Modul Power BI** | 10–11 | 1–3 Des 2026 | Paham konsep dasar data: tabel, kolom, jumlah, rata-rata | Repo `thelook-powerbi-dashboard` |

Peserta per modul bergabung di kelas yang sama, hanya untuk sesi modulnya. Setiap modul dimulai dengan membuat repository portofolionya sendiri dan ditutup dengan README berisi temuan dan rekomendasi, jadi hasilnya lengkap walaupun hanya mengambil satu modul.

Studi kasus (sesi 12) dan publikasi portofolio (sesi 13) khusus jalur penuh, karena menggabungkan SQL, Python, dan dashboard.

## Alur setiap sesi

| Bagian | Durasi | Isi |
| --- | --- | --- |
| Recap | 10–15 menit | Membahas PR sesi sebelumnya |
| Konsep & demo | 40–50 menit | Instruktur menjalankan query/notebook. Kamu memegang file yang sama dan ikut mengetik |
| Giliran kamu | ±10 menit | Latihan singkat (jika waktu cukup) |
| Tanya jawab | 15–20 menit | Pertanyaan apa saja, termasuk soal PR |
| Penutup | 5–10 menit | Ringkasan dan PR berikutnya |

## Isi repository ini

```
.
├── README.md               ← kamu di sini
├── PERSIAPAN.md            ← checklist sebelum sesi 1, sesi 5, dan sesi 10
├── KAMUS_DATA.md           ← penjelasan tabel TheLook dan definisi metrik
├── PANDUAN_GITHUB.md       ← membuat repo portofolio, folder, unggah file, README
├── PANDUAN_MAC_PARALLELS.md ← Power BI di Mac lewat Parallels (trial 14 hari)
├── materi/                 ← satu folder per sesi: README materi + file latihan
│   ├── sesi-01-dasar-sql/
│   ├── ...
│   └── sesi-13-publikasi/
├── modul-tableau/          ← modul Tableau terpisah (belum termasuk jalur kelas)
├── template-portofolio/    ← template README untuk 3 repo portofolio + README profil
└── instruktur/             ← panduan mengajar, runsheet per sesi
    └── kunci-jawaban/      ← versi file kerja yang sudah terisi (khusus instruktur)
```

Di setiap folder sesi:

- `README.md` berisi materi sesi: tujuan, konsep, langkah demo, latihan "Giliran kamu", dan PR.
- File kerja (`.sql` atau `.ipynb`) dengan nama yang sama seperti file portofoliomu. Unduh, jalankan sambil mengikuti demo, kerjakan latihan dan PR di file yang sama, lalu unggah ke portofoliomu.
- `slides.md` berisi slide presentasi sesi itu dalam format [Marp](https://marp.app). Di GitHub tampil sebagai teks biasa; untuk melihatnya sebagai slide, lihat [panduan instruktur](instruktur/README.md#slide-presentasi-marp).

Notebook bisa dibuka langsung di Colab lewat tombol **Open in Colab** di README setiap sesi Python.

## Portofolio dan penilaian

Setiap modul menghasilkan **satu repository GitHub publik** dengan README berisi pertanyaan bisnis, 3 temuan, dan 1 rekomendasi:

| Repo | Modul | Isi | README ditulis di |
| --- | --- | --- | --- |
| `thelook-sql-analysis` | SQL | `sql/01_...` sampai `04_...` | Sesi 4 (Proyek SQL) |
| `thelook-python-analysis` | Python | `notebooks/05_...` sampai `09_...`, `images/`, *(jalur penuh)* `my_question/` | Sesi 9 |
| `thelook-powerbi-dashboard` | Power BI | `dashboard/` (`.pbix` + PDF), `images/` | Sesi 11 |

Peserta jalur penuh menghubungkan ketiganya lewat **README profil GitHub** di sesi 13. Template semuanya ada di [template-portofolio/](template-portofolio/).

### Penilaian per modul

| Modul SQL | Bobot | Modul Python | Bobot | Modul Power BI | Bobot |
| --- | --- | --- | --- | --- | --- |
| File SQL: benar, jelas, diberi komentar | 40% | Notebook: pembersihan, analisis, grafik | 40% | Dashboard: KPI benar, filter, desain | 50% |
| README: temuan + rekomendasi dengan kata-katamu sendiri | 40% | README: temuan + rekomendasi dengan kata-katamu sendiri | 40% | README: headline, temuan, rekomendasi | 30% |
| Kerapian: nama file, link berfungsi | 20% | Kerapian: nama file, gambar tampil | 20% | Kerapian: PDF/screenshot, link | 20% |

### Penilaian jalur penuh

| Kriteria | Bobot |
| --- | --- |
| File SQL: benar, jelas, dan diberi komentar | 20% |
| Notebook: pembersihan, analisis, dan grafik | 20% |
| Kejelasan dashboard | 20% |
| README ketiga repo: temuan dan rekomendasi dengan kata-katamu sendiri | 20% |
| Studi kasus: fokus pilihanmu dan kesimpulan dengan kata-katamu sendiri | 10% |
| Kerapian: nama file, link berfungsi, README profil yang menghubungkan ketiga repo | 10% |

Semua orang memulai dari dataset yang sama, jadi fokus pilihanmu dan temuan yang kamu tulis dengan kata-katamu sendiri itulah yang membuat portofolio ini milikmu.

## Supaya kursus ini berhasil

Kebiasaan paling penting: **ketik dan jalankan sendiri kodenya.** Menonton demo saja tidak cukup.

- **Kerjakan PR.** Sebagian besar latihan terjadi di antara sesi, dan setiap sesi dibangun di atas sesi sebelumnya.
- **Update portofolio setiap selesai sesi.** Unggah file sesi itu sebelum kelas berikutnya. Mengejar banyak file di akhir jauh lebih berat.
- **Jalankan ulang file demo.** Setelah sesi, buka file yang dibagikan dan jalankan baris demi baris.
- **Coba latihan "Giliran kamu"** di kelas, walaupun hanya selesai setengah.
- **Bertanya sejak awal.** Manfaatkan sesi tanya jawab, dan bawa masalah PR ke recap sesi berikutnya.

Pertanyaan di luar jam kelas: lewat grup kelas (kanal akan dikonfirmasi oleh instruktur).
