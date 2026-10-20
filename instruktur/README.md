# Panduan Instruktur

Folder ini berisi runsheet per sesi, poin mengajar, error yang sering muncul, dan **kunci jawaban** latihan serta PR.

> **Kunci jawaban ada di folder ini.** Kalau repository ini dibagikan ke peserta dalam keadaan publik, kunci jawaban ikut terlihat. Pilihannya: (a) pindahkan folder `instruktur/` ke repository privat terpisah, (b) jadikan repository ini privat dan bagikan materi lewat cara lain, atau (c) biarkan terbuka dan minta peserta mencoba dulu sebelum melihat kunci. Pilihan (a) paling rapi.

## Daftar runsheet

| # | Tanggal | Runsheet |
| --- | --- | --- |
| 1 | Sen, 9 Nov 2026 *(2 jam)* | [sesi-01.md](sesi-01.md) |
| 2 | Rab, 11 Nov 2026 | [sesi-02.md](sesi-02.md) |
| 3 | Kam, 12 Nov 2026 | [sesi-03.md](sesi-03.md) |
| 4 | Sen, 16 Nov 2026 | [sesi-04.md](sesi-04.md) |
| 5 | Rab, 18 Nov 2026 | [sesi-05.md](sesi-05.md) |
| 6 | Kam, 19 Nov 2026 | [sesi-06.md](sesi-06.md) |
| 7 | Sen, 23 Nov 2026 | [sesi-07.md](sesi-07.md) |
| 8 | Rab, 25 Nov 2026 *(2 jam)* | [sesi-08.md](sesi-08.md) |
| 9 | Kam, 26 Nov 2026 | [sesi-09.md](sesi-09.md) |
| 10 | Sen, 30 Nov 2026 | [sesi-10.md](sesi-10.md) |
| 11 | Rab, 2 Des 2026 | [sesi-11.md](sesi-11.md) |
| 12 | Kam, 3 Des 2026 | [sesi-12.md](sesi-12.md) |
| 13 | Sen, 7 Des 2026 | [sesi-13.md](sesi-13.md) |

Semua sesi pukul 20.00 WIB. Sesi 1 dan 8 berakhir 22.00; sesi lainnya ±21.40.

**Catatan jadwal:** sesi 2–3, 5–6, 8–9, dan 11–12 berjarak **hanya satu hari** (Rabu → Kamis). Waktu PR peserta di antara sesi-sesi ini sempit, jadi:

- Recap hari Kamis sebaiknya ringan: bahas 1–2 contoh PR, bukan memeriksa semua.
- Tegaskan bahwa PR boleh diselesaikan sampai sesi berikutnya setelahnya (Senin), asal file sesi itu sudah diunggah walaupun belum sempurna.

## Timeline persiapan sebelum kelas

| Kapan | Yang dilakukan |
| --- | --- |
| Sekarang | Pastikan akun Zoom **berbayar (Pro atau lebih)**. Akun gratis dibatasi **40 menit** per meeting. Tetapkan kanal tanya jawab (grup WhatsApp/Telegram/Discord) |
| Sen, 2 Nov (H-7) | Kirim pengumuman pembukaan + link [PERSIAPAN.md](../PERSIAPAN.md) + link Zoom berulang (*recurring*) |
| Kam, 5 Nov (H-4) | Pengingat: minta peserta mengirim screenshot hasil query uji ke grup |
| Sab, 7 Nov (H-2) | Cek siapa yang belum mengirim screenshot; hubungi pribadi |
| Sen, 9 Nov, siang | Jalankan semua query sesi 1 dari awal (dataset diperbarui berkala). Kirim pengingat kelas |
| Sebelum sesi 10 | Konfirmasi tools dashboard kelas (**Power BI** atau **Tableau**). Kirim pengingat instalasi pada Kamis, 26 Nov (setelah sesi 9) |

**Memilih Power BI atau Tableau:** tanyakan di sesi 1 (polling Zoom) berapa peserta yang memakai Mac. Kalau ada pengguna Mac, pilih **Tableau Public** untuk seluruh kelas, karena Power BI Desktop hanya jalan di Windows. Tableau juga memberi link publik yang praktis untuk portofolio. Panduan kedua tools tersedia di materi sesi 10–11, jadi peserta yang ingin memakai tools lain tetap bisa mengikuti.

## Pengaturan Zoom

**Meeting**

- Satu meeting berulang (*recurring*, Senin/Rabu/Kamis 20.00) supaya link tidak berubah.
- Aktifkan **Waiting Room** atau passcode; nyalakan **Cloud recording** (atau *local recording*) otomatis.
- Buka meeting 10–15 menit lebih awal (19.45) untuk peserta yang ingin bertanya soal setup.
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

**Breakout room** dipakai di sesi 12 (konsultasi satu-satu) dan sesi 13 (review berpasangan). Siapkan dengan opsi **Let participants choose room** atau atur manual.

## Ritme setiap sesi

| Bagian | Durasi | Tips |
| --- | --- | --- |
| Recap | 10–15 menit | Tampilkan 1–2 jawaban PR peserta (minta izin dulu). Bahas kesalahan umum tanpa menyebut nama |
| Konsep & demo | 40–50 menit | **Ketik ulang** kode secara langsung, jangan hanya menjalankan yang sudah jadi. Kesalahan ketik yang terjadi saat demo adalah materi belajar yang berharga |
| Giliran kamu | ±10 menit | Beri waktu yang jelas ("5 menit"), lalu tampilkan jawabannya. Kalau waktu sempit, jadikan PR tambahan |
| Tanya jawab | 15–20 menit | Kalau tidak ada pertanyaan, tanyakan balik: "Bagian mana yang paling membingungkan hari ini?" |
| Penutup | 5–10 menit | Ringkasan 3 poin, PR, file yang harus diunggah, tanggal sesi berikutnya |

## Sebelum setiap sesi

- [ ] Jalankan ulang file sesi itu dari awal. Dataset TheLook diperbarui berkala, jadi angka di contoh bisa bergeser. Siapkan jawaban versi hari itu.
- [ ] Buka tab yang dibutuhkan: BigQuery/Colab, README sesi, runsheet, repo portofolio contoh.
- [ ] Siapkan notebook/query **kosong** untuk mengetik ulang saat demo, dan versi lengkap sebagai cadangan.
- [ ] Unggah rekaman sesi sebelumnya ke grup.

## Penilaian

Rubrik dari silabus, dengan panduan skor:

| Kriteria | Bobot | Sangat baik | Cukup | Kurang |
| --- | --- | --- | --- | --- |
| File SQL | 20% | 4 file lengkap, benar, setiap query diberi komentar pertanyaan bisnisnya | Lengkap, sebagian komentar | File kurang, banyak error |
| Notebook | 20% | 5 notebook dijalankan (output terlihat), pembersihan didokumentasikan, grafik berjudul kesimpulan | Lengkap, sebagian output/penjelasan hilang | Notebook kosong atau kurang |
| Dashboard | 20% | KPI benar, filter berfungsi, headline + rekomendasi, rapi | Lengkap tanpa storytelling | KPI salah atau tidak ada filter |
| README | 20% | 3 temuan dengan angka + 1 rekomendasi konkret, kata-kata sendiri | Temuan tanpa angka atau rekomendasi umum | Hanya daftar file |
| Analisis mandiri | 10% | Pertanyaan spesifik, SQL + Python, jawaban + rekomendasi | Pertanyaan terjawab sebagian | Tidak ada |
| Kerapian | 10% | Struktur folder sesuai, nama file konsisten, semua link/gambar berfungsi | Ada 1–3 link rusak atau nama file acak | Berantakan |

## Template pesan

**Pengumuman pembukaan (H-7)**

> Halo semuanya! 👋 Selamat datang di kelas **Data Analysis dengan BigQuery, Python & BI**.
>
> 📅 Mulai **Senin, 9 November 2026**, setiap **Senin, Rabu, Kamis pukul 20.00 WIB** via Zoom (13 sesi, sampai 7 Desember).
> 🔗 Link Zoom: <link>
> 📚 Materi: <link repo>
>
> **Sebelum sesi 1, mohon selesaikan checklist persiapan** (±30 menit): <link PERSIAPAN.md>
> Setelah selesai, kirim screenshot hasil query uji ke grup ini ya. Kalau ada kendala, tanya di sini, kita bantu sebelum hari Senin.

**Pengingat hari-H**

> Pengingat: **Sesi <n>, malam ini pukul 20.00 WIB.** <Topik>.
> 📝 Jangan lupa unggah PR sesi <n-1> ke portofolio GitHub kalian.
> 📂 Materi: <link folder sesi>
> 🔗 Zoom: <link>

**Setelah sesi**

> Terima kasih untuk sesi <n> malam ini! 🙏
> 🎥 Rekaman: <link>
> 📝 PR: <ringkasan PR>. Unggah ke `<path file>` sebelum sesi berikutnya (<hari, tanggal>).
> ❓ Ada kendala? Tanya di grup ini.
