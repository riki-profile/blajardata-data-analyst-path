# Modul Tableau (terpisah)

Modul dashboard **2 sesi** dengan **Tableau Public**, setara dengan modul Power BI (sesi 10–11), memakai data dan alur yang sama.

> **Belum termasuk jalur kelas.** Modul ini disiapkan untuk kalau suatu saat dibuka kelas Tableau. Bisa dipakai sebagai kelas tersendiri, atau sebagai pengganti sesi 10–11 di jalur penuh (misalnya untuk kelas yang mayoritas pesertanya memakai Mac).

## Kenapa Tableau Public?

| | Tableau Public | Power BI Desktop |
| --- | --- | --- |
| Sistem operasi | **Mac dan Windows** | Windows saja (Mac lewat Parallels) |
| Biaya | Gratis | Gratis |
| Menyimpan | Hanya ke web, **publik** | File `.pbix` di laptop |
| Untuk portofolio | **Link publik** dashboard interaktif | PDF + screenshot + file `.pbix` |
| Terhubung ke BigQuery | Tidak (pakai CSV) | Bisa |

## Sesi

| # | Topik | Materi | Hasil |
| --- | --- | --- | --- |
| T1 | Dashboard pertama: data, relasi, calculated field, kartu KPI, grafik | [sesi-t1-dashboard-pertama/](sesi-t1-dashboard-pertama/) | Dashboard di Tableau Public + repo `thelook-tableau-dashboard` |
| T2 | Filter, margin, desain, dan storytelling | [sesi-t2-filter-storytelling/](sesi-t2-filter-storytelling/) | Dashboard final + README |

Durasi per sesi: 1,5 jam (±100 menit), dengan alur yang sama seperti sesi lain: recap → konsep & demo → giliran kamu → tanya jawab → penutup.

## Persiapan peserta

- [ ] Install **Tableau Public** (Mac/Windows): [public.tableau.com/app/discover](https://public.tableau.com/app/discover) → **Create** → **Download Tableau Public**.
- [ ] Buat **akun Tableau Public** (dipakai untuk menyimpan dashboard).
- [ ] Buka Tableau Public sekali untuk memastikan sudah terinstall.
- [ ] Akun **GitHub** (lihat [PERSIAPAN.md](../PERSIAPAN.md#5-akun-github)) dan akun **Google** (untuk mengunduh data dari Google Drive).
- [ ] Baca [KAMUS_DATA.md](../KAMUS_DATA.md) untuk mengenal dataset TheLook.

**Prasyarat:** paham konsep dasar data (tabel, kolom, jumlah, rata-rata). Tidak perlu SQL atau Python.

## Data

Sama dengan modul Power BI: **3 file CSV** (`penjualan.csv`, `produk.csv`, `pelanggan.csv`) yang dibagikan instruktur lewat Google Drive, ditambah `cek_cepat.txt`. Instruktur membuatnya dengan notebook [`10_export_dashboard_data.ipynb`](../materi/sesi-10-dashboard-1/10_export_dashboard_data.ipynb).

## Portofolio

Repo **`thelook-tableau-dashboard`** dengan README dari [template README Tableau](template-portofolio/README.md). Isinya cukup README + screenshot, karena dashboard interaktifnya ada di Tableau Public lewat link. Langkah membuat repo: [PANDUAN_GITHUB.md](../PANDUAN_GITHUB.md) (pakai nama `thelook-tableau-dashboard` dan deskripsi `Dashboard penjualan e-commerce TheLook dengan Tableau`).

### Penilaian

| Kriteria | Bobot |
| --- | --- |
| Dashboard: KPI benar, filter berfungsi, desain, link publik berfungsi | 50% |
| README: headline, temuan, rekomendasi dengan kata-katamu sendiri | 30% |
| Kerapian: screenshot tampil, link berfungsi | 20% |

## Untuk instruktur

- Runsheet: [instruktur/sesi-t1.md](instruktur/sesi-t1.md), [instruktur/sesi-t2.md](instruktur/sesi-t2.md)
- Slide Marp: `slides.md` di setiap folder sesi (cara presentasi: [panduan instruktur](../instruktur/README.md#slide-presentasi-marp))
- Kalau dipakai sebagai pengganti sesi 10–11 di jalur penuh: ganti semua rujukan "Power BI" di sesi 12–13 dengan Tableau, dan repo `thelook-powerbi-dashboard` dengan `thelook-tableau-dashboard`. Sesi 12 (studi kasus) tidak memakai tools dashboard, jadi tidak perlu diubah.
