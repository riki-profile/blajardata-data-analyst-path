# Runsheet Modul Tableau · Sesi 2 · Filter, Margin, Desain, dan Storytelling

Materi: [sesi-t2-filter-storytelling](../sesi-t2-filter-storytelling/) · Durasi ±100 menit

## Persiapan

- [ ] Dua versi workbook untuk demo: versi sesi 1 apa adanya, dan versi final dengan **dua dashboard** (Dashboard + Insight).
- [ ] Tentukan periode dashboard Insight (12 bulan terakhir yang lengkap) dan tulis headline contohmu dengan angka hari itu.
- [ ] Hitung Margin % per kategori. Apakah urutannya berbeda dari urutan pendapatan? Siapkan contoh untuk diskusi.
- [ ] Siapkan repo contoh `thelook-tableau-dashboard` milikmu yang sudah terisi, sebagai target akhir modul.

## Runsheet

| Menit | Bagian | Poin utama |
| --- | --- | --- |
| 0 | Recap | 5 menit: relationship, `COUNTD`, judul deskriptif |
| 5 | Filter | Range of dates + Multiple values (dropdown); **Apply to Worksheets → All Using This Data Source**; letakkan di atas |
| 25 | Margin | Margin dan Margin %; format persen; Margin % di Tooltip; pendapatan besar ≠ margin besar |
| 40 | Desain + dashboard Insight | Sebelum vs sesudah; 7 prinsip; tabel Dashboard vs Insight. Demo panduan bagian 4b: duplikat sheet, lepas filter interaktif, kunci periode, dashboard baru |
| 60 | **Kerjakan bersama** | Di dashboard Insight: headline (kesimpulan + angka + periode) + kotak rekomendasi; 2–3 peserta membacakan headline |
| 70 | **Unggah bersama** | Save to Tableau Public, Edit Details, screenshot kedua dashboard, README lengkap (headline dari Insight, link, isi, temuan, rekomendasi). **Modul Tableau selesai** |
| 85 | Tanya jawab | |
| 95 | Penutup | Jalankan **checklist hasil** di bawah. Latihan mandiri (opsional) |

## Checklist hasil (cek sebelum penutup)

Jalankan **sebelum penutup** (2–3 menit). Daftar yang sama ada di README sesi peserta (bagian *Checklist hasil*), jadi kamu bisa langsung menampilkan halaman README itu di layar, bacakan satu per satu, peserta mengetik `1` di chat kalau sudah. Yang belum: bantu sebentar, atau catat namanya untuk dibantu setelah kelas.

- [ ] Dashboard: filter tanggal + kategori berlaku untuk semua sheet Dashboard; kartu Margin % ada; judul deskriptif
- [ ] Dashboard **Insight**: periode terkunci, headline berisi **kesimpulan + angka + periode**, 2–3 sheet, kotak rekomendasi
- [ ] Uji: ubah filter di Dashboard → angka di Insight **tidak** berubah
- [ ] Tersimpan di Tableau Public dengan **Show sheets as tabs**; Edit Details terisi; link terbuka di jendela incognito
- [ ] Repo berisi `images/dashboard_final.png` dan `images/insight.png`; `README.md` lengkap, headline sama dengan dashboard Insight

## Poin penting

- Filter yang lupa di-*apply* ke semua sheet adalah kesalahan paling umum: satu grafik berubah, grafik lain tidak.
- **Dashboard vs Insight.** Kalau ada yang bertanya kenapa kesimpulan tidak ditaruh di dashboard, ubah filter kategori di depan mereka: headline "naik 9%" langsung tidak cocok.
- Headline Insight yang baik berisi kesimpulan, angka, **dan periode**.
- Link Tableau Public adalah nilai jual utama portofolio Tableau. Pastikan link di README bisa dibuka di jendela incognito.

## Kalau peserta absen atau tertinggal

| Situasi | Yang dilakukan |
| --- | --- |
| Dashboard sesi 1 hilang | Unduh `.twbx` cadangan dari link instruktur, buka, simpan ke akun sendiri, lanjutkan |
