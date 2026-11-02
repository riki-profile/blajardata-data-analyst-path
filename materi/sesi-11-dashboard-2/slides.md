---
marp: true
theme: default
paginate: true
size: 16:9
footer: "Sesi 11 · Filter, Margin, Desain & Storytelling (Power BI)"
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

# Sesi 11 · Filter, Margin, Desain & Storytelling

Kamis, 3 Desember 2026 · 20.00–21.40 WIB

---

## Agenda

| Waktu | Bagian |
| --- | --- |
| 20.00 | Recap sesi 10 |
| 20.05 | Filter tanggal & kategori |
| 20.25 | Measure DAX: margin & margin % |
| 20.40 | Desain dashboard; dashboard vs halaman **Insight** |
| 21.00 | **Kerjakan bersama**: halaman Insight (headline + rekomendasi) |
| 21.10 | **Unggah bersama**: dashboard final + README |
| 21.25 | Tanya jawab + studi kasus sesi 12 (jalur penuh) |
| 21.35 | Penutup |

Dashboard sesi 10 hilang? Buka **`thelook_dashboard_cadangan.pbix`** dari grup kelas.

---

## Filter

| Filter | Jenis | Kenapa |
| --- | --- | --- |
| Tanggal (`order_date`) | Rentang | Lihat periode tertentu |
| Kategori (`category`) | Dropdown, pilih beberapa | Fokus ke kategori tertentu |

- Berlaku untuk **semua** visual di halaman
- Diletakkan di **satu baris di atas**

**Power BI:** visual **Slicer**: style *Between* untuk tanggal, *Dropdown* untuk kategori
Uji: pilih satu kategori → semua kartu & grafik harus berubah

---

## Margin

**Margin** = pendapatan − biaya pokok · **Margin %** = margin ÷ pendapatan

| Measure | DAX |
| --- | --- |
| Margin | `SUM(penjualan[sale_price]) - SUM(penjualan[cost])` |
| Margin % | `DIVIDE([Margin], [Pendapatan])` |

> Kategori dengan pendapatan terbesar, apakah margin %-nya juga terbesar?
> Taruh Margin % di **tooltip** grafik kategori, lalu cek.

---

<!-- _class: section -->

# Desain & halaman Insight

---

## 7 prinsip desain dashboard

1. **Yang terpenting di kiri atas**: judul → KPI → tren → rincian
2. **Judul deskriptif**: apa yang diukur + satuan (angka berubah mengikuti filter)
3. **Satu warna utama + satu warna sorotan**
4. **Sejajar, jarak sama**, ukuran kartu KPI sama
5. **Buang yang tidak perlu**: grid tebal, legend satu warna, desimal berlebih
6. **Satuan selalu jelas**: USD, %, pesanan
7. **Uji 5 detik**: langsung jelas apa yang dipantau?

---

## Dashboard vs halaman Insight

| | **Dashboard** | **Insight** |
| --- | --- | --- |
| Tujuan | Memantau, menjelajah | Satu kesimpulan + rekomendasi |
| Judul | Deskriptif | Kesimpulan + angka + periode |
| Filter | Aktif | Periode dikunci |
| Yang menyimpulkan | Pembaca | Analis |

Dua halaman dalam **file yang sama**. Coba: ubah filter kategori → headline "naik 9%" langsung tidak cocok lagi. Itu sebabnya kesimpulan tidak ditaruh di dashboard.

---

## Membuat halaman Insight

1. Klik kanan tab **Dashboard** → **Duplicate page** → ganti nama `Insight`
2. Hapus **slicer**; sisakan 2–3 visual yang mendukung kesimpulan
3. **Filters on this page** → `order_date` → Advanced: periode 12 bulan terakhir yang lengkap
4. **Text box** headline: kesimpulan + angka + **periode**
5. **Text box** rekomendasi (1–2 kalimat)

Angka berubah saat slicer di Dashboard dipakai? **View → Sync slicers** → hilangkan centang Insight

---

## Headline Insight: lemah vs kuat

| Lemah | Kuat |
| --- | --- |
| "Insight Penjualan" | "Nov 2025–Okt 2026: pendapatan naik 9%, didorong Outerwear dan Jeans" |
| "Pendapatan naik" | "Margin Outerwear 55%, tertinggi dari 5 kategori teratas" |

Headline yang kuat berisi **kesimpulan + angka + periode**

---

<!-- _class: lead -->

# Kerjakan bersama · 10 menit

1. Buat halaman **Insight**: duplikat, hapus slicer, kunci periode
2. Tulis **headline**: kesimpulan + angka + periode
3. Tambahkan **kotak rekomendasi** (1–2 kalimat)

Siapa yang mau membacakan headline-nya?

Instruktur memandu langkah demi langkah · kamu mengetik bersamaan

---

## README `thelook-powerbi-dashboard`

Template README Power BI → tempel di `README.md` repo-mu

| Bagian | Isi |
| --- | --- |
| Ringkasan | **Headline** dari halaman Insight + screenshot kedua halaman |
| Pertanyaan bisnis | Apa yang dipantau manajemen |
| Data & model | Fakta + dimensi, measure DAX |
| Temuan & rekomendasi | Dari dashboard-mu sendiri |

Diisi **bersama di kelas** hari ini.

---

## Jalur penuh · sesi 12: studi kasus terpandu

> Anggaran promosi terbatas, hanya untuk **satu kategori**. Kategori mana?

Kita kerjakan **bersama-sama** dari SQL sampai rekomendasi.

**Pilih fokusmu sekarang:** `Women` atau `Men` (opsional: satu negara)

Siapkan login BigQuery & Colab.

---

## Unggah bersama & latihan mandiri

Di repo `thelook-powerbi-dashboard`:
1. Ctrl + S → Export to PDF (2 halaman) → unggah ulang `.pbix` + PDF
2. Screenshot → `images/dashboard_final.png` + `images/insight.png`
3. README lengkap: headline, isi dashboard, 2 temuan, rekomendasi

**Portofolio modul Power BI selesai!** · Jalur penuh: pilih fokus studi kasus sesi 12

**Latihan mandiri (opsional):** tidak wajib, tidak dinilai; jawaban dibagikan setelah kelas: rapikan desain, atau halaman ketiga untuk analisis pelanggan

---

## Ringkasan

- Filter di satu baris atas, berlaku untuk semua visual
- Pendapatan besar belum tentu margin besar
- Dashboard: judul deskriptif, filter aktif, satu warna sorotan
- Insight: headline (kesimpulan + angka + periode) → bukti → rekomendasi
- **Modul Power BI selesai!** Repo `thelook-powerbi-dashboard` = portofolio modul ini

**Sesi berikutnya (jalur penuh):** Sabtu, 5 Desember 2026, **14.00 WIB**
Studi kasus terpandu: kategori mana yang diprioritaskan?
