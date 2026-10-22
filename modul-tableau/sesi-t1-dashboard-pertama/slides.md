---
marp: true
theme: default
paginate: true
size: 16:9
footer: "Modul Tableau · Sesi 1 · Dashboard Pertama"
style: |
  section {
    font-family: 'Segoe UI', 'Helvetica Neue', Arial, sans-serif;
    font-size: 30px;
    color: #202124;
    background: #ffffff;
    padding: 48px 64px;
    justify-content: flex-start;
  }
  h1 { color: #2a78d6; font-size: 46px; margin-bottom: 12px; }
  h2 { color: #2a78d6; font-size: 38px; margin-bottom: 12px; }
  h3 { color: #5f6368; font-size: 30px; }
  strong { color: #c4501f; }
  a { color: #2a78d6; }
  table { font-size: 24px; border-collapse: collapse; }
  th { background: #e8f0fb; color: #1a4f91; }
  th, td { padding: 6px 12px; border: 1px solid #dadce0; }
  code { background: #f1f3f4; color: #202124; border-radius: 4px; padding: 0 4px; }
  pre { font-size: 21px; line-height: 1.35; border-radius: 6px; }
  pre code { background: transparent; padding: 0; }
  blockquote { border-left: 6px solid #eb6834; color: #3c4043; background: #fdf1ec; padding: 10px 18px; }
  footer { color: #9aa0a6; font-size: 14px; }
  section::after { color: #9aa0a6; font-size: 14px; }
  section.lead { background: #2a78d6; color: #ffffff; justify-content: center; }
  section.lead h1, section.lead h2, section.lead h3, section.lead strong { color: #ffffff; }
  section.lead footer, section.lead::after { color: #d2e3fc; }
  section.lead code { background: rgba(255,255,255,0.2); color: #ffffff; }
  section.section { background: #f8f9fa; justify-content: center; }
  section.section h1 { font-size: 52px; }
  section.small { font-size: 25px; }
  section.small table { font-size: 20px; }
  section.small pre { font-size: 18px; }
---

<!-- _class: lead -->
<!-- _paginate: false -->

# Modul Tableau · Sesi 1

Dashboard pertama di Tableau Public

Data, relationship, calculated field, kartu KPI, grafik

---

## Selamat datang!

- Modul Tableau = **2 sesi**
- Hasil akhir: dashboard di **Tableau Public** (link publik) + repo **`thelook-tableau-dashboard`**
- Dataset: **TheLook**, toko pakaian online fiktif (lihat `KAMUS_DATA.md`)
- Peran kita: analis yang membuat dashboard untuk manajemen

| Ketik di chat | Artinya |
| --- | --- |
| `1` | Sudah berhasil |
| `2` | Error / tertinggal |
| `?` + pertanyaan | Ada pertanyaan |

---

## Agenda

| Menit | Bagian |
| --- | --- |
| 0 | Perkenalan & aturan main |
| 10 | Apa itu dashboard; unduh 3 file CSV |
| 20 | Memuat data, tipe data, relationship |
| 35 | Calculated field, kartu KPI, 2 grafik, dashboard |
| 65 | Giliran kamu |
| 75 | Tanya jawab |
| 90 | **Simpan ke Tableau Public bersama-sama** |
| 97 | Penutup & PR |

---

## Query/notebook vs dashboard

| Query / notebook | Dashboard |
| --- | --- |
| Untuk **menemukan** jawaban | Untuk **memantau** dan **membagikan** jawaban |
| Dibaca analis | Dibaca manajemen |
| Banyak langkah | Satu halaman |

---

## Rancangan dashboard kita

Satu halaman, dibaca dari atas ke bawah:

| Posisi | Isi |
| --- | --- |
| Atas | Judul berisi kesimpulan utama · filter tanggal & kategori |
| Baris KPI | Pendapatan · Jumlah pesanan · AOV · Margin % |
| Tengah | Tren pendapatan bulanan (garis) |
| Bawah | Pendapatan per kategori · grafik tambahan (PR) |

Hari ini: KPI + 2 grafik. Sesi 2: filter, margin, desain.

---

## Langkah 0 · Unduh data

Link Google Drive di grup kelas → unduh **3 file CSV ke 1 folder**

| File | Satu baris = |
| --- | --- |
| `penjualan.csv` (fakta) | satu barang terjual |
| `produk.csv` (dimensi) | satu produk |
| `pelanggan.csv` (dimensi) | satu pelanggan |

Sudah tanpa Cancelled/Returned dan tanpa bulan berjalan.

Buka juga `cek_cepat.txt`: angka untuk dicocokkan

---

## Relationship = cara menggabungkan tabel

```
produk (1) ───< penjualan >─── (1) pelanggan
  product_id = product_id     user_id = user_id
```

- Connect → **Text file** → `penjualan.csv`
- Seret `produk.csv` dan `pelanggan.csv` ke kanvas, hubungkan **ke penjualan**
- **Fakta** = kejadian · **Dimensi** = deskripsi
- Cek ikon tipe data: tanggal, `#` angka, `Abc` teks

---

## Calculated field utama

| Field | Rumus |
| --- | --- |
| Pendapatan | `SUM([Sale Price])` |
| Jumlah Pesanan | `COUNTD([Order Id])` |
| AOV | `SUM([Sale Price]) / COUNTD([Order Id])` |

`COUNTD` = count distinct: satu pesanan bisa berisi banyak barang

**Cocokkan kartu KPI dengan `cek_cepat.txt`.** Ketik `1` kalau angkanya sama.

---

## Dua grafik + dashboard

**Tren pendapatan bulanan**
- Order Date ke Columns → klik kanan → **Month** (kelompok kedua, pil hijau)
- Pendapatan ke Rows

**Pendapatan per kategori**
- Category ke Rows, Pendapatan ke Columns → **Sort Descending**

**Dashboard → New Dashboard** → susun KPI, tren, kategori + objek Text untuk judul

---

## Masalah yang sering terjadi

| Masalah | Penyebab |
| --- | --- |
| Semua kategori angkanya sama | Relationship salah |
| Jumlah pesanan terlalu besar | `SUM`/`COUNT`, harus `COUNTD` |
| Tren hanya beberapa titik | Order Date masih level YEAR |
| File lain tidak muncul | CSV tidak satu folder |
| Tidak bisa Save ke laptop | Memang begitu: Tableau Public menyimpan ke web |

---

<!-- _class: lead -->

# Giliran kamu · 10 menit

Ubah judul kedua grafik menjadi **kalimat kesimpulan**

Contoh: *"Pendapatan naik 9% dalam 12 bulan terakhir"*

---

<!-- _class: lead -->

# Simpan sekarang, bersama-sama

**File → Save to Tableau Public As…** → login → `TheLook Dashboard`

Tableau Public **tidak bisa** menyimpan ke laptop!

Ketik `1` setelah tersimpan, lalu salin link dari browser

---

## PR sesi 1

1. Tambahkan **2 grafik lagi**: per negara, kelompok umur, traffic source, atau Men vs Women
2. **Simpan lagi**: File → Save to Tableau Public
3. Screenshot dashboard
4. Buat repo **`thelook-tableau-dashboard`** (`PANDUAN_GITHUB.md`): unggah `images/dashboard_v1.png`, tulis link Tableau Public di README

Dashboard hilang? Unduh **dashboard cadangan** dari link instruktur.

---

## Ringkasan

- Dashboard = satu halaman untuk memantau & membagikan
- Fakta + dimensi, dihubungkan dengan relationship
- Pesanan = `COUNTD`
- Selalu cocokkan KPI dengan sumber lain
- Tableau Public hanya menyimpan ke web: **simpan sebelum menutup aplikasi**

**Sesi berikutnya:** filter, margin, desain, storytelling + README
