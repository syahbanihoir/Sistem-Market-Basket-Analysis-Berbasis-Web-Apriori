# 📌 IMPLEMENTASI DATA MINING DENGAN ALGORITMA APRIORI BERBASIS WEB UNTUK ANALISIS DATA PENJUALAN PADA ROEMAH PANGAN ABADI

# Pemahaman Bisnis
Roemah Pangan Abadi merupakan unit bisnis dari PT Sentral Niaga Anugerah yang bergerak dalam penjualan produk makanan beku (frozen food). Permasalahan bisnis yang dihadapi adalah ketidakseimbangan stok—baik kelebihan maupun kekurangan stok—yang berdampak pada kerugian operasional dan penurunan kepuasan pelanggan.
Dalam upaya meningkatkan strategi penjualan dan efisiensi pengelolaan stok, diperlukan pemahaman mendalam terhadap pola pembelian konsumen. Data transaksi penjualan yang selama ini hanya digunakan sebagai laporan, memiliki potensi besar untuk dianalisis menggunakan teknik data mining. Dengan pendekatan Market Basket Analysis menggunakan algoritma Apriori, perusahaan dapat mengidentifikasi kombinasi produk yang sering dibeli bersama oleh konsumen, sehingga dapat digunakan untuk merancang strategi seperti paket bundling, penempatan produk, dan pengendalian stok yang lebih akurat.

# Ruang Lingkup
Ruang lingkup proyek dalam penelitian ini meliputi:
 - Pengumpulan dan penggunaan data transaksi penjualan dari periode 1 Februari hingga 30 April 2024, dan data yang digunakan terdiri dari tanggal transkasi dan item transaksi.
 - Penggunaan algoritma Apriori dengan metode Association Rules untuk menggali pola pembelian konsumen (frequent itemset) dan menghasilkan aturan asosiasi berdasarkan nilai support dan confidence.
 - Pengembangan aplikasi berbasis web yang memungkinkan pengguna (admin) mengunggah file Excel (.xls), memproses data, dan menampilkan hasil aturan asosiasi dalam bentuk visualisasi.
 - Validasi hasil analisis dilakukan dengan pembandingan perhitungan manual menggunakan Microsoft Excel.
 - Sistem tidak mencakup otomatisasi manajemen stok atau sistem rekomendasi lanjutan, melainkan fokus pada penyajian informasi pola pembelian yang dapat digunakan dalam pengambilan keputusan strategis.

# PERSIAPAN
Data penjualan yang digunakan dalam penelitian ini berasal dari periode 01 Februari 2024 hingga 30 April 2024, dengan total sebanyak 992 record. Data transaksi penjualan tersebut masih bersifat mentah atau belum siap untuk dianalisis, sehingga diperlukan tahapan seleksi data, preprocessing, dan transformasi data sebagai berikut:
 - Seleksi Data, Dari 992 record yang terdiri atas 15 atribut kolom, dilakukan proses seleksi dengan memilih hanya 2 atribut yang relevan, yaitu date dan items, yang digunakan sebagai dasar analisis pola transaksi.
 - Preprocessing Data, Dilakukan pembersihan data dengan cara menghapus transaksi yang tidak relevan, yaitu transaksi yang hanya berisi satu jenis produk, karena tidak dapat membentuk asosiasi antar produk.
 - Transformasi Data, Data yang semula berformat .csv diubah menjadi format .xls agar sesuai dengan format input yang dapat diproses oleh sistem web yang dikembangkanem.

# Kesimpulan
Hasil dari penerapan data mining menggunakan algoritma Apriori dengan metode Association Rule dalam aplikasi berbasis web terhadap data transaksi penjualan Roemah Pangan Abadi menunjukkan bahwa, dengan memasukkan nilai minimum support sebesar 10% dan minimum confidence sebesar 25%, terbentuk 10 aturan asosiasi.
Aturan dengan nilai confidence tertinggi sebesar 57,33% dan nilai lift sebesar 1,36 ditemukan pada kombinasi produk Nugget Boss 1kg dan Kentang Harvest 1kg. Hasil visualisasi  dapat dilihat pada gambar berikut: 
<img width="1919" height="885" alt="image" src="https://github.com/user-attachments/assets/1872af80-4f17-40f1-9665-11dc10d22b86" />

# TAMPILAN SISTEM
<h2>Tampilan Layar Admin</h2>
<img width="1919" height="860" alt="image" src="https://github.com/user-attachments/assets/0a173239-cd24-4ca8-aa12-9fc9bad46097" />
<img width="1919" height="878" alt="image" src="https://github.com/user-attachments/assets/435efa95-81d2-4550-8082-f8ddac3cce50" />
<img width="1919" height="888" alt="image" src="https://github.com/user-attachments/assets/9f66abe2-23f0-4771-8189-3ecdb2974120" />
<img width="1919" height="873" alt="image" src="https://github.com/user-attachments/assets/4869a422-5c86-4f01-91a1-4be5b094325c" />
<img width="1919" height="881" alt="image" src="https://github.com/user-attachments/assets/05899416-b41d-4036-947b-56b1c69ffce7" />
<img width="1919" height="881" alt="image" src="https://github.com/user-attachments/assets/7493152e-a9c3-4ef0-b828-570a41adcf76" />
<img width="1919" height="885" alt="image" src="https://github.com/user-attachments/assets/b78cd42f-cc3d-47ec-ae40-598d8094a0b6" />
<img width="1919" height="883" alt="image" src="https://github.com/user-attachments/assets/b2c184b4-2334-4086-9946-bcf5f82139bc" />
<img width="1919" height="877" alt="image" src="https://github.com/user-attachments/assets/d243cd51-a148-4480-b77e-2c67fde54321" />
<img width="1919" height="865" alt="image" src="https://github.com/user-attachments/assets/896d3ad7-3bad-41cf-a36c-30f8fe965f77" />
<img width="1893" height="876" alt="image" src="https://github.com/user-attachments/assets/007c7312-e739-495d-a27d-217b6e5fb45d" />
<img width="1919" height="873" alt="image" src="https://github.com/user-attachments/assets/22bd47f3-b1e3-42ce-8b69-542de4263ce8" />
<img width="1919" height="875" alt="image" src="https://github.com/user-attachments/assets/109b94cb-4139-4dd7-9d64-531b6d9bf30d" />

<h2>Tampilan Layar User</h2>
<img width="1919" height="864" alt="image" src="https://github.com/user-attachments/assets/e02ebbb5-2724-4fb3-9026-1074e21804fc" />
<img width="1919" height="884" alt="image" src="https://github.com/user-attachments/assets/14f21c20-049e-4e5c-8bce-d96188faa67b" />
<img width="1917" height="873" alt="image" src="https://github.com/user-attachments/assets/adecee25-3749-48b1-a1f1-8166c954ba0c" />
<img width="1919" height="875" alt="image" src="https://github.com/user-attachments/assets/74630d73-eae6-4e9c-b0a9-442a608bcb5d" />










