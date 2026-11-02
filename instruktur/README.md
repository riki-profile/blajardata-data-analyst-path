# Panduan Instruktur

Folder ini berisi runsheet per sesi, poin mengajar, error yang sering muncul, dan **kunci jawaban** semua latihan (kerjakan bersama dan latihan mandiri).

Setiap file kerja punya **dua versi**:

| Versi | Lokasi | Isi |
| --- | --- | --- |
| Peserta | `materi/sesi-XX/` | Demo lengkap; latihan **kosong** |
| Instruktur | [`instruktur/kunci-jawaban/`](kunci-jawaban/) | File yang sama, semua latihan **sudah terisi** (dipakai untuk memandu "Kerjakan bersama") |

> **Kunci jawaban ada di folder ini.** Kalau repository ini dibagikan ke peserta dalam keadaan publik, kunci jawaban ikut terlihat. Pilihannya: (a) pindahkan folder `instruktur/` ke repository privat terpisah, (b) jadikan repository ini privat dan bagikan materi lewat cara lain, atau (c) biarkan terbuka dan minta peserta mencoba dulu sebelum melihat kunci. Pilihan (a) paling rapi.

## Daftar runsheet

| # | Tanggal & jam (WIB) | Runsheet |
| --- | --- | --- |
| 1 | Sel, 10 Nov 2026, 20.00 *(2 jam)* | [sesi-01.md](sesi-01.md) |
| 2 | Kam, 12 Nov 2026, 20.00 | [sesi-02.md](sesi-02.md) |
| 3 | Sab, 14 Nov 2026, 14.00 | [sesi-03.md](sesi-03.md) |
| 4 | Sel, 17 Nov 2026, 20.00 | [sesi-04.md](sesi-04.md) |
| 5 | Kam, 19 Nov 2026, 20.00 | [sesi-05.md](sesi-05.md) |
| 6 | Sab, 21 Nov 2026, 14.00 | [sesi-06.md](sesi-06.md) |
| 7 | Sel, 24 Nov 2026, 20.00 | [sesi-07.md](sesi-07.md) |
| 8 | Kam, 26 Nov 2026, 20.00 *(2 jam)* | [sesi-08.md](sesi-08.md) |
| 9 | Sab, 28 Nov 2026, 14.00 | [sesi-09.md](sesi-09.md) |
| 10 | Sel, 1 Des 2026, 20.00 | [sesi-10.md](sesi-10.md) |
| 11 | Kam, 3 Des 2026, 20.00 | [sesi-11.md](sesi-11.md) |
| 12 | Sab, 5 Des 2026, 14.00 | [sesi-12.md](sesi-12.md) |
| 13 | Sel, 8 Des 2026, 20.00 | [sesi-13.md](sesi-13.md) |

Selasa dan Kamis pukul **20.00 WIB**, Sabtu pukul **14.00 WIB**. Sesi 1 dan 8 (keduanya malam) berakhir 22.00; sesi malam lainnya ±21.40, sesi Sabtu ±15.40.

**Tanpa PR wajib.** Kelas ini dirancang untuk peserta yang sibuk dan cenderung pasif: semua latihan dipandu instruktur ("Kerjakan bersama"), semua file portofolio diunggah bersama di akhir sesi, dan temuan serta README ditulis bersama di sesi 4, 9, 11, dan 12. Latihan mandiri di setiap file bersifat **opsional dan tidak dinilai**; bagikan jawabannya (dari [kunci-jawaban/](kunci-jawaban/)) di grup setelah kelas.

**Catatan jadwal:**

- Karena tidak ada PR, recap cukup ±5 menit: ingatkan konsep kunci sesi sebelumnya. Waktu yang tersisa dipakai untuk unggah bersama.
- Peserta yang absen menyusul lewat rekaman. Ingatkan di grup: "tonton rekaman dan unggah file sesi itu sebelum sesi berikutnya".
- Sesi Sabtu siang cocok untuk kegiatan yang butuh energi: JOIN (sesi 3), RFM (sesi 9), dan studi kasus terpandu (sesi 12). Perhatikan peserta yang mungkin bekerja atau punya acara keluarga di Sabtu siang; rekaman sangat penting untuk sesi ini.

## Timeline persiapan sebelum kelas

| Kapan | Yang dilakukan |
| --- | --- |
| Sekarang | Pastikan akun Zoom **berbayar (Pro atau lebih)**. Akun gratis dibatasi **40 menit** per meeting. Tetapkan kanal tanya jawab (grup WhatsApp/Telegram/Discord) |
| Sel, 3 Nov (H-7) | Kirim pengumuman pembukaan + link [PERSIAPAN.md](../PERSIAPAN.md) + link Zoom berulang (*recurring*) |
| Jum, 6 Nov (H-4) | Pengingat: minta peserta mengirim screenshot hasil query uji ke grup |
| Min, 8 Nov (H-2) | Cek siapa yang belum mengirim screenshot; hubungi pribadi |
| Sel, 10 Nov, siang | Jalankan semua query sesi 1 dari awal (dataset diperbarui berkala). Kirim pengingat kelas |
| Sab, 28 Nov (setelah sesi 9) | Pengingat instalasi Power BI + link [panduan Parallels](../PANDUAN_MAC_PARALLELS.md) untuk pengguna Mac (mulai Minggu, 29 Nov, supaya trial 14 hari cukup sampai akhir kursus) |
| Sen, 30 Nov | Unggah 3 CSV + `cek_cepat.txt` ke Google Drive, bagikan link di grup (lihat runsheet sesi 10) |

**Tools dashboard: Power BI.** Power BI Desktop hanya jalan di Windows; pengguna Mac memakai Windows 11 lewat **Parallels** (trial gratis 14 hari), dengan [panduan Parallels](../PANDUAN_MAC_PARALLELS.md). Di sesi 1, tanyakan lewat polling Zoom siapa yang memakai Mac, supaya kamu tahu siapa yang perlu dipantau sebelum sesi 10. Materi Tableau tersedia terpisah di [modul-tableau/](../modul-tableau/) kalau suatu saat dibuka kelas Tableau.

## Kelas per modul

Kursus dijual penuh atau per modul. Peserta per modul bergabung di kelas yang sama, hanya untuk sesi modulnya:

| Modul | Sesi | Peserta baru bergabung di | Hal khusus untuk instruktur |
| --- | --- | --- | --- |
| SQL | 1–4 | Sesi 1 | Ditutup dengan Proyek SQL di sesi 4 (README `thelook-sql-analysis`) |
| Python | 5–9 | Sesi 5 | Sambut peserta baru di recap sesi 5. Mereka butuh BigQuery + Project ID sebelum sesi 7. Ditutup dengan README `thelook-python-analysis` di sesi 9 |
| Power BI | 10–11 | Sesi 10 | Sambut peserta baru di recap sesi 10. Data dibagikan via Google Drive. Ditutup dengan README `thelook-powerbi-dashboard` di sesi 11 |
| Jalur penuh | 1–13 | Sesi 1 | Sesi 12 (studi kasus) dan 13 (publikasi, README profil) khusus jalur penuh |

Peserta baru di awal modul membawa pertanyaan setup sendiri. Buka meeting 15 menit lebih awal di sesi 5 dan sesi 10, dan arahkan mereka ke [PERSIAPAN.md](../PERSIAPAN.md#mulai-dari-modul-python-atau-power-bi) sebelum kelas.

## Pengaturan Zoom

**Meeting**

- Satu meeting berulang supaya link tidak berubah. Karena jamnya berbeda (Selasa/Kamis 20.00, Sabtu 14.00), pilih **Recurrence: No Fixed Time** di pengaturan Zoom. Satu link untuk semua sesi; jadwalnya diumumkan di grup.
- Aktifkan **Waiting Room** atau passcode; nyalakan **Cloud recording** (atau *local recording*) otomatis.
- Buka meeting 10–15 menit lebih awal (19.45, atau 13.45 di hari Sabtu) untuk peserta yang ingin bertanya soal setup.
- Kalau ada asisten, jadikan **co-host** untuk memantau chat dan membantu di *breakout room*.

**Berbagi layar**

- Bagikan **satu jendela** (browser), bukan seluruh layar, supaya notifikasi tidak ikut terlihat.
- Perbesar tampilan: **Ctrl + +** (Mac: **Cmd + +**) sampai sekitar 125–150% di BigQuery dan Colab. Teks kode harus terbaca di layar laptop peserta yang kecil.
- Kalau punya dua monitor: satu untuk layar yang dibagikan, satu untuk chat Zoom dan runsheet ini.
- Di Colab, pakai **Tools → Settings → Editor → Font size** sekitar 16.

**Konvensi chat** (jelaskan di sesi 1, pakai setiap sesi)

| Ketik | Artinya |
| --- | --- |
| `1` | Sudah berhasil / sudah selesai |
| `2` | Error / tertinggal |
| `?` + pertanyaan | Ada pertanyaan (dijawab di jeda atau sesi tanya jawab) |

Setelah setiap langkah demo yang penting, minta "ketik 1 kalau sudah berhasil". Tunggu sampai sebagian besar peserta mengetik 1 sebelum lanjut. Peserta yang mengetik `2` diminta berbagi layar sebentar, atau dibantu asisten di *breakout room*.

**Breakout room** dipakai di sesi 13 (review berpasangan). Siapkan dengan opsi **Let participants choose room** atau atur manual.

## Slide presentasi (Marp)

Setiap folder sesi berisi `slides.md`: 12–19 slide yang mengikuti agenda sesi (judul, agenda, konsep, langkah demo, kerjakan bersama, unggah bersama, ringkasan). Slide ditulis dalam Markdown dengan [Marp](https://marp.app), jadi mudah diubah seperti file teks biasa.

**Menampilkan dan mempresentasikan**

1. Install [VS Code](https://code.visualstudio.com) dan ekstensi **Marp for VS Code**.
2. Buka `slides.md` → klik ikon **Open Preview to the Side** (kanan atas) untuk melihat slide.
3. Untuk presentasi di Zoom: ikon **Marp** → **Export Slide Deck** → pilih **HTML** (buka di browser, tekan **F** untuk layar penuh) atau **PDF**. Format **PPTX** juga tersedia jika ingin diedit di PowerPoint/Google Slides.

Atau lewat command line (butuh Node.js):

```bash
npx @marp-team/marp-cli@latest materi/sesi-01-dasar-sql/slides.md --pdf
npx @marp-team/marp-cli@latest materi/sesi-01-dasar-sql/slides.md --pptx
```

**Catatan**

- Semua deck memakai gaya yang sama (blok `style:` di bagian atas file). Untuk mengganti warna atau ukuran huruf, ubah blok itu di setiap file.
- Slide sengaja tidak memakai HTML atau emoji, supaya tampil sama di VS Code, ekspor PDF, dan tanpa koneksi internet.
- Slide **pertanyaan pemandu** di sesi 12 hanya menampilkan pertanyaan. Jawabannya ada di **catatan presenter** (komentar `<!-- ... -->` di bawah slide), yang terlihat di *presenter view* ekspor HTML (tekan **P**) tetapi tidak di layar peserta.
- Tanggal dan jam di slide mengikuti jadwal saat ini. Kalau jadwal berubah, perbarui slide judul dan slide ringkasan ("Sesi berikutnya").

## Ritme setiap sesi

| Bagian | Durasi | Tips |
| --- | --- | --- |
| Recap | ±5 menit | Ingatkan 2–3 konsep kunci sesi sebelumnya; tunjukkan 1 hasil peserta kalau ada |
| Konsep & demo | 40–50 menit | **Ketik ulang** kode secara langsung, jangan hanya menjalankan yang sudah jadi. Kesalahan ketik yang terjadi saat demo adalah materi belajar yang berharga |
| Kerjakan bersama | 10–15 menit | Pakai file kunci sebagai contekan. Bacakan soalnya, tanya di chat "kolom/fungsi apa yang kita perlukan?", beri 20–30 detik, lalu **ketik jawabannya di layar** pelan-pelan sementara peserta mengikuti. "Ketik 1 kalau hasilnya sama" |
| Unggah bersama | ±10 menit | Demo unggah file sesi itu ke repo portofolio; tunggu sampai mayoritas mengetik 1. Jangan dipotong walaupun waktu sempit: potong tanya jawab |
| Tanya jawab | 10–20 menit | Kalau tidak ada pertanyaan, tanyakan balik: "Bagian mana yang paling membingungkan hari ini?" |
| Penutup | ±5 menit | Jalankan **checklist hasil** di runsheet sesi itu (apa yang harus sudah dimiliki setiap peserta), lalu ringkasan 3 poin, latihan mandiri (opsional), tanggal sesi berikutnya |

## Sebelum setiap sesi

- [ ] Jalankan ulang file sesi itu dari awal. Dataset TheLook diperbarui berkala, jadi angka di contoh bisa bergeser. Siapkan jawaban versi hari itu.
- [ ] Buka tab yang dibutuhkan: BigQuery/Colab, README sesi, runsheet, repo portofolio contoh.
- [ ] Siapkan notebook/query **kosong** untuk mengetik ulang saat demo, dan versi lengkap sebagai cadangan.
- [ ] Unggah rekaman sesi sebelumnya ke grup.

## Penilaian

Setiap modul dinilai dari repo portofolionya sendiri; jalur penuh memakai rubrik dari silabus. Bobot untuk peserta ada di [README utama](../README.md#portofolio-dan-penilaian). Panduan skor:

| Komponen | Sangat baik | Cukup | Kurang |
| --- | --- | --- | --- |
| File SQL | 4 file lengkap, benar, setiap query diberi komentar pertanyaan bisnisnya | Lengkap, sebagian komentar | File kurang, banyak error |
| Notebook | 5 notebook dijalankan (output terlihat), pembersihan didokumentasikan, grafik berjudul kesimpulan | Lengkap, sebagian output/penjelasan hilang | Notebook kosong atau kurang |
| Dashboard Power BI | KPI benar, filter berfungsi, headline + rekomendasi, rapi | Lengkap tanpa storytelling | KPI salah atau tidak ada filter |
| README (per repo) | 3 temuan dengan angka + 1 rekomendasi konkret, kata-kata sendiri | Temuan tanpa angka atau rekomendasi umum | Hanya daftar file |
| Studi kasus (jalur penuh) | Fokus dipilih, semua sel dijalankan, jawaban + rekomendasi dengan kata-kata sendiri + keterbatasan | Draf otomatis disalin tanpa diubah | Tidak ada |
| Kerapian | Nama file konsisten, semua link/gambar berfungsi; jalur penuh: README profil menghubungkan ketiga repo | Ada 1–3 link rusak atau nama file acak | Berantakan |

## Template pesan

**Pengumuman pembukaan (H-7)**

> Halo semuanya! 👋 Selamat datang di kelas **Data Analysis dengan BigQuery, Python & BI**.
>
> 📅 Mulai **Selasa, 10 November 2026**, setiap **Selasa & Kamis pukul 20.00 WIB** dan **Sabtu pukul 14.00 WIB** via Zoom (13 sesi, sampai 8 Desember).
> 🔗 Link Zoom: <link>
> 📚 Materi: <link repo>
>
> **Sebelum sesi 1, mohon selesaikan checklist persiapan** (±30 menit): <link PERSIAPAN.md>
> Setelah selesai, kirim screenshot hasil query uji ke grup ini ya. Kalau ada kendala, tanya di sini, kita bantu sebelum hari Selasa.

**Pengingat hari-H**

> Pengingat: **Sesi <n>, hari ini pukul <20.00 / 14.00> WIB.** <Topik>.
> 🎥 Belum sempat ikut sesi <n-1>? Tonton rekamannya dan unggah file sesi itu sebelum kelas.
> 📂 Materi: <link folder sesi>
> 🔗 Zoom: <link>

**Setelah sesi**

> Terima kasih untuk sesi <n> malam ini! 🙏
> 🎥 Rekaman: <link>
> 📝 Tidak ada PR. Latihan mandiri (opsional) + jawabannya: <link>. Sesi berikutnya: <hari, tanggal, jam>.
> ❓ Ada kendala? Tanya di grup ini.
