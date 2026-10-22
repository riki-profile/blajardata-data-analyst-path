# Sesi 1 · Mengenal Analisis Data dan Dasar SQL

**Selasa, 10 November 2026 · 20.00–22.00 WIB (2 jam)**

File kerja: [`01_basics.sql`](01_basics.sql)

## Tujuan sesi

Setelah sesi ini kamu bisa:

1. Menjelaskan apa yang dikerjakan seorang analis data dan alur kerjanya.
2. Menavigasi BigQuery dan menemukan tabel-tabel TheLook.
3. Menulis query dengan `SELECT`, `FROM`, `WHERE`, `ORDER BY`, dan `LIMIT`.

## Agenda

| Waktu (WIB) | Bagian |
| --- | --- |
| 20.00–20.15 | Perkenalan, aturan main kelas, cek persiapan |
| 20.15–20.35 | Apa itu analisis data; alur kerja analis; kenalan dengan TheLook |
| 20.35–21.25 | Demo: tur tabel, SELECT, WHERE, ORDER BY, LIMIT |
| 21.25–21.40 | Giliran kamu |
| 21.40–21.55 | Tanya jawab |
| 21.55–22.00 | Penutup dan PR |

## 1. Apa itu analisis data?

Analisis data adalah proses **mengubah data menjadi jawaban** atas pertanyaan, lalu menjadi **keputusan**. Analis yang baik tidak dimulai dari data, tetapi dari pertanyaan.

| Bukan pertanyaan analisis | Pertanyaan analisis yang baik |
| --- | --- |
| "Coba lihat datanya." | "Kategori produk apa yang menyumbang pendapatan terbesar tahun ini?" |
| "Penjualan bagaimana?" | "Apakah pendapatan bulanan naik atau turun dalam 12 bulan terakhir?" |
| "Pelanggan kita siapa?" | "Dari negara mana sebagian besar pelanggan kita, dan berapa umurnya?" |

Pertanyaan yang baik itu **spesifik**, **bisa diukur**, dan **jawabannya berguna untuk mengambil keputusan**.

## 2. Alur kerja analis

```
1. Tanya      →  2. Kumpulkan  →  3. Bersihkan  →  4. Analisis  →  5. Sajikan
(pertanyaan      (SQL ke           (cek data        (hitung,        (grafik, dashboard,
 bisnis)          database)         kosong, aneh)    bandingkan)     rekomendasi)
```

Di kursus ini:

| Langkah | Tools | Sesi |
| --- | --- | --- |
| Tanya | Kepala dan catatanmu | Setiap sesi |
| Kumpulkan | SQL di BigQuery | 1–4 |
| Bersihkan & analisis | Python + pandas di Colab | 5–9 |
| Sajikan | Power BI, README di GitHub | 10–13 |

## 3. Kenalan dengan TheLook

Kamu baru bergabung sebagai analis di **TheLook**, toko pakaian online. Manajemen punya tiga pertanyaan besar:

1. **Bagaimana kondisi bisnis kita?** (pendapatan, jumlah pesanan, tren)
2. **Siapa pelanggan kita?** (negara, umur, gender, perilaku belanja)
3. **Di mana peluang untuk tumbuh?** (kategori, segmen pelanggan, saluran pemasaran)

Datanya ada di BigQuery: `bigquery-public-data.thelook_ecommerce`. Penjelasan setiap tabel ada di [KAMUS_DATA.md](../../KAMUS_DATA.md).

### Mengenal layar BigQuery

- **Explorer** (kiri): daftar project, dataset, dan tabel. Klik nama tabel untuk melihat:
  - **Schema**: daftar kolom dan tipe datanya.
  - **Details**: jumlah baris dan ukuran tabel.
  - **Preview**: contoh isi tabel, **gratis** tanpa menjalankan query.
- **Editor** (tengah): tempat menulis query. Jalankan dengan tombol **Run** atau **Ctrl + Enter** (Mac: **Cmd + Enter**).
- **Query results** (bawah): hasil query. Perhatikan juga keterangan *bytes processed*.

Nama tabel lengkap di BigQuery terdiri dari tiga bagian, `project.dataset.tabel`, dan ditulis di antara backtick:

```sql
`bigquery-public-data.thelook_ecommerce.products`
```

## 4. Dasar SQL

SQL (Structured Query Language) adalah bahasa untuk "bertanya" kepada database. Struktur dasar query:

```sql
SELECT kolom1, kolom2      -- 3. kolom apa yang ditampilkan
FROM `project.dataset.tabel` -- 1. dari tabel mana
WHERE kondisi              -- 2. baris mana yang diambil
ORDER BY kolom1 DESC       -- 4. diurutkan bagaimana
LIMIT 10;                  -- 5. berapa baris yang ditampilkan
```

Angka di komentar menunjukkan **urutan BigQuery memproses** query, yang berbeda dengan urutan kita menulisnya.

| Perintah | Fungsi | Contoh |
| --- | --- | --- |
| `SELECT` | Memilih kolom | `SELECT name, brand, retail_price` |
| `SELECT *` | Semua kolom | `SELECT *` |
| `SELECT DISTINCT` | Nilai unik saja | `SELECT DISTINCT category` |
| `FROM` | Tabel sumber | ``FROM `bigquery-public-data.thelook_ecommerce.products` `` |
| `WHERE` | Filter baris | `WHERE category = 'Jeans'` |
| `ORDER BY ... DESC` | Urutkan besar → kecil | `ORDER BY retail_price DESC` |
| `ORDER BY ... ASC` | Urutkan kecil → besar (default) | `ORDER BY retail_price` |
| `LIMIT` | Batasi jumlah baris | `LIMIT 10` |
| `AS` | Memberi nama lain (alias) | `retail_price AS harga` |

### Operator di `WHERE`

| Operator | Arti | Contoh |
| --- | --- | --- |
| `=`, `!=` atau `<>` | sama dengan, tidak sama dengan | `status = 'Complete'` |
| `>`, `>=`, `<`, `<=` | perbandingan angka/tanggal | `retail_price >= 100` |
| `AND`, `OR`, `NOT` | menggabungkan kondisi | `department = 'Men' AND retail_price > 50` |
| `IN (...)` | salah satu dari daftar | `country IN ('Japan', 'France')` |
| `BETWEEN a AND b` | di antara a dan b (termasuk a dan b) | `age BETWEEN 18 AND 24` |
| `LIKE` | pola teks; `%` = teks apa saja | `name LIKE '%Hoodie%'` |
| `IS NULL`, `IS NOT NULL` | kosong / tidak kosong | `shipped_at IS NULL` |

### Aturan penulisan yang perlu diingat

- Teks ditulis dengan **tanda kutip tunggal**: `'Jeans'`. Nama tabel dengan **backtick**: `` `...` ``.
- Perbandingan teks **membedakan huruf besar-kecil**: `'jeans'` tidak sama dengan `'Jeans'`.
- Komentar diawali `--`. Pakai komentar untuk menjelaskan **kenapa** kamu menulis query itu.
- Akhiri setiap query dengan `;` jika satu tab berisi beberapa query. Untuk menjalankan satu query saja, blok query itu lalu klik **Run**.

### Soal biaya

BigQuery menghitung biaya dari **jumlah data yang dibaca**, bukan jumlah baris yang ditampilkan. `LIMIT` **tidak** mengurangi data yang dibaca. Tabel TheLook kecil (puluhan MB), jadi kuota gratis 1 TB per bulan sangat aman. Tetap biasakan:

- Pilih kolom yang kamu butuhkan saja daripada `SELECT *`.
- Pakai tab **Preview** untuk sekadar melihat isi tabel.

## 5. Demo

Buka [`01_basics.sql`](01_basics.sql), salin isinya ke editor BigQuery, dan jalankan setiap query bersama instruktur (blok query → **Run**).

| Bagian | Pertanyaan yang dijawab |
| --- | --- |
| A. Tur tabel | Apa isi tabel `users`, `orders`, `order_items`, `products`, `inventory_items`? |
| B. SELECT & ORDER BY | Apa 10 produk termahal kita? |
| C. WHERE | Produk apa saja di kategori tertentu, rentang harga tertentu, atau nama tertentu? |
| D. Menghitung | Berapa pesanan untuk setiap status? |

## 6. Giliran kamu (±10 menit)

Kerjakan di bagian **GILIRAN KAMU** di `01_basics.sql`:

1. Tampilkan 5 produk **termurah** di department `Women`, kategori `Dresses`. Tampilkan nama, brand, dan harga.
2. Ada berapa pesanan dengan status `Returned`?

## 7. PR (30–60 menit)

Kerjakan di bagian **PR** di `01_basics.sql`:

1. **Lima query filter.** Setiap query wajib diberi komentar: pertanyaan apa yang dijawab.
2. **Lima pertanyaan bisnis** untuk TheLook yang ingin kamu jawab di kursus ini. Tulis sebagai komentar di bagian bawah file.

Simpan file sebagai `01_basics.sql` di laptopmu (Notepad di Windows, atau TextEdit dalam mode *Plain Text* di Mac). Kita unggah ke GitHub bersama di sesi 2.

> **Cara mengunduh file dari repo ini:** buka `01_basics.sql` di GitHub → tombol **Download raw file** (ikon panah ke bawah di kanan atas file).

## Ringkasan

- Analisis data dimulai dari **pertanyaan bisnis**, bukan dari data.
- `SELECT` → kolom, `FROM` → tabel, `WHERE` → filter baris, `ORDER BY` → urutan, `LIMIT` → jumlah baris.
- Teks pakai `'kutip tunggal'`, nama tabel pakai `` `backtick` ``, komentar pakai `--`.
- Biaya BigQuery dihitung dari data yang dibaca, bukan dari `LIMIT`.

**Sesi berikutnya:** Kamis, 12 November 2026, 20.00 WIB. Agregasi (`COUNT`, `SUM`, `GROUP BY`) dan membuat repository portofolio di GitHub.
