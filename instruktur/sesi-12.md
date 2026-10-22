# Runsheet Sesi 12 · Studi Kasus Terpandu

**Sabtu, 5 Desember 2026 · 14.00–15.40 WIB** · Materi: [materi/sesi-12-studi-kasus](../materi/sesi-12-studi-kasus/)

## Konsep sesi

Sesi ini **dipimpin penuh oleh instruktur**: kamu berbagi layar dan menjalankan setiap langkah, dan peserta mengikuti dengan fokus pilihannya sendiri (department + opsional negara). Tidak ada kerja mandiri yang panjang, jadi tidak ada "dead air".

Interaksi dijaga dengan **pertanyaan pemandu** di setiap langkah (lihat di bawah). Ajukan pertanyaannya, beri waktu 20–30 detik untuk menjawab di chat, lalu bacakan atau berikan jawabannya. Kalau tidak ada yang menjawab, tunjuk nama atau langsung berikan jawabannya. Jangan menunggu terlalu lama.

## Persiapan (Jumat malam / Sabtu pagi)

File kunci: [`kunci-jawaban/10_my_question.sql`](kunci-jawaban/10_my_question.sql) dan [`kunci-jawaban/10_my_question.ipynb`](kunci-jawaban/10_my_question.ipynb) (bagian 11 sudah berisi contoh jawaban).


- [ ] Jalankan `10_my_question.sql` dan notebook untuk **Women** dan **Men**, semua negara. Isi tabel "Hasil hari ini" di bawah.
- [ ] Baca judul kedua grafik dan draf jawaban. Pastikan kalimatnya sesuai dengan grafiknya.
- [ ] Siapkan 2–3 kombinasi negara (misalnya Men di China, Women di United States) untuk ditunjukkan bahwa rekomendasinya bisa berbeda.
- [ ] Ingatkan di grup (Jumat malam): "Besok jam 14.00 studi kasus. Siapkan login BigQuery + Colab dan pilih fokus: Women atau Men (opsional: satu negara)."

**Hasil hari ini** (isi sebelum kelas):

| Fokus | Kategori Andalan | Bintang Baru | Rekomendasi | Pertumbuhan | Margin % | Retur % |
| --- | --- | --- | --- | --- | --- | --- |
| Women, semua negara | | | | | | |
| Men, semua negara | | | | | | |

## Runsheet dan pertanyaan pemandu

### 14.00 · Pembukaan (10 menit)

Ceritakan kasusnya: anggaran promosi terbatas, hanya satu kategori. Tampilkan tabel 4 ukuran dan matriks prioritas di README sesi.

Minta semua peserta menulis fokusnya di chat, misalnya `Women - China`. Kalau ada yang bingung, sarankan `Women` atau `Men` saja tanpa negara.

**Pertanyaan pemandu**

| Tanya | Jawaban |
| --- | --- |
| "Kalau kalian manajer, apakah cukup melihat kategori dengan pendapatan terbesar?" | Tidak. Kategori terbesar mungkin sudah jenuh (tumbuh lambat), atau marginnya tipis. Kita butuh beberapa sudut pandang: besar, tumbuh, untung, dan risiko retur. |
| "Sebelum melihat data, kategori apa yang kalian tebak akan terpilih?" | Tidak ada jawaban benar. Catat 2–3 tebakan di chat, lalu bandingkan di akhir sesi. Ini membuat peserta ikut terlibat. |

### 14.10 · Langkah 1–2: SQL di BigQuery (20 menit)

Buka `10_my_question.sql`. Ganti `'Women'` dengan fokusmu (demo dengan Women). Jalankan 1a, 1b, 1c, lalu query final.

| Tanya | Jawaban |
| --- | --- |
| (1b) "Kenapa periodenya 12 bulan **lengkap**, bukan sampai hari ini?" | Bulan berjalan belum selesai. Kalau ikut dihitung, periode terakhir selalu terlihat lebih kecil. |
| "Kenapa membandingkan 12 bulan dengan 12 bulan, bukan bulan ini dengan bulan lalu?" | Penjualan pakaian musiman (misalnya Swim naik di musim panas, Outerwear di musim dingin). Periode 12 bulan penuh menghilangkan efek musim. |
| (query final) "Kenapa `Cancelled` dibuang, tapi `Returned` tidak?" | Barang Cancelled tidak pernah dikirim, jadi bukan penjualan. Barang Returned sempat terjual lalu dikembalikan; kita butuh untuk menghitung tingkat retur. Di kolom pendapatan, Returned dikeluarkan lewat `CASE WHEN`. |
| "Apa fungsi `CASE WHEN` di dalam `SUM`?" | Menjumlahkan hanya baris yang memenuhi syarat. Satu query bisa menghitung pendapatan dua periode sekaligus, seperti beberapa filter kecil, satu per kolom. |

Pastikan semua peserta mendapat hasil query final ("ketik 1"). Peserta yang error biasanya lupa mengganti department di **semua** tempat, atau salah ketik `'women'` (huruf kecil).

### 14.30 · Langkah 3–4: muat dan cek data (10 menit)

Notebook bagian 2–4. Isi `FOKUS_DEPARTMENT` dan `FOKUS_NEGARA`, lalu `PROJECT_ID`.

| Tanya | Jawaban |
| --- | --- |
| "Bagaimana fokus kita masuk ke dalam SQL?" | Lewat f-string: `{FOKUS_DEPARTMENT}` diganti dengan nilai variabelnya sebelum query dikirim ke BigQuery. |
| "Total pendapatan 12 bulan terakhir lebih besar atau lebih kecil dari 12 bulan sebelumnya? Apa artinya?" | Biasanya lebih besar, karena data TheLook tumbuh dari tahun ke tahun. Artinya hampir semua kategori akan terlihat tumbuh, sehingga kita membandingkan **relatif** terhadap median, bukan "tumbuh atau tidak". |

### 14.40 · Langkah 5–6: 4 ukuran dan matriks prioritas (15 menit)

| Tanya | Jawaban |
| --- | --- |
| "Kenapa kategori dengan porsi < 1% dipisahkan?" | Angka pertumbuhannya tidak stabil. Naik dari 100 ke 300 USD = 200%, padahal nilainya kecil. Mereka bisa "menang" hanya karena kebetulan. |
| "Kenapa batasnya median, bukan rata-rata?" | Median membagi kategori tepat setengah-setengah dan tidak terpengaruh satu kategori yang ekstrem (ingat sesi 9). |
| "Kategori di kuadran **Mesin Uang**, apakah buruk?" | Tidak. Mereka penyumbang pendapatan besar dan tetap harus dijaga. Hanya saja, menambah anggaran promosi di sana kemungkinan memberi tambahan kecil, karena pertumbuhannya sudah lambat. |
| "Apa bedanya **Bintang Baru** dan **Andalan**?" | Sama-sama tumbuh cepat. Bintang Baru masih kecil, jadi ruang tumbuhnya lebih besar dan anggaran promosi lebih terasa dampaknya. Andalan sudah besar dan sudah jalan sendiri. |

### 14.55 · Langkah 7–9: rekomendasi dan grafik (15 menit)

| Tanya | Jawaban |
| --- | --- |
| "Kenapa aturan keputusannya ditulis eksplisit?" | Supaya bisa diperiksa dan diulang orang lain. Rekomendasi tanpa aturan terlihat seperti selera pribadi. |
| "Kenapa memilih margin tertinggi di antara kandidat?" | Dengan anggaran yang sama, kategori bermargin tinggi menghasilkan **keuntungan** lebih besar per dolar penjualan tambahan. |
| "Rekomendasiku tingkat returnya di atas median. Batalkan?" | Tidak harus. Catat sebagai risiko dan sarankan langkah pendamping, misalnya memperbaiki panduan ukuran atau foto produk. Analis menyebutkan risiko, bukan menyembunyikannya. |
| "Siapa yang rekomendasinya berbeda dengan instruktur?" | Minta 2–3 peserta dengan fokus berbeda menyebutkan hasilnya di chat. Tunjukkan bahwa fokus mengubah jawaban, itulah yang membuat portofolio masing-masing unik. |

### 15.10 · Langkah 10–11: menulis jawaban (15 menit)

Jalankan sel draf jawaban. Beri **7 menit** untuk menulis ulang bagian 11 dengan kata-kata sendiri, lalu minta 3–4 peserta membacakannya (tunjuk kalau tidak ada sukarelawan).

Kriteria jawaban yang baik:

- Menyebut fokus dan periode.
- Menyebut angka (porsi, pertumbuhan, margin).
- Rekomendasi berupa **tindakan** ("fokuskan promosi kuartal depan pada ...") plus cara mengukur keberhasilannya.
- Menyebut minimal satu keterbatasan.

**Contoh jawaban yang baik** (ganti nama kategori dan angka dengan hasil hari itu):

> Untuk produk Women, saya merekomendasikan TheLook memprioritaskan **[Kategori]** pada kuartal depan. Kategori ini baru menyumbang [X]% pendapatan, tetapi tumbuh [Y]% dalam 12 bulan terakhir, di atas median semua kategori ([Z]%), dan marginnya [M]%, termasuk yang tertinggi. Promosi di kategori yang sedang naik dan menguntungkan ini kemungkinan memberi hasil lebih besar daripada di kategori besar yang pertumbuhannya sudah melambat. Keberhasilan diukur dari pertumbuhan pendapatan [Kategori] kuartal depan dibanding kuartal yang sama tahun lalu. Keterbatasan: data TheLook sintetis, dan analisis ini belum memperhitungkan biaya promosi.

Tutup langkah ini dengan kembali ke tebakan di awal sesi: "Siapa yang tebakannya benar?"

### 15.25 · Unggah ke portofolio (10 menit)

Unggah bersama di repo **`thelook-python-analysis`**: buat folder `my_question/` (Create new file `my_question/README.md`), unggah `.sql` dan `.ipynb`, unggah 2 gambar ke `images/`, lalu isi bagian **Studi kasus** di README bersama-sama.

### 15.35 · Penutup

Pastikan sebelum menutup: jawaban dengan kata-kata sendiri (langkah 10–11) dan bagian Studi kasus di README `thelook-python-analysis` sudah terisi. Latihan mandiri (opsional): jalankan ulang dengan fokus lain. Sesi 13 = merapikan dan menerbitkan portofolio.

## Kalau waktu kurang

Urutan yang boleh dipotong: (1) query eksplorasi 1a–1c (cukup jalankan query final), (2) grafik 2 (margin), (3) membacakan jawaban. **Jangan potong** langkah 10–11 (menulis jawaban), karena itu inti nilai portofolionya.

## Masalah yang sering muncul

| Masalah | Solusi |
| --- | --- |
| Hasil query kosong | `'women'` huruf kecil, atau nama negara salah eja (`'Brazil'` vs `'Brasil'`). Cek dengan `SELECT DISTINCT country` |
| Error (`ValueError`) di bagian 7 | Fokus negara terlalu sempit sehingga hampir semua kategori < 1% dan terbuang. Pilih negara yang lebih besar atau hapus fokus negara |
| `ZeroDivisionError` / angka `inf` | Kategori tanpa penjualan di periode sebelumnya; sudah dipisahkan di bagian 5. Pastikan sel itu dijalankan |
| Label grafik bertumpuk | Biasanya tetap terbaca. Kalau sangat parah, perbesar `figsize` di `plt.rcParams` menjadi `(12, 7)` |
