# Sesi 3 · JOIN: Menggabungkan Tabel

**Sabtu, 14 November 2026 · 14.00–15.40 WIB**

File kerja: [`03_joins.sql`](03_joins.sql)

## Tujuan sesi

Setelah sesi ini kamu bisa:

1. Menjelaskan kenapa data disimpan di beberapa tabel, dan apa itu *key*.
2. Menggabungkan tabel dengan `INNER JOIN` dan `LEFT JOIN`.
3. Menghitung pendapatan per kategori, negara, dan gender dengan benar.
4. Menghindari jebakan umum JOIN: baris ganda dan angka yang membengkak.

## Agenda

| Waktu (WIB) | Bagian |
| --- | --- |
| 14.00–14.05 | Recap sesi 2 |
| 14.05–14.20 | Konsep: key, relasi tabel, jenis JOIN |
| 14.20–14.55 | Demo JOIN |
| 14.55–15.10 | **Kerjakan bersama** |
| 15.10–15.20 | **Unggah bersama** `03_joins.sql` |
| 15.20–15.37 | Tanya jawab |
| 15.37–15.40 | Penutup |

## 1. Kenapa data dipisah ke beberapa tabel?

Kalau semua informasi ada dalam satu tabel, nama dan negara pelanggan harus ditulis ulang di setiap barang yang ia beli. Boros, dan kalau pelanggan pindah negara, ratusan baris harus diubah. Karena itu database memisahkan data per "hal": pelanggan, pesanan, barang, produk. Tabel-tabel itu dihubungkan dengan **key**.

- **Primary key**: kolom yang unik di tabelnya sendiri. Contoh: `users.id`, `products.id`.
- **Foreign key**: kolom yang menunjuk ke primary key tabel lain. Contoh: `order_items.product_id` menunjuk ke `products.id`.

```
users ──< orders ──< order_items >── products
  id   =  user_id
           order_id = order_id
                       product_id = id
```

Daftar lengkap pasangan key ada di [KAMUS_DATA.md](../../KAMUS_DATA.md#hubungan-antar-tabel).

## 2. Jenis JOIN

| JOIN | Hasilnya | Kapan dipakai |
| --- | --- | --- |
| `INNER JOIN` (atau `JOIN`) | Hanya baris yang **cocok di kedua tabel** | Hampir selalu, misalnya barang + info produknya |
| `LEFT JOIN` | **Semua** baris tabel kiri; kolom tabel kanan diisi NULL jika tidak cocok | Mencari yang "tidak punya", misalnya pelanggan yang belum pernah memesan |

```sql
SELECT
  p.category,
  ROUND(SUM(oi.sale_price), 0) AS pendapatan
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN `bigquery-public-data.thelook_ecommerce.products` AS p
  ON oi.product_id = p.id
WHERE oi.status NOT IN ('Cancelled', 'Returned')
GROUP BY p.category
ORDER BY pendapatan DESC;
```

- `AS oi` dan `AS p` adalah **alias tabel**: nama pendek supaya query mudah dibaca.
- `oi.sale_price` berarti "kolom `sale_price` dari tabel `oi`". Wajib dipakai jika nama kolom yang sama ada di dua tabel (misalnya `id`, `status`, `created_at`).
- `ON` menyebutkan pasangan key yang dicocokkan.

## 3. Jebakan JOIN

1. **Lupa `ON` atau salah key** → jumlah baris meledak, atau angka tidak masuk akal. Contoh salah: `ON oi.id = p.id` (ID baris barang dicocokkan dengan ID produk).
2. **Angka membengkak (fan-out).** Kalau `orders` di-JOIN ke `order_items`, setiap pesanan muncul sekali **per barang**. Menjumlahkan kolom milik `orders` setelah JOIN itu akan menghitung dobel. Gunakan `COUNT(DISTINCT o.order_id)` untuk menghitung pesanan.
3. **Kolom ambigu.** Error `Column name status is ambiguous` berarti kamu perlu menulis `oi.status` atau `o.status`.

**Kebiasaan baik:** setelah JOIN, cek jumlah baris dengan `COUNT(*)` dan bandingkan dengan tabel aslinya.

## 4. Demo

Buka [`03_joins.sql`](03_joins.sql) dan jalankan bersama instruktur.

| Bagian | Pertanyaan |
| --- | --- |
| A. JOIN pertama | Setiap barang terjual itu produk apa? |
| B. Pendapatan per kategori | Versi tepat dari sesi 2. Kenapa angkanya berbeda? |
| C. JOIN pesanan + pelanggan | Negara mana yang paling banyak memesan? |
| D. JOIN tiga tabel | Pendapatan per gender dan kategori |
| E. LEFT JOIN | Berapa pelanggan yang belum pernah memesan? |
| F. Jebakan fan-out | Kenapa angka bisa membengkak? |

## 5. Kerjakan bersama (±15 menit)

Instruktur mengerjakannya langkah demi langkah di layar, dan kamu mengetik bersamaan di file kerjamu. Tidak perlu menebak jawabannya sendiri dulu.

1. Pendapatan per **department** (`Men`/`Women`) untuk setiap **negara**. Tampilkan 10 baris teratas.
2. Rata-rata nilai pesanan (AOV) per negara, khusus pelanggan perempuan (`gender = 'F'`). AOV = total pendapatan ÷ jumlah pesanan unik.

## 6. Unggah bersama (di kelas)

Bersama instruktur: repo `thelook-sql-analysis` → folder `sql` → **Add file → Upload files** → `03_joins.sql` → **Commit changes**.

## 7. Latihan mandiri (opsional)

Tidak wajib dan tidak dinilai. Untuk yang ingin berlatih lebih, kerjakan bagian **LATIHAN MANDIRI** di file kerja; jawabannya dibagikan instruktur setelah kelas.

- **Pendapatan per kelompok umur dan gender.** Kelompok umur per 10 tahun: `FLOOR(u.age / 10) * 10` (umur 23 → 20, umur 37 → 30). Tampilkan kelompok umur, gender, pelanggan unik, pesanan unik, dan pendapatan, plus 2 kalimat temuan.

## Checklist hasil (dicek bersama sebelum kelas ditutup)

Sebelum kelas ditutup, instruktur membacakan daftar ini satu per satu. Ketik `1` di chat kalau sudah, `2` kalau belum; yang belum akan dibantu. Kalau kamu absen, pakai daftar ini untuk mengecek hasilmu setelah menonton rekaman.

- [ ] B1–B2 terisi di `03_joins.sql` dan hasilnya keluar
- [ ] `sql/03_joins.sql` ada di repo `thelook-sql-analysis`
- [ ] Repo sekarang berisi 3 file di folder `sql/`

## Ringkasan

- Tabel dihubungkan dengan key; `ON` menyebutkan pasangan key-nya.
- `JOIN` = hanya yang cocok di kedua tabel; `LEFT JOIN` = semua baris tabel kiri.
- Pakai alias tabel (`oi`, `p`, `u`, `o`) dan tulis `alias.kolom`.
- Hitung pesanan dengan `COUNT(DISTINCT order_id)` setelah JOIN ke `order_items`.

**Sesi berikutnya:** Selasa, 17 November 2026, 20.00 WIB. Tanggal, CASE WHEN, CTE, dan pembersihan data dasar.
