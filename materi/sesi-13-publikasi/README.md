# Sesi 13 · Merapikan dan Menerbitkan Portofolio

**Senin, 7 Desember 2026 · 20.00–21.40 WIB** · Sesi terakhir

## Tujuan sesi

Setelah sesi ini kamu bisa:

1. Memeriksa portofolio dengan checklist, seperti yang dilakukan perekrut.
2. Memperbaiki README, screenshot, link, dan nama file.
3. Menyematkan (*pin*) repository di profil GitHub dan membuat profil yang meyakinkan.
4. Menceritakan proyekmu dalam 1 menit.

## Agenda

| Waktu (WIB) | Bagian |
| --- | --- |
| 20.00–20.10 | Recap: progres analisis mandiri |
| 20.10–20.25 | "Mata perekrut": apa yang dilihat orang dalam 30 detik pertama di repo-mu |
| 20.25–20.55 | Kerja: jalankan checklist, saling review berpasangan di *breakout room* |
| 20.55–21.10 | Pin repository, profil GitHub, (opsional) posting LinkedIn |
| 21.10–21.30 | Presentasi 1 menit (sukarela) + tanya jawab |
| 21.30–21.40 | Penutup kursus, langkah belajar berikutnya |

## 1. Mata perekrut: 30 detik pertama

Perekrut atau *hiring manager* biasanya hanya membaca **README** dan melihat **gambar**. Jarang yang membuka setiap file. Pastikan dalam 30 detik mereka tahu:

1. **Apa** yang kamu analisis dan **untuk siapa**.
2. **Apa** temuan utamamu (dengan angka).
3. **Apa** yang kamu rekomendasikan.
4. **Tools** apa yang kamu kuasai.
5. Di mana melihat **bukti**: dashboard, notebook, query.

## 2. Checklist portofolio

### README

- [ ] Judul jelas, misalnya "Analisis Penjualan & Pelanggan TheLook E-commerce"
- [ ] Ringkasan 2–3 kalimat di paling atas (konteks, pertanyaan, hasil utama)
- [ ] Pertanyaan bisnis tertulis jelas
- [ ] Data & metode: dataset, periode, definisi metrik, tools
- [ ] **3 temuan** dengan angka, ditulis dengan kata-katamu sendiri
- [ ] **1 rekomendasi** yang konkret
- [ ] Screenshot dashboard tampil (bukan link rusak)
- [ ] Link dashboard Tableau Public berfungsi, **atau** PDF Power BI tersedia
- [ ] Bagian analisis mandiri: pertanyaan, jawaban, grafik utama
- [ ] Daftar isi repo / struktur folder
- [ ] Keterbatasan (misalnya data sintetis)
- [ ] Tidak ada typo yang mencolok; bahasa konsisten (pilih Indonesia **atau** Inggris)

### File dan folder

- [ ] `sql/`: `01_basics.sql` sampai `04_dates_case_cte.sql`, semuanya diberi komentar
- [ ] `notebooks/`: `05_...` sampai `09_...`, **semua sel sudah dijalankan** sehingga hasilnya terlihat
- [ ] `dashboard/`: link atau file + PDF
- [ ] `my_question/`: `.sql` dan `.ipynb`
- [ ] `images/`: nama file deskriptif (`01_pendapatan_bulanan.png`, bukan `Screenshot 2026-11-25 at 21.03.png`)
- [ ] Tidak ada file sisa: `Untitled.ipynb`, `Salinan dari ...`, file kosong
- [ ] `PROJECT_ID` di notebook diganti `"isi-project-id-kamu"` (opsional, lebih rapi)

### Uji akhir

- [ ] Buka repo-mu di **jendela incognito**: semua gambar tampil, semua link berfungsi
- [ ] Buka di HP: README tetap mudah dibaca

## 3. Menampilkan gambar di README

```markdown
![Dashboard TheLook](images/dashboard_final.png)
```

- Path **relatif** terhadap lokasi README dan **huruf besar-kecil harus sama persis**: `images/Dashboard.png` ≠ `images/dashboard.png`.
- Spasi di nama file membuat link rusak. Ganti nama file dengan garis bawah.

Link ke file lain di repo:

```markdown
[Notebook analisis pelanggan](notebooks/09_customer_analysis.ipynb)
```

## 4. Pin repository dan rapikan profil GitHub

1. Buka profil GitHub-mu (`github.com/username`).
2. **Customize your pins** → centang `thelook-analysis` → **Save pins**.
3. Isi **About** repo (ikon roda gigi di halaman repo, kanan atas): deskripsi singkat dan **topics**, misalnya `data-analysis`, `sql`, `bigquery`, `python`, `pandas`, `tableau` / `power-bi`.
4. **Edit profile**: foto, nama lengkap, bio singkat ("Aspiring Data Analyst | SQL · Python · Tableau"), kota, link LinkedIn.
5. *(Opsional)* README profil: buat repo dengan nama **sama persis** dengan username-mu. README-nya tampil di halaman profil.

## 5. Presentasi 1 menit

Latih cerita proyekmu dengan struktur ini. Akan sangat berguna saat wawancara:

1. **Konteks (10 detik):** "Saya menganalisis data e-commerce TheLook untuk menjawab..."
2. **Pendekatan (15 detik):** "Saya memakai SQL di BigQuery untuk..., Python untuk..., dan membuat dashboard di..."
3. **Temuan (20 detik):** "Temuan utamanya ada tiga: ..."
4. **Rekomendasi (15 detik):** "Saya merekomendasikan ... karena ..."

## 6. (Opsional) Posting di LinkedIn

Contoh kerangka. Ubah dengan kata-katamu sendiri:

> Saya baru menyelesaikan proyek analisis data e-commerce menggunakan dataset publik TheLook (BigQuery).
>
> 🔎 Pertanyaan: [pertanyaan bisnismu]
> 🛠️ Tools: SQL (BigQuery), Python (pandas, matplotlib), [Tableau/Power BI]
> 📊 Temuan utama: [1 temuan paling menarik, dengan angka]
> 💡 Rekomendasi: [rekomendasimu]
>
> Dashboard: [link Tableau Public]
> Kode & analisis lengkap: [link GitHub]
>
> #DataAnalytics #SQL #Python #BigQuery

Lampirkan screenshot dashboard. Postingan dengan gambar jauh lebih banyak dilihat.

## 7. Setelah kursus: langkah berikutnya

- **Ulangi dengan dataset lain.** Portofolio dengan 2–3 proyek berbeda jauh lebih kuat. Ide: dataset publik lain di BigQuery (`bigquery-public-data`), Kaggle, atau data terbuka pemerintah ([data.go.id](https://data.go.id), [bps.go.id](https://www.bps.go.id)).
- **Perdalam SQL:** window function (`ROW_NUMBER`, `LAG`, `SUM() OVER`), cohort analysis.
- **Perdalam Python:** seaborn/plotly, uji statistik sederhana (A/B test).
- **Git dari command line:** ketika siap, pelajari `git clone`, `commit`, `push`.

**Selamat! Kamu sudah menyelesaikan kursus Data Analysis dengan BigQuery, Python & BI. 🎉**
