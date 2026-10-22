---
marp: true
theme: default
paginate: true
size: 16:9
footer: "Sesi 10 · Dashboard Pertama di Power BI"
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

# Sesi 10 · Dashboard Pertama di Power BI

Data, relasi, measure DAX, kartu KPI, grafik

Selasa, 1 Desember 2026 · 20.00–21.40 WIB

---

## Selamat datang, peserta modul Power BI!

- Modul Power BI = **sesi 10 dan 11**
- Hasil akhir: repo portofolio **`thelook-powerbi-dashboard`** berisi dashboard + README
- Dataset: **TheLook**, toko pakaian online fiktif (lihat `KAMUS_DATA.md`)
- Peran kita: analis yang membuat dashboard untuk manajemen

| Ketik di chat | Artinya |
| --- | --- |
| `1` | Sudah berhasil |
| `2` | Error / tertinggal |
| `?` + pertanyaan | Ada pertanyaan |

---

## Agenda

| Waktu | Bagian |
| --- | --- |
| 20.00 | Recap modul Python · sambutan peserta baru |
| 20.10 | Apa itu dashboard; unduh 3 file CSV |
| 20.20 | Memuat data, tipe data, relasi |
| 20.35 | Measure DAX, kartu KPI, 2 grafik |
| 21.05 | **Kerjakan bersama**: judul + grafik ketiga |
| 21.15 | **Simpan bersama**: `.pbix`, PDF, screenshot |
| 21.22 | **Unggah bersama**: repo `thelook-powerbi-dashboard` |
| 21.32 | Tanya jawab |
| 21.38 | Penutup |

Panduan langkah demi langkah: `panduan-power-bi.md`

---

## Notebook vs dashboard

| Notebook / query | Dashboard |
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
| Bawah | Pendapatan per kategori · pendapatan per negara (dibuat bersama) |

Hari ini: KPI + 2 grafik. Sesi 11: filter, margin, desain.

---

## Langkah 0 · Unduh data

Link Google Drive di grup kelas → unduh **3 file CSV ke 1 folder**

| File | Satu baris = |
| --- | --- |
| `penjualan.csv` (fakta) | satu barang terjual |
| `produk.csv` (dimensi) | satu produk |
| `pelanggan.csv` (dimensi) | satu pelanggan |

Sudah tanpa Cancelled/Returned dan tanpa bulan berjalan.

Buka juga `cek_cepat.txt`: angka pendapatan, pesanan, AOV untuk dicocokkan

Pengguna Mac: lakukan semuanya **di dalam Windows** (Parallels)

---

## Relasi = cara menggabungkan tabel

```
produk (1) ───< penjualan >─── (1) pelanggan
  product_id = product_id     user_id = user_id
```

- **Fakta** = kejadian (penjualan) · **Dimensi** = deskripsi (produk, pelanggan)
- Satu produk terjual berkali-kali → *one-to-many*
- Hubungkan dimensi **ke tabel fakta**, bukan antar dimensi

**Atur dulu** *Locale for import* = **English (United States)**!
Kalau tidak, `49.99` bisa terbaca `4999`.

---

## Measure utama (DAX)

| Measure | DAX |
| --- | --- |
| Pendapatan | `SUM(penjualan[sale_price])` |
| Jumlah Pesanan | `DISTINCTCOUNT(penjualan[order_id])` |
| AOV | `DIVIDE([Pendapatan], [Jumlah Pesanan])` |

Pesanan = **distinct count**: satu pesanan bisa berisi banyak barang

**Cocokkan kartu KPI dengan "Cek cepat".** Ketik `1` kalau angkanya sama.

---

## Dua grafik

**Tren pendapatan bulanan** → Line chart
- X-axis = kolom `Bulan` (bukan Date Hierarchy)
- Format X-axis: Type **Continuous**

**Pendapatan per kategori** → Clustered bar chart
- **Sort descending** berdasarkan Pendapatan
- Data labels: On

Judul = **kesimpulan**, bukan nama grafik

---

## Masalah yang sering terjadi

| Masalah | Penyebab |
| --- | --- |
| Pendapatan 100× terlalu besar | Locale impor |
| Semua kategori angkanya sama | Relasi belum ada / salah |
| "Count of order_id" terlalu besar | Pakai kolom, bukan measure distinct |
| Tren hanya 4 titik | Masih Date Hierarchy (kuartal) |
| Mac: grafik tanggal kosong | Power BI 64-bit di Windows ARM → install versi 32-bit |

---

<!-- _class: lead -->

# Kerjakan bersama · 10 menit

1. Ubah judul kedua grafik menjadi **kalimat kesimpulan**
2. Tambahkan **grafik ketiga**: pendapatan per negara (batang, diurutkan)

Instruktur memandu langkah demi langkah · kamu mengetik bersamaan

---

<!-- _class: lead -->

# Simpan sekarang, bersama-sama

**File → Save as → `thelook_dashboard.pbix`**

di folder yang sama dengan 3 file CSV

Ketik `1` setelah tersimpan. Sesi 11 melanjutkan dashboard ini.

---

## Unggah bersama & latihan mandiri

**Unggah bersama sekarang:** buat repo **`thelook-powerbi-dashboard`** (`PANDUAN_GITHUB.md`), unggah:
- `dashboard/thelook_dashboard.pbix` + `thelook_dashboard.pdf`
- `images/dashboard_v1.png`

Dashboard hilang? Unduh **dashboard cadangan** dari grup kelas.

**Latihan mandiri (opsional):** tidak wajib, tidak dinilai; jawaban dibagikan setelah kelas: grafik lain (kelompok umur, traffic source, Men vs Women)

---

## Ringkasan

- Dashboard = satu halaman untuk memantau & membagikan
- Fakta + dimensi, dihubungkan dengan relasi
- Pesanan = distinct count
- Selalu cocokkan KPI dengan sumber lain

**Sesi berikutnya:** Kamis, 3 Desember 2026, 20.00 WIB
Filter, margin, desain, dan storytelling + README Power BI
