# Sesi 13 · Merapikan dan Menerbitkan Portofolio *(jalur penuh)*

**Selasa, 8 Desember 2026 · 20.00–21.40 WIB** · Sesi terakhir

## Tujuan sesi

Setelah sesi ini kamu bisa:

1. Memeriksa ketiga repo portofolio dengan checklist, seperti yang dilakukan perekrut.
2. Memperbaiki README, screenshot, link, dan nama file.
3. Membuat **README profil GitHub** yang menghubungkan ketiga repo, dan menyematkan (*pin*) ketiganya.
4. Menceritakan proyekmu dalam 1 menit.

## Agenda

| Waktu (WIB) | Bagian |
| --- | --- |
| 20.00–20.05 | Recap: hasil studi kasus |
| 20.05–20.20 | "Mata perekrut": apa yang dilihat orang dalam 30 detik pertama di repo-mu |
| 20.20–20.55 | **Checklist bersama**: instruktur memeriksa repo contoh langkah demi langkah, kamu memperbaiki repo-mu bersamaan |
| 20.55–21.10 | README profil GitHub, pin 3 repo, (opsional) posting LinkedIn |
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

Kamu punya **tiga repo**, satu per modul:

| Repo | Isi | README ditulis di |
| --- | --- | --- |
| `thelook-sql-analysis` | `sql/01_...` sampai `04_...` | Sesi 4 (Proyek SQL) |
| `thelook-python-analysis` | `notebooks/05_...` sampai `09_...`, `images/`, `my_question/` | Sesi 9 + studi kasus sesi 12 |
| `thelook-powerbi-dashboard` | `dashboard/` (`.pbix` + PDF), `images/` | Sesi 11 |

### Setiap README

- [ ] Judul jelas, sesuai isi repo (misalnya "Analisis Pelanggan TheLook dengan Python")
- [ ] Ringkasan 2–3 kalimat di paling atas (konteks, pertanyaan, hasil utama)
- [ ] Pertanyaan bisnis dan data & metode tertulis jelas
- [ ] **Temuan** dengan angka, ditulis dengan kata-katamu sendiri, dan **1 rekomendasi** yang konkret
- [ ] Minimal satu gambar tampil (grafik atau screenshot dashboard)
- [ ] Keterbatasan (misalnya data sintetis)
- [ ] Tidak ada typo yang mencolok; bahasa konsisten (pilih Indonesia **atau** Inggris) di ketiga repo

### File per repo

- [ ] **SQL:** `sql/01_basics.sql` sampai `sql/04_dates_case_cte.sql`, semuanya diberi komentar; temuan Proyek SQL ada di README
- [ ] **Python:** `notebooks/05_...` sampai `09_...` dengan **semua sel sudah dijalankan**; `my_question/` berisi `.sql` + `.ipynb` studi kasus; bagian **Studi kasus** di README
- [ ] **Power BI:** `dashboard/thelook_dashboard.pdf` berisi **2 halaman** (Dashboard + Insight), `.pbix` jika di bawah 25 MB; `images/dashboard_final.png` dan `images/insight.png`; headline di README sama dengan halaman Insight dan menyebut periodenya
- [ ] `images/`: nama file deskriptif (`01_pendapatan_bulanan.png`, bukan `Screenshot 2026-11-25 at 21.03.png`)
- [ ] Tidak ada file sisa: `Untitled.ipynb`, `Salinan dari ...`, file kosong
- [ ] `PROJECT_ID` di notebook diganti `"isi-project-id-kamu"` (opsional, lebih rapi)

### Uji akhir

- [ ] Buka ketiga repo di **jendela incognito**: semua gambar tampil, semua link berfungsi
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

## 4. README profil, pin repository, dan rapikan profil GitHub

**README profil** menghubungkan ketiga repo menjadi satu cerita, dan tampil di halaman depan profilmu:

1. Buat repository baru dengan nama **sama persis** dengan username-mu (misalnya `budisantoso/budisantoso`), **Public**, centang **Add a README file**.
2. Edit `README.md` → tempel [template README profil](../../template-portofolio/profil-github/README.md) → isi tabel proyek dengan link ketiga repo dan satu kalimat temuan utama dari masing-masing.

Lalu:

3. Buka profil GitHub-mu (`github.com/username`) → **Customize your pins** → centang `thelook-sql-analysis`, `thelook-python-analysis`, `thelook-powerbi-dashboard` → **Save pins**.
4. Di setiap repo, isi **About** (ikon roda gigi, kanan atas): deskripsi singkat dan **topics**, misalnya `data-analysis` + `sql`/`bigquery`, `python`/`pandas`, atau `power-bi`.
5. **Edit profile**: foto, nama lengkap, bio singkat ("Aspiring Data Analyst | SQL · Python · Power BI"), kota, link LinkedIn.

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
> 🛠️ Tools: SQL (BigQuery), Python (pandas, matplotlib), Power BI
> 📊 Temuan utama: [1 temuan paling menarik, dengan angka]
> 💡 Rekomendasi: [rekomendasimu]
>
> Dashboard: [link repo thelook-powerbi-dashboard]
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
