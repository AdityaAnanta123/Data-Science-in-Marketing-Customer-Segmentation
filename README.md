# Data-Science-in-Marketing-Customer-Segmentation
Analysis Segmentation Customer Data using Clustering K-Means with R

Berikut adalah langkah-langkah singkat untuk membuat repository GitHub dan melakukan clustering menggunakan K-Means pada dataset yang Anda berikan:

Langkah-langkah Script R:

Import dan Preprocessing:
Dataset customer_segments.txt diimpor dengan menggunakan read.csv dan diproses untuk mengubah kolom kategori (Jenis Kelamin, Profesi, Tipe Residen) menjadi numerik menggunakan data.matrix.

Normalisasi:
Kolom NilaiBelanjaSetahun dinormalisasi dengan membagi nilai dengan 1.000.000.

Clustering dengan K-Means:
K-Means digunakan untuk membagi data menjadi 5 cluster dengan fitur Jenis.Kelamin, Umur, Profesi, Tipe.Residen, dan NilaiBelanjaSetahun.
Algoritma dijalankan 25 kali untuk hasil yang lebih stabil.

Metode Elbow untuk Menentukan Jumlah Cluster Optimal:
Metode Elbow digunakan untuk menentukan jumlah cluster terbaik dengan menganalisis SSE (Sum of Squared Errors) pada jumlah cluster dari 1 hingga 10.

Penamaan Segmen dan Penyimpanan Model:
Setiap cluster diberi nama segmen. Nama Segmen dikategorikan lewat Cluster sebagai berikut :
Cluster 1 : Silver Youth Gals: alasannya adalah karena umurnya rata-rata adalah 20, wanita semua, profesinya bercampur antar pelajar dan professional serta pembelanjaan sekitar 6 juta.
Cluster 2 : Diamond Senior Member: alasannya adalah karena umurnya rata-rata adalah 61 tahun dan pembelanjaan di atas 8 juta.
Cluster 3 : Gold Young Professional: alasannya adalah karena umurnya rata-rata adalah 31 tahun, professional dan pembelanjaan cukup besar.
Cluster 4 : Diamond Profesional: alasannya adalah karena umurnya rata-rata adalah 42 tahun, pembelanjaan paling tinggi dan semuanya professional.
Cluster 5 : Silver Mid Professional: alasannya adalah karena umurnya rata-rata adalah 52 tahun dan pembelanjaan sekitar 6 juta.
Model clustering disimpan dalam file cluster.rds.
