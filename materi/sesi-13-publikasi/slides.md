---
marp: true
theme: default
paginate: true
size: 16:9
footer: "Sesi 13 · Merapikan & Menerbitkan Portofolio"
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

# Sesi 13 · Merapikan & Menerbitkan Portofolio

Selasa, 8 Desember 2026 · 20.00–21.40 WIB · Sesi terakhir

---

## Agenda

| Waktu | Bagian |
| --- | --- |
| 20.00 | Recap: hasil studi kasus |
| 20.10 | "Mata perekrut": 30 detik pertama di repo-mu |
| 20.25 | Checklist + review berpasangan |
| 20.55 | Pin repository & profil GitHub; LinkedIn (opsional) |
| 21.10 | Presentasi 1 menit |
| 21.30 | Penutup kursus |

---

## Perjalanan 13 sesi

| Modul | Yang sudah kamu kuasai |
| --- | --- |
| SQL | SELECT, WHERE, GROUP BY, JOIN, CASE WHEN, CTE |
| Python | pandas, pembersihan data, grafik, statistik, RFM |
| Dashboard | Relasi, measure, filter, storytelling |
| Portofolio | Studi kasus lengkap dari pertanyaan sampai rekomendasi |

Hari ini: membuatnya **terlihat** oleh orang lain.

---

## Mata perekrut: 30 detik pertama

Perekrut biasanya hanya membaca **README** dan melihat **gambar**.
Dalam 30 detik mereka harus tahu:

1. **Apa** yang kamu analisis, untuk siapa
2. **Temuan utama** (dengan angka)
3. **Rekomendasimu**
4. **Tools** yang kamu kuasai
5. Di mana **bukti**-nya: dashboard, notebook, query

---

## Checklist README

- Judul jelas + ringkasan 2–3 kalimat di paling atas
- Pertanyaan bisnis · data & metode
- **3 temuan** dengan angka, kata-katamu sendiri
- **1 rekomendasi** konkret
- Screenshot dashboard **tampil** + link berfungsi
- Bagian studi kasus + grafik matriks
- Keterbatasan (data sintetis)
- Satu bahasa, konsisten

---

## Checklist file & folder

| Folder | Isi |
| --- | --- |
| `sql/` | `01_...` sampai `04_...`, diberi komentar |
| `notebooks/` | `05_...` sampai `09_...`, **semua sel sudah dijalankan** |
| `dashboard/` | link Tableau / `.pbix` + PDF |
| `my_question/` | `.sql` + `.ipynb` studi kasus |
| `images/` | nama deskriptif, **tanpa spasi** |

Hapus file sisa: `Untitled.ipynb`, `Salinan dari ...`

**Uji akhir:** buka repo di **jendela incognito** dan di **HP**

---

## Gambar & link di README

```markdown
![Dashboard TheLook](images/dashboard_final.png)
[Notebook analisis pelanggan](notebooks/09_customer_analysis.ipynb)
```

Link gambar rusak? Biasanya karena:
- Huruf besar-kecil berbeda: `Dashboard.png` ≠ `dashboard.png`
- Ada **spasi** di nama file
- File belum diunggah

---

## Tertinggal? Prioritaskan sesuai bobot nilai

1. **README** (20%): temuan 1 (sesi 9) & studi kasus (sesi 12) sudah ada
2. **Dashboard** (20%): link/PDF + screenshot
3. **Studi kasus** (10%): `my_question/`
4. **SQL & notebook** (20% + 20%): unggah yang sudah dijalankan di kelas
5. Gambar hilang? Notebook → **Runtime → Run all** → unduh lagi

Perbaikan sampai **Selasa, 15 Desember 2026**

---

## Pin repository & rapikan profil

1. Profil GitHub → **Customize your pins** → centang `thelook-analysis`
2. Repo → ikon roda gigi **About**: deskripsi + topics
   `data-analysis` `sql` `bigquery` `python` `pandas` `tableau` / `power-bi`
3. **Edit profile**: foto, nama, bio
   *"Aspiring Data Analyst | SQL · Python · Tableau"*, kota, link LinkedIn
4. *(Opsional)* README profil: repo bernama **sama persis** dengan username-mu

---

## Presentasi 1 menit

| Bagian | Waktu | Contoh pembuka |
| --- | --- | --- |
| Konteks | 10 detik | "Saya menganalisis data e-commerce TheLook untuk..." |
| Pendekatan | 15 detik | "Saya memakai SQL di BigQuery untuk..., Python untuk..." |
| Temuan | 20 detik | "Temuan utamanya ada tiga: ..." |
| Rekomendasi | 15 detik | "Saya merekomendasikan ... karena ..." |

Sangat berguna untuk **wawancara kerja**. Siapa yang mau mencoba?

---

## (Opsional) Posting LinkedIn

> Saya baru menyelesaikan proyek analisis data e-commerce dengan dataset publik TheLook (BigQuery).
> **Pertanyaan:** ... · **Tools:** SQL, Python, Tableau/Power BI
> **Temuan utama:** ... · **Rekomendasi:** ...
> Dashboard: [link] · Kode: [link GitHub]

Lampirkan **screenshot dashboard**: postingan bergambar jauh lebih banyak dilihat.

---

## Langkah berikutnya

- **Proyek kedua** dengan dataset lain: BigQuery public data, Kaggle, data.go.id, BPS
- **SQL lanjut:** window function (`ROW_NUMBER`, `LAG`, `SUM() OVER`), cohort
- **Python lanjut:** seaborn / plotly, A/B test sederhana
- **Git dari command line:** `clone`, `commit`, `push`

Portofolio dengan 2–3 proyek berbeda jauh lebih kuat.

---

<!-- _class: lead -->
<!-- _paginate: false -->

# Selamat!

Kamu sudah menyelesaikan kursus
**Data Analysis dengan BigQuery, Python & BI**

Isi formulir umpan balik · Terima kasih!
