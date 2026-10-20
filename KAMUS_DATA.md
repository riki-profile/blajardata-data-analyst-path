# Kamus Data TheLook

Dataset: `bigquery-public-data.thelook_ecommerce`

TheLook adalah toko pakaian online **fiktif** yang dibuat oleh Google untuk latihan. Datanya sintetis (dibuat oleh program), tetapi strukturnya mirip data e-commerce sungguhan. Dataset ini **diperbarui secara berkala**, jadi jumlah baris dan angka hasil query-mu bisa sedikit berbeda dari temanmu atau dari contoh di materi. Itu normal.

## Hubungan antar tabel

```
users ──< orders ──< order_items >── products
  id        order_id    order_id         id
            user_id     user_id
                        product_id
                        inventory_item_id >── inventory_items
                                                  id
```

Cara membacanya: satu `user` bisa punya banyak `orders`, satu `order` bisa berisi banyak `order_items`, dan setiap `order_item` adalah satu `product`.

| Untuk menggabungkan | Gunakan |
| --- | --- |
| `orders` dengan `users` | `orders.user_id = users.id` |
| `order_items` dengan `orders` | `order_items.order_id = orders.order_id` |
| `order_items` dengan `products` | `order_items.product_id = products.id` |
| `order_items` dengan `users` | `order_items.user_id = users.id` |
| `order_items` dengan `inventory_items` | `order_items.inventory_item_id = inventory_items.id` |

## Tabel utama

### `users`: pelanggan

| Kolom | Arti |
| --- | --- |
| `id` | ID unik pelanggan |
| `first_name`, `last_name`, `email` | Nama dan email (fiktif) |
| `age` | Umur |
| `gender` | `M` atau `F` |
| `country`, `state`, `city`, `postal_code` | Lokasi |
| `traffic_source` | Dari mana pelanggan datang: `Search`, `Organic`, `Facebook`, `Email`, `Display` |
| `created_at` | Waktu pelanggan mendaftar |

### `orders`: pesanan (satu baris = satu pesanan)

| Kolom | Arti |
| --- | --- |
| `order_id` | ID unik pesanan |
| `user_id` | Pelanggan yang memesan |
| `status` | `Processing`, `Shipped`, `Complete`, `Cancelled`, atau `Returned` |
| `gender` | Gender pelanggan |
| `created_at` | Waktu pesanan dibuat |
| `shipped_at`, `delivered_at`, `returned_at` | Waktu dikirim, diterima, dikembalikan. **Kosong (NULL)** jika belum terjadi |
| `num_of_item` | Jumlah barang dalam pesanan |

### `order_items`: barang dalam pesanan (satu baris = satu barang)

| Kolom | Arti |
| --- | --- |
| `id` | ID unik baris barang |
| `order_id` | Pesanan tempat barang ini berada |
| `user_id` | Pelanggan |
| `product_id` | Produk yang dibeli |
| `inventory_item_id` | Barang fisik di gudang |
| `status` | Sama seperti status di `orders` |
| `sale_price` | **Harga jual barang ini (USD).** Dasar perhitungan pendapatan |
| `created_at`, `shipped_at`, `delivered_at`, `returned_at` | Waktu kejadian |

### `products`: katalog produk

| Kolom | Arti |
| --- | --- |
| `id` | ID unik produk |
| `name` | Nama produk |
| `brand` | Merek |
| `category` | Kategori, misalnya `Jeans`, `Dresses`, `Sweaters` |
| `department` | `Men` atau `Women` |
| `cost` | Biaya pokok produk (USD) |
| `retail_price` | Harga jual normal (USD) |
| `sku`, `distribution_center_id` | Kode produk dan gudang |

### `inventory_items`: stok barang di gudang (satu baris = satu barang fisik)

| Kolom | Arti |
| --- | --- |
| `id` | ID unik barang fisik |
| `product_id` | Produk |
| `created_at` | Waktu barang masuk gudang |
| `sold_at` | Waktu barang terjual. **Kosong (NULL)** jika belum terjual |
| `cost` | Biaya barang |
| `product_category`, `product_brand`, `product_name`, `product_retail_price`, `product_department` | Salinan info produk, jadi tabel ini bisa dipakai tanpa JOIN |

### Tabel lain

- `distribution_centers`: lokasi gudang.
- `events`: aktivitas pengunjung di website (melihat halaman, menambah ke keranjang, dan sebagainya). Cocok untuk analisis mandiri di sesi 12.

## Definisi metrik yang dipakai di kursus

Supaya angka kita konsisten, gunakan definisi ini kecuali ada alasan khusus:

| Metrik | Definisi | SQL |
| --- | --- | --- |
| **Pendapatan (revenue)** | Total `sale_price` dari barang yang **tidak** dibatalkan dan **tidak** dikembalikan | `SUM(sale_price)` dengan `WHERE status NOT IN ('Cancelled', 'Returned')` |
| **Jumlah pesanan** | Jumlah `order_id` unik | `COUNT(DISTINCT order_id)` |
| **Rata-rata nilai pesanan (AOV)** | Pendapatan ÷ jumlah pesanan | `SUM(sale_price) / COUNT(DISTINCT order_id)` |
| **Margin** | Harga jual − biaya pokok | `sale_price - cost` (cost dari `products`) |
| **Pelanggan aktif** | Pelanggan dengan minimal 1 pesanan yang sah | `COUNT(DISTINCT user_id)` |

**Bulan berjalan.** Dataset terus bertambah, jadi bulan ini selalu belum lengkap. Saat membuat tren bulanan, buang bulan berjalan supaya grafik tidak terlihat "anjlok" di ujung:

```sql
WHERE DATE(created_at) < DATE_TRUNC(CURRENT_DATE(), MONTH)
```

**Zona waktu.** Semua kolom waktu (`created_at` dan lainnya) tersimpan dalam UTC.
