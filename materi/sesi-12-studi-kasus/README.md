# Sesi 12 · Studi Kasus Terpandu: Kategori Mana yang Diprioritaskan?

**Sabtu, 5 Desember 2026 · 14.00–15.40 WIB**

| File | Fungsi |
| --- | --- |
| [`10_my_question.sql`](10_my_question.sql) | Query eksplorasi dan query final di BigQuery |
| [`10_my_question.ipynb`](10_my_question.ipynb) · [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/riki-profile/blajardata-data-analyst-path/blob/main/materi/sesi-12-studi-kasus/10_my_question.ipynb) | Analisis, grafik, dan draf jawaban di Python |

## Tentang sesi ini

Hari ini kita mengerjakan **satu analisis lengkap dari awal sampai rekomendasi**, persis seperti tugas analis sungguhan: pertanyaan bisnis → SQL → pengecekan data → analisis → grafik → rekomendasi. Instruktur memimpin setiap langkah, dan kamu menjalankannya di laptopmu.

Bedanya dengan sesi lain: kamu memilih **fokus** sendiri, sehingga angka, grafik, dan kesimpulanmu berbeda dari teman-temanmu. Hasilnya masuk portofolio sebagai studi kasus milikmu.

## Kasusnya

> Tim marketing TheLook punya anggaran promosi terbatas untuk kuartal depan dan hanya bisa memfokuskan kampanye pada **satu kategori produk**. Kategori mana yang sebaiknya dipilih?

Kita membandingkan setiap kategori dengan 4 ukuran:

| Ukuran | Pertanyaan | Cara hitung |
| --- | --- | --- |
| Porsi pendapatan | Seberapa besar kategori ini sekarang? | pendapatan kategori ÷ total pendapatan |
| Pertumbuhan | Apakah permintaannya naik? | pendapatan 12 bulan terakhir vs 12 bulan sebelumnya |
| Margin % | Seberapa untung? | (harga jual − biaya) ÷ harga jual |
| Tingkat retur | Seberapa sering dikembalikan? | barang Returned ÷ barang terjual |

Lalu kategori dikelompokkan ke dalam **matriks prioritas**:

| | Tumbuh cepat | Tumbuh lambat |
| --- | --- | --- |
| **Porsi besar** | **Andalan** | **Mesin Uang** |
| **Porsi kecil** | **Bintang Baru** ← peluang terbaik | **Perlu Ditinjau** |

## Pilih fokusmu (sebelum kelas)

| Pilihan | Contoh |
| --- | --- |
| Department (wajib) | `Women` atau `Men` |
| Negara (opsional) | `United States`, `China`, `Brasil`, ... atau semua negara |

Contoh kombinasi: "Men di China", "Women di semua negara", "Women di United States". Tulis pilihanmu di chat Zoom saat sesi dimulai.

## Agenda

| Waktu (WIB) | Langkah | Yang kamu kerjakan |
| --- | --- | --- |
| 14.00–14.10 | Pembukaan | Kasus dan 4 ukuran; tulis fokusmu di chat |
| 14.10–14.30 | **Langkah 1–2: SQL** | Jalankan query eksplorasi 1a–1c dan query final di BigQuery dengan fokusmu |
| 14.30–14.40 | **Langkah 3–4: muat dan cek data** | Notebook bagian 2–4 |
| 14.40–14.55 | **Langkah 5–6: hitung ukuran dan matriks** | Notebook bagian 5–6 |
| 14.55–15.10 | **Langkah 7–9: rekomendasi dan grafik** | Notebook bagian 7–9 |
| 15.10–15.25 | **Langkah 10–11: tulis jawaban** | Tulis ulang draf jawaban dengan kata-katamu; 3–4 peserta membacakan hasilnya |
| 15.25–15.35 | Unggah ke portofolio | Folder `my_question/` + gambar + bagian README |
| 15.35–15.40 | Penutup | PR |

## Hal baru di sesi ini

- **`CASE WHEN` di dalam `SUM`**: menjumlahkan hanya baris yang memenuhi syarat, sehingga satu query bisa menghasilkan angka "12 bulan terakhir" dan "12 bulan sebelumnya" sekaligus.
- **f-string untuk SQL**: memasukkan pilihan fokus ke dalam query dari Python.
- **Scatter plot dengan garis median**: cara klasik membagi data menjadi 4 kuadran.
- **Aturan keputusan yang tertulis**: rekomendasi dipilih dengan aturan yang jelas, bukan selera, sehingga bisa diperiksa dan diulang orang lain.

## Yang diunggah ke portofolio

| File | Lokasi di repo |
| --- | --- |
| `10_my_question.sql` (sudah diganti fokusmu dan diisi jawaban singkat) | `my_question/10_my_question.sql` |
| `10_my_question.ipynb` (semua sel sudah dijalankan) | `my_question/10_my_question.ipynb` |
| 2 grafik `12_...png` | `images/` |

## PR (30–45 menit)

1. Pastikan bagian 11 notebook berisi jawaban dengan **kata-katamu sendiri**, bukan salinan draf.
2. Isi bagian **Studi kasus** di README portofoliomu (lihat [template](../../template-portofolio/thelook-analysis/README.md)): pertanyaan, fokus, jawaban, rekomendasi, dan grafik matriks prioritas.
3. *(Opsional, nilai tambah)* Jalankan ulang notebook dengan fokus lain (misalnya department yang satunya). Apakah rekomendasinya sama? Tulis satu kalimat perbandingannya.

**Sesi berikutnya:** Selasa, 8 Desember 2026, 20.00 WIB. Merapikan dan menerbitkan portofolio (sesi terakhir!).
