---
marp: true
theme: default
paginate: true
size: 16:9
footer: "Sesi 11 · Filter, Margin, Desain & Storytelling"
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
| 20.00 | Recap PR sesi 10: grafik tambahanmu |
| 20.10 | Filter tanggal & kategori |
| 20.30 | Calculated field: margin & margin % |
| 20.45 | Desain & storytelling: sebelum vs sesudah |
| 21.05 | Giliran kamu: headline |
| 21.15 | Tanya jawab + pengenalan studi kasus sesi 12 |
| 21.35 | Penutup & PR |

Dashboard sesi 10 hilang? Buka **dashboard cadangan** dari grup kelas.

---

## Filter

| Filter | Jenis | Kenapa |
| --- | --- | --- |
| Tanggal (`order_date`) | Rentang | Lihat periode tertentu |
| Kategori (`category`) | Dropdown, pilih beberapa | Fokus ke kategori tertentu |

- Berlaku untuk **semua** visual di halaman
- Diletakkan di **satu baris di atas**

**Power BI:** Slicer (style *Between* / *Dropdown*)
**Tableau:** Filters → Show Filter → *Apply to Worksheets → All Using This Data Source*

---

## Margin

**Margin** = pendapatan − biaya pokok · **Margin %** = margin ÷ pendapatan

| | Power BI (DAX) | Tableau |
| --- | --- | --- |
| Margin | `SUM(penjualan[sale_price]) - SUM(penjualan[cost])` | `SUM([Sale Price]) - SUM([Cost])` |
| Margin % | `DIVIDE([Margin], [Pendapatan])` | `(SUM([Sale Price]) - SUM([Cost])) / SUM([Sale Price])` |

> Kategori dengan pendapatan terbesar, apakah margin %-nya juga terbesar?
> Taruh Margin % di **tooltip** grafik kategori, lalu cek.

---

<!-- _class: section -->

# Desain & storytelling

---

## 7 prinsip desain dashboard

1. **Yang terpenting di kiri atas**: judul → KPI → tren → rincian
2. **Judul halaman = kesimpulan**, bukan "Dashboard Penjualan"
3. **Satu warna utama + satu warna sorotan**
4. **Sejajar, jarak sama**, ukuran kartu KPI sama
5. **Buang yang tidak perlu**: grid tebal, legend satu warna, desimal berlebih
6. **Satuan selalu jelas**: USD, %, pesanan
7. **Uji 5 detik**: pesan utama terbaca dalam 5 detik?

---

## Headline: lemah vs kuat

| Lemah | Kuat |
| --- | --- |
| "Dashboard Penjualan TheLook" | "Pendapatan tumbuh 9%, didorong Outerwear dan Jeans; margin stabil di 52%" |
| "Ringkasan 2025" | "Pendapatan naik, tapi hanya sedikit pelanggan yang kembali berbelanja" |

Headline yang kuat berisi **kesimpulan + angka**

---

## Cerita satu halaman

| Bagian | Isi |
| --- | --- |
| **Headline** | Kesimpulan utama, 1 kalimat |
| **Bukti** | 3–4 visual yang mendukung headline |
| **So what?** | Kotak teks rekomendasi |

Dari **kumpulan grafik** menjadi **cerita**: kesimpulan → bukti → rekomendasi

---

<!-- _class: lead -->

# Giliran kamu · 10 menit

Tulis **headline** dashboard-mu: satu kalimat kesimpulan dengan angka

Letakkan di paling atas. Siapa yang mau membacakan?

---

## Sesi 12: studi kasus terpandu

> Anggaran promosi terbatas, hanya untuk **satu kategori**. Kategori mana?

Kita kerjakan **bersama-sama** dari SQL sampai rekomendasi.

**Pilih fokusmu sekarang:** `Women` atau `Men` (opsional: satu negara)

Siapkan login BigQuery & Colab.

---

## PR sesi 11

1. **Selesaikan dashboard**: filter, kartu Margin %, headline, kotak rekomendasi → simpan + `images/dashboard_final.png`
2. **Pilih fokus** studi kasus sesi 12
3. **Draf README portofolio** dari template: Ringkasan, Pertanyaan bisnis, Data & metode, Dashboard, Temuan (dari sesi 9)

---

## Ringkasan

- Filter di satu baris atas, berlaku untuk semua visual
- Pendapatan besar belum tentu margin besar
- Judul = kesimpulan · satu warna sorotan · uji 5 detik
- Cerita: headline → bukti → rekomendasi

**Sesi berikutnya:** Sabtu, 5 Desember 2026, **14.00 WIB**
Studi kasus terpandu: kategori mana yang diprioritaskan?
