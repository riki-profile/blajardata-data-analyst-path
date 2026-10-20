# Sesi 12 · Analisis Mandiri: Menjawab Pertanyaanmu Sendiri

**Sabtu, 5 Desember 2026 · 14.00–15.40 WIB**

| File | Fungsi |
| --- | --- |
| [`template/10_my_question.sql`](template/10_my_question.sql) | Template query |
| [`template/10_my_question.ipynb`](template/10_my_question.ipynb) · [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/riki-profile/blajardata-data-analyst-path/blob/main/materi/sesi-12-analisis-mandiri/template/10_my_question.ipynb) | Template notebook |

## Tujuan sesi

Setelah sesi ini kamu bisa:

1. Mengubah rasa ingin tahu menjadi pertanyaan bisnis yang spesifik dan bisa dijawab.
2. Menjalankan seluruh alur analis sendiri: pertanyaan → SQL → pembersihan → analisis → grafik → rekomendasi.
3. Menerima dan memakai masukan untuk memperbaiki analisis.

## Format sesi

Sesi ini adalah **sesi kerja**: kamu mengerjakan analisismu sendiri, sementara instruktur memberi masukan satu per satu.

| Waktu (WIB) | Bagian |
| --- | --- |
| 14.00–14.10 | Recap: contoh pertanyaan yang baik vs kurang baik (dari pertanyaan yang dikirim peserta) |
| 14.10–14.20 | Alur kerja analisis mandiri dan cara memakai template |
| 14.20–15.20 | **Kerja mandiri + konsultasi satu-satu** (±5 menit per peserta di *breakout room*) |
| 15.20–15.35 | 2–3 peserta berbagi progres (sukarela) |
| 15.35–15.40 | Penutup dan PR |

**Saat konsultasi, siapkan:** (1) pertanyaanmu dalam satu kalimat, (2) query atau grafik yang sudah ada, (3) satu hal yang membuatmu bingung.

## Pertanyaan yang baik

| Kriteria | Kurang baik | Lebih baik |
| --- | --- | --- |
| Spesifik | "Bagaimana penjualan?" | "Kategori apa yang pendapatannya tumbuh paling cepat dalam 12 bulan terakhir?" |
| Bisa dijawab dengan data TheLook | "Kenapa pelanggan suka brand X?" | "Apakah pelanggan yang membeli brand X lebih sering kembali berbelanja?" |
| Berguna untuk keputusan | "Berapa umur pelanggan tertua?" | "Kelompok umur mana yang AOV-nya tertinggi, untuk menentukan target iklan?" |
| Cakupan pas untuk 1–2 jam | "Analisis lengkap semua pelanggan" | Satu pertanyaan utama, maksimal dua pertanyaan pendukung |

## Ide pertanyaan

Boleh dipakai langsung atau dimodifikasi. Pertanyaan buatanmu sendiri tetap lebih baik.

**Produk**
- Kategori mana yang margin %-nya tinggi tetapi pendapatannya masih kecil (peluang untuk didorong)?
- Kategori/brand mana yang paling sering dikembalikan (`status = 'Returned'`)?
- Apakah produk mahal (> 100 USD) lebih sering dikembalikan daripada produk murah?

**Pelanggan**
- Traffic source mana yang membawa pelanggan dengan nilai belanja total tertinggi?
- Berapa hari rata-rata jarak antara pesanan pertama dan kedua?
- Apakah pelanggan yang pesanan pertamanya di kategori tertentu lebih mungkin kembali?

**Operasional**
- Berapa lama rata-rata pesanan dikirim dan diterima? Apakah berbeda per negara atau per gudang (`distribution_centers`)?
- Berapa persen pesanan yang dibatalkan, dan apakah tren pembatalan naik?

**Perilaku di website** (tabel `events`)
- Berapa persen sesi yang berakhir dengan pembelian (`event_type = 'purchase'`)? Bagaimana per traffic source?
- Di tahap mana pengunjung paling banyak berhenti: `product` → `cart` → `purchase`?

## Alur kerja

1. **Tulis pertanyaan dan hipotesis** di bagian atas `10_my_question.sql` dan notebook.
2. **SQL dulu:** eksplorasi tabel yang relevan di BigQuery, lalu tulis query final yang menghasilkan data untuk analisis. Simpan di `10_my_question.sql`.
3. **Python:** tempel query ke notebook, cek dan bersihkan data, analisis, buat **satu grafik utama**.
4. **Jawab:** tulis jawaban dengan angka, apakah hipotesismu benar, satu rekomendasi, dan keterbatasan analisis.
5. **Unggah** ke folder `my_question/` di portofolio.

## PR (30–60 menit)

1. Selesaikan analisismu. Unggah ke portofolio:
   - `my_question/10_my_question.sql`
   - `my_question/10_my_question.ipynb`
   - grafik utama ke `images/`
2. Lengkapi bagian **Temuan** dan **Rekomendasi** di README portofolio, termasuk hasil analisis mandirimu.
3. Bawa README-mu ke sesi 13 untuk *review*.

**Sesi berikutnya:** Selasa, 8 Desember 2026, 20.00 WIB. Merapikan dan menerbitkan portofolio (sesi terakhir!).
