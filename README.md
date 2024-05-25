# Analyzing eCommerce Business Performance with SQL

**Tool** : PostgreSQL<br>
**Programming Language** : SQL<br>
**Visualization** : Looker<br>
**Source Dataset** : Rakamin Academy<br>
<br>

**Table of Content**
* Case Study
* Data Preparation
* g
* g
* g
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

##










