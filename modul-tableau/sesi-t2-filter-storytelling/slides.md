---
marp: true
theme: default
paginate: true
size: 16:9
footer: "Modul Tableau · Sesi 2 · Filter, Margin & Storytelling"
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

# Modul Tableau · Sesi 2

Filter, margin, desain & storytelling

---

## Agenda

| Menit | Bagian |
| --- | --- |
| 0 | Recap sesi 1 |
| 5 | Filter tanggal & kategori |
| 25 | Calculated field: margin & margin % |
| 40 | Desain dashboard; dashboard vs **Insight** |
| 60 | **Kerjakan bersama**: dashboard Insight (headline + rekomendasi) |
| 70 | **Unggah bersama**: dashboard final + README |
| 85 | Tanya jawab |
| 95 | Penutup |

Dashboard sesi 1 hilang? Buka **dashboard cadangan** (`.twbx`) dari link instruktur.

---

## Filter

| Filter | Jenis | Kenapa |
| --- | --- | --- |
| Tanggal (`Order Date`) | Range of dates | Lihat periode tertentu |
| Kategori (`Category`) | Multiple values (dropdown) | Fokus ke kategori tertentu |

- Klik kanan filter → **Show Filter**
- Klik kanan lagi → **Apply to Worksheets → All Using This Data Source**
- Letakkan di **satu baris di atas**

Uji: pilih satu kategori → semua sheet harus berubah

---

## Margin

**Margin** = pendapatan − biaya pokok · **Margin %** = margin ÷ pendapatan

| Field | Rumus |
| --- | --- |
| Margin | `SUM([Sale Price]) - SUM([Cost])` |
| Margin % | `(SUM([Sale Price]) - SUM([Cost])) / SUM([Sale Price])` |

> Kategori dengan pendapatan terbesar, apakah margin %-nya juga terbesar?
> Taruh Margin % di **Tooltip** grafik kategori, lalu cek.

---

<!-- _class: section -->

# Desain & dashboard Insight

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

## Dashboard vs dashboard Insight

| | **Dashboard** | **Insight** |
| --- | --- | --- |
| Tujuan | Memantau, menjelajah | Satu kesimpulan + rekomendasi |
| Judul | Deskriptif | Kesimpulan + angka + periode |
| Filter | Aktif | Periode dikunci |
| Yang menyimpulkan | Pembaca | Analis |

Dua dashboard dalam **workbook yang sama**, tampil sebagai dua tab di Tableau Public

---

## Membuat dashboard Insight

1. **Duplicate** sheet pendukung → beri nama `Insight ...`
2. Filter interaktif → **Apply to Worksheets → Selected Worksheets**: lepaskan sheet Insight
3. Di sheet Insight: **Order Date** → Range of dates: 12 bulan terakhir yang lengkap
4. **New Dashboard** → `Insight` → susun sheet Insight
5. **Text**: headline (kesimpulan + angka + **periode**) dan rekomendasi
6. Save to Tableau Public dengan **Show sheets as tabs**

---

<!-- _class: lead -->

# Kerjakan bersama · 10 menit

1. Buat dashboard **Insight** (duplikat sheet, kunci periode)
2. Tulis **headline**: kesimpulan + angka + periode, di paling atas
3. Tambahkan objek **Text** berisi rekomendasi

Siapa yang mau membacakan headline-nya?

---

## README `thelook-tableau-dashboard`

Template README Tableau → tempel di `README.md` repo-mu

| Bagian | Isi |
| --- | --- |
| Ringkasan | **Headline** dari Insight + **link Tableau Public** + screenshot kedua dashboard |
| Pertanyaan bisnis | Apa yang dipantau manajemen |
| Data & model | Fakta + dimensi, calculated field |
| Temuan & rekomendasi | Dari dashboard-mu sendiri |

Diisi **bersama di kelas** hari ini.

---

## Unggah bersama & latihan mandiri

1. Save to Tableau Public → **Edit Details**: deskripsi singkat
2. Screenshot `images/dashboard_final.png` + `images/insight.png` → repo
3. **README lengkap** `thelook-tableau-dashboard`

**Portofolio modul Tableau selesai!**

**Latihan mandiri (opsional):** rapikan desain, atau dashboard kedua untuk analisis pelanggan

---

## Ringkasan

- Filter di satu baris atas, berlaku untuk semua sheet
- Pendapatan besar belum tentu margin besar
- Dashboard: judul deskriptif, filter aktif, satu warna sorotan
- Insight: headline (kesimpulan + angka + periode) → bukti → rekomendasi
- **Modul Tableau selesai!** Link Tableau Public + repo = portofolio modul ini
