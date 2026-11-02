# Modul Tableau · Sesi 2 · Filter, Margin, Desain, dan Storytelling

**Durasi:** 1,5 jam (±100 menit) · Jadwal mengikuti kelas

| File | Fungsi |
| --- | --- |
| [panduan-tableau.md](panduan-tableau.md) | Filter, margin, dan desain di Tableau Public |
| [Template README Tableau](../template-portofolio/README.md) | README repo `thelook-tableau-dashboard` |

> **Dashboard sesi 1 hilang?** Unduh dashboard cadangan (`.twbx`) dari grup kelas, buka dengan **File → Open**, simpan ke akun Tableau Public-mu, lalu ikuti sesi ini seperti biasa.

## Tujuan sesi

Setelah sesi ini kamu bisa:

1. Menambahkan filter tanggal dan kategori yang memengaruhi seluruh dashboard.
2. Membuat calculated field **margin** dan **margin %**.
3. Merapikan dashboard dengan prinsip desain: hierarki, keselarasan, satu warna sorotan.
4. Membedakan **dashboard** (memantau) dan **dashboard Insight** (melaporkan), lalu membuat Insight: kesimpulan → bukti → rekomendasi.
5. Menulis README repo `thelook-tableau-dashboard`, hasil akhir modul Tableau.

## Agenda

| Menit | Bagian |
| --- | --- |
| 0–5 | Recap sesi 1 |
| 5–25 | Demo: filter tanggal dan kategori |
| 25–40 | Demo: calculated field margin dan margin % |
| 40–60 | Desain dashboard; dashboard vs laporan; membuat dashboard **Insight** |
| 60–70 | **Kerjakan bersama**: headline + rekomendasi di dashboard Insight |
| 70–85 | **Unggah bersama**: dashboard final + README `thelook-tableau-dashboard` |
| 85–95 | Tanya jawab |
| 95–100 | Penutup |

## 1. Filter

| Filter | Jenis | Kenapa |
| --- | --- | --- |
| Tanggal (`Order Date`) | Range of dates | Pembaca bisa melihat periode tertentu |
| Kategori (`Category`) | Multiple values (dropdown) | Pembaca bisa fokus ke kategori tertentu |

Filter harus memengaruhi **semua** sheet: klik kanan filter → **Apply to Worksheets → All Using This Data Source**. Letakkan filter di **satu baris di atas**.

## 2. Margin

**Margin** = pendapatan − biaya pokok. **Margin %** = margin ÷ pendapatan.

| Field | Rumus Tableau |
| --- | --- |
| Margin | `SUM([Sale Price]) - SUM([Cost])` |
| Margin % | `(SUM([Sale Price]) - SUM([Cost])) / SUM([Sale Price])` |

Kategori dengan pendapatan terbesar belum tentu yang paling **menguntungkan**. Taruh Margin % di **Tooltip** grafik kategori, lalu bandingkan.

## 3. Prinsip desain dashboard

1. **Hierarki: yang paling penting di kiri atas.** Judul dan filter → KPI → tren → rincian.
2. **Judul deskriptif**: apa yang diukur + satuan. Angka berubah mengikuti filter, jadi judul tidak boleh berisi kesimpulan.
3. **Satu warna utama, satu warna sorotan.**
4. **Sejajarkan dan beri jarak yang sama**; ukuran kartu KPI sama.
5. **Buang yang tidak perlu:** garis grid tebal, legend untuk grafik satu warna, desimal berlebihan.
6. **Satuan selalu jelas:** USD, %, jumlah pesanan.
7. **5 detik:** langsung jelas apa yang dipantau dan di mana angkanya.

## 4. Dashboard vs dashboard Insight

Dashboard adalah **helicopter view** untuk memantau dan menjelajah. Kesimpulan analis ditulis di **dashboard kedua** dalam workbook yang sama, bukan di atas dashboard.

| | **Dashboard** | **Insight** |
| --- | --- | --- |
| Tujuan | Memantau, menjelajah dengan filter | Menyampaikan satu kesimpulan + rekomendasi |
| Judul | Deskriptif: "Pendapatan bulanan (USD)" | Kesimpulan + angka + periode |
| Filter | Aktif, pembaca yang memilih | Periode dikunci |
| Yang menyimpulkan | Pembaca | Analis (kamu) |

Isi dashboard Insight: **headline** (kesimpulan + angka + periode, misalnya "Nov 2025–Okt 2026: pendapatan naik 9%, didorong Outerwear dan Jeans"), **2–3 sheet** pendukung, dan **objek Text** berisi rekomendasi. Cara membuatnya ada di [panduan Tableau bagian 4b](panduan-tableau.md#4b-dashboard-insight).

## 5. Kerjakan bersama (±10 menit)

Instruktur mengerjakannya langkah demi langkah di layar, dan kamu mengikuti di dashboard-mu:

1. Buat dashboard **Insight** (duplikat sheet, kunci periode, susun dashboard baru).
2. Tulis **headline**: kesimpulan + angka + periode, di paling atas.
3. Tambahkan objek **Text** berisi rekomendasi (1–2 kalimat).

## 6. Unggah bersama (di kelas)

Bersama instruktur:

1. **File → Save to Tableau Public** (link tetap sama). Di halaman Tableau Public-mu: **Edit Details** → tulis deskripsi singkat.
2. Screenshot kedua dashboard → unggah `images/dashboard_final.png` dan `images/insight.png` ke repo `thelook-tableau-dashboard`.
3. `README.md` → tempel [template README Tableau](../template-portofolio/README.md) → isi headline dari dashboard Insight, link Tableau Public, isi dashboard, temuan, rekomendasi.

Di akhir sesi, **portofolio modul Tableau-mu selesai**.

## 7. Latihan mandiri (opsional)

Tidak wajib dan tidak dinilai: rapikan desain lebih jauh (font, warna, perataan), atau buat dashboard kedua untuk analisis pelanggan.

## Checklist hasil (dicek bersama sebelum kelas ditutup)

Sebelum kelas ditutup, instruktur membacakan daftar ini satu per satu. Ketik `1` di chat kalau sudah, `2` kalau belum; yang belum akan dibantu. Kalau kamu absen, pakai daftar ini untuk mengecek hasilmu setelah menonton rekaman.

- [ ] Dashboard: filter tanggal + kategori berlaku untuk semua sheet Dashboard; kartu Margin % ada; judul deskriptif
- [ ] Dashboard **Insight**: periode terkunci, headline berisi **kesimpulan + angka + periode**, 2–3 sheet, kotak rekomendasi
- [ ] Uji: ubah filter di Dashboard → angka di Insight **tidak** berubah
- [ ] Tersimpan di Tableau Public dengan **Show sheets as tabs**; Edit Details terisi; link terbuka di jendela incognito
- [ ] Repo berisi `images/dashboard_final.png` dan `images/insight.png`; `README.md` lengkap, headline sama dengan dashboard Insight

## Ringkasan

- Filter di satu baris atas, berlaku untuk semua sheet.
- Pendapatan besar belum tentu margin besar.
- Dashboard: judul deskriptif, filter aktif, satu warna sorotan.
- Insight: headline (kesimpulan + angka + periode) → bukti → rekomendasi, dengan periode terkunci.
- **Modul Tableau selesai.** Link Tableau Public + repo `thelook-tableau-dashboard` adalah portofolionya.
