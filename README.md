# Analyzing eCommerce Business Performance with SQL

**Tool** : PostgreSQL<br>
**Programming Language** : SQL<br>
**Visualization** : Looker<br>
**Source Dataset** : Rakamin Academy<br>
<br>

**Table of Content**
* Case Study
* Data Preparation
* Annual Customer Activity Growth
* Annual Product Category Quality Analysis
* Annual Payment Type Usage Analysis
---

## Case Study
Dalam suatu perusahaan mengukur performa bisnis sangatlah penting untuk melacak, memantau, dan menilai keberhasilan atau kegagalan dari berbagai proses bisnis. Oleh karena itu, dalam paper ini akan menganalisa performa bisnis untuk sebuah perusahan eCommerce, dengan memperhitungkan beberapa metrik bisnis yaitu **pertumbuhan pelanggan**, **kualitas produk**, dan **tipe pembayaran**!

## Data Preparation
Untuk melakukan analisis preforma bisnis dari suatu eCommerce perlu dilakukan data preparation terlebih dahulu, dengan begitu akan memudahkan langkah data processing dan analysing kedepannya. Berikut ini adalah hal-hal yang telah saya lakukan pada kegiatan data preparation.<br>

**Membuat Database Baru**<br>
Database baru dibuat untuk menampung table-table yang berisi informasi mengenai kegiatan bisnis eCommerce.  Query yang digunakan adalah CREATE DATABASE <nama database>.<br> 
![image](https://github.com/alfatharr/ecommerce-performance/assets/156917349/ffa36d0e-3636-412c-90ec-b1033df5ded6)

**Membuat table baru**<br>
Table-table dibuat berdasarkan file csv yang ada sebagai acuan untuk menentukan kolom dan data type pada kolom tersebut. Query yang digunakan adalah CREATE TABLE <nama table>.<br>
![image](https://github.com/alfatharr/ecommerce-performance/assets/156917349/d3915325-c70a-4f6a-8e9b-87a8321995ed)

**Upload file csv**<br>
Setelah table siap, kegiatan berikutnya adalah mengunggah file csv berdasarkan table yang tersedia dengan mengimpor dari file komputer.

**Menentukan Primary Key dan Foreign Key**<br>
Primary Key digunakan sebagai acuan kolom lain pada table, sehingga nilainya tidak boleh null dan harus unique. Sementara itu, Foreign Key digunakan untuk relasi antartabel nantinya. Query yang digunakan yaitu menggunakan CONSTRAINT <nama constraint> PRIMARY KEY <nama kolom> dan ALTER TABLE <nama table> ADD FOREIGN KEY <nama kolom>. Berikut ini adalah Primary key dari tabel yang telah dibuat.

| No | Tabel         |  Primary Key       |
| -- | ------------- | ------------------ |
| 1  | cutsomers     | 'customer_id'      |
| 2  | orders        | 'order_id'         |
| 3  | product       | 'product_id'       |
| 4  | seller        | 'seller_id'        |
| 5  | reviews       | 'review_id'        |
| 6  | geolocation   | 'zip_prefix_code'  |

**Menghapus duplikat pada kolom zip-code-prefix dari table geolocation**<br>
Alasan duplikat dihapus karena pengasumsian bahwa satu kode pos dapat mewakili daerah yang tergabung di dalam kota yang sama. Selain itu, pada table geolocation tidak mempunyai Primary Key karena hubungan antara table geolocation dengan yang lainnya adalah many-to-many. Lagipula kolom kode pos, city, dan state sudah terwakili di dalam table lain.

**Membuat Entity Relationship Diagram**<br>
ERD dibuat berdasarkan relasi yang terjadi antartable. Dari ERD ini kita akan lebih mudah melihat garis relasi yang terjadi dari Foreign Key pada suatu table kepada table lainnya. Seperti yang terlihat pada ERD berikut, bahwa relasi yang terjadi adalah one-to-many relationship.
Entity Realtionship Diagram dibuat dengan cara men-generate ERD di database, KLIK KANAN <nama database> PILIH ERD FOR DATABASE atau bisa dibuat dengan cara manual, yaitu menentukan table mana saja yang akan digunakan pada ERD dan menentukan garis relasi untuk setiap table.
<br>
![image](https://github.com/alfatharr/ecommerce-performance/assets/156917349/b01c1d1c-eacd-41ff-a187-d17a1923b496)

## Annual Customer Activity Growth

Pada bagian pertama, kita ingin melihat bagaimanakah pertumbuhan dari customer setiap tahunnya. Pada dataset, diketahui bahwa bulan aktif pada tahun 2016 berjumlah empat bulan, bulan aktif pada tahun 2017 ada 12 bulan, dan bulan aktif pada tahun 2018 berjumlah 10 bulan. Perbedaan jumlah bulan ini juga mempengaruhi hasil query, dimana value pada tahun 2017 cenderung lebih besar daripada tahun lainnya. Walaupun dalam memproses data terkesan tidak apple-to-apple, namun kita masih bisa melihat gambaran umum customer activity growth dari tahun ke tahunnya.
<br>
![image](https://github.com/alfatharr/ecommerce-performance/assets/156917349/6d338fa1-048a-44c8-a66a-601a510e130b)

**Average Monthly Active Customers per Year**<br>
Dari 2016 sampai 2018, telah terjadi peningkatan keaktifan costumer. Hal ini menandakan setiap tahun customer aktif bertransaksi di marketplace eCommerce.
<br>
![image](https://github.com/alfatharr/ecommerce-performance/assets/156917349/ef1c25d3-af55-4351-9f5a-918043358953)

Dari grafik tersebut jelas bahwa setiap tahun keaktifan customer selalu mengalami peningkatan. Di tahun 2018 terjadi peningkatan keaktifan customer sebanyak 44.46% daripada tahun sebelumnya.

**Average Order Frequency per Customer**
Dari data ini kita dapat mengetahui banyaknya rata-rata jumlah order yang dilakukan perorangan di marketplace eCommerce ini setiap tahunnya.  Semakin tinggi nilainya, maka semakin banyak order yang dilakukan perorangnya.
<br>
![image](https://github.com/alfatharr/ecommerce-performance/assets/156917349/15638e68-2cfc-4d29-912c-c900f352bc0a)

Rerata order yang dilakukan customer sebanyak 1 kali. Walaupun secara aktivitas setiap tahun cenderung naik, namun untuk ukuran rerata order customer mengalami penurunan di tahun 2018 sebanyak setengah dari kenaikan pada tahun 2017.

**Total New Customers per Year**
Total customer baru setiap tahunnya mengalami peningkatan seperti yang tersaji pada grafik berikut.
<br>
![image](https://github.com/alfatharr/ecommerce-performance/assets/156917349/80933a2c-0a6a-4a99-bb79-7725c53adf17)

Di tahun 2018 terjadi peningkatan jumlah customer baru sebanyak 8354 orang daripada tahun sebelumnya.

**Total Customers Who Repeat Their Orders**
Dari grafik ini kita bisa melihat jumlah customer yang melakukan repeat order.
<br>
<img src ="https://github.com/alfatharr/ecommerce-performance/assets/156917349/c125609b-e167-4c24-bd63-f633154733df" width = "600" height = "300">

Walaupun jumlah customer baru meningkat setiap tahun, ternyata pada tahun 2018 customer yang melakukan repeat order malah menurun dibandingkan tahun 2017.

##Annual Product Category Quality Analysis

Pada bagian kedua, kita ingin menganalisis kualitas kategori produk setiap tahunnya. Tabel yang digunakan untuk mendapatkan insight dari analisis tersebut adalah table orders, product, dan items. Berikut adalah insights secara garis besar dari dataset yang dimaksud.
<br>
![image](https://github.com/alfatharr/ecommerce-performance/assets/156917349/4da5e6ef-5fdf-4208-9f7a-1d49f4faf104)
<br>
Untuk analisis lebih lanjut mengenai total revenue pertahun dan total canceled order by product category akan mengacu pada master table berikut ini.
<br>
![image](https://github.com/alfatharr/ecommerce-performance/assets/156917349/d692feb9-3781-4e8a-977b-725c53b330f6)

**Total Revenue per Year**<br>
Dari 2016 sampai 2018, perusahaan eCommerce telah mendapatkan revenue total sebesar 15 juta dollar lebih dengan rincian sebagai berikut.
<br>
![image](https://github.com/alfatharr/ecommerce-performance/assets/156917349/6616ed4a-f588-4074-aef3-68afc499ec00)
<br>
Dari grafik tersebut jelas bahwa setiap tahun revenue perusahaan selalu mengalami peningkatan. Di tahun 2018 terjadi peningkatan keaktifan customer sebanyak 23%  daripada tahun sebelumnya.

**Total Revenue by Top Selling Product per Year**<br>
Berikut ini adalah product category yang menghasilkan revenue terbesar setiap tahunnya.
<br>
![image](https://github.com/alfatharr/ecommerce-performance/assets/156917349/b6e37a1b-25a4-4297-b6b3-7c5ec7887197)
<br>
Pada tahun 2016 product category yang memberikan revenue terbesar adalah furniture-décor. Pada tahun 2017 didominasi oleh bed-bath-table. Sementara itu, pada tahun 2018 revenue terbesar berasal dari product category  helalth-beauty.

**Total Canceled Order per Year**<br>
Selama tiga tahun total order yang telah di-cancel oleh customer adalah sebanyak 625 orderan. Berikut ini adalah rincian order yang di-cancel per tahunnya.
<br>
![image](https://github.com/alfatharr/ecommerce-performance/assets/156917349/1b0d038b-fbc4-4eb2-94ff-10df84ae3716)
<br>
Dari 2017 ke 2018 jumlah canceled order mengalami penurunan daripada periode sebelumnya. Namun demikian, jumlah canceled order per tahunnya tetap mengalami peningkatan.

**Total Canceled Order by Product Category**<br>
Berikut ini adalah order yang telah di-cancel terbanyak oleh customer berdasarkan kategori produk setiap tahunnya.
<br>
![image](https://github.com/alfatharr/ecommerce-performance/assets/156917349/0ab5443d-18fb-4cd0-9164-18124ba859b5)
<br>
Pada tahun 2016 produk yang di-cancel paling banyak adalah kategori toys. Pada tahun 2017 canceled order terbanyak berasal dari kategori sports-leisure. Sementara itu, pada tahun 2018 produk yang telah di-cancel oleh customer paling banyak berasal dari kategori health-beauty.

## Annual Payment Type Usage Analysis

Pada bagian ketiga, kita ingin menganalisis tipe pembayaran setiap tahunnya. Tabel yang digunakan untuk mendapatkan insight dari analisis tersebut adalah table orders dan product. Berikut adalah insights secara garis besar dari dataset yang dimaksud. Terdapat 5 jenis tipe pembayaran order produk oleh customer, dimana satu di antaranya adalah tipe not-defined. Tipe not-defined bisa diindikasikan dengan pembayaran yang tidak berhasil oleh customer atau pembayaran selain dengan empat tipe payment lain. Boleto atau billet jenis pembayaran yang dibuktikan dengan slip kertas bukti bayar. Credit card dan debit card adalah alat pembayaran non-tunai dengan kartu yang diterbitkan oleh bank, namun debit card langsung memotong uang yang ada di rekening nasabah. Voucher adalah pembayaran suatu order dengan menggunakan alat tukar tertentu.

**Number of Total Payment Type Used of All Time**<br>
Berikut ini adalah rincian tipe pembayaran yang digunakan oleh customer selama tiga tahun.
<br>
![image](https://github.com/alfatharr/ecommerce-performance/assets/156917349/bf896a54-33af-49e3-b3ca-82bb8695cafe)
<br>
Dari Table  kita dapat mengetahui bahwa tipe pembayaran yang menjadi favorit pelanggan adalah dengan menggunakan credit card. Hal ini bisa dimengerti karena credit card lebih aman untuk dibawa, pembayaran yang fleksibel, dan biasanya disertai dengan promo-promo menarik. Dari data di atas kita bisa menentukan program khusus bagi para pengguna credit card, seperti potongan diskon, program cicilan dengan bunga rendah, atau program gratis ongkir. Dengan begitu lebih banyak lagi customer yang terdorong untuk melakukan transaksi di eCommerce kita, sehingga revenue perusahaan pun akan semakin meningkat.





















