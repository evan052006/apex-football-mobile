# Apex Football

## Tugas 7

### Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

Widget tree adalah struktur data yang merepresentasikan widget pada flutter (seperti struktur data tree). Dengan fungsi untuk merepresentasikan visual dari UI. Setiap widget dibangun dalam widget tree berdasarkan hierarki. Parent widget berfungsi untuk mengatur atribut terkait child widgetsnya (bisa lebih dari satu child). Biasanya atribut yang diatur adalah terkait posisi penempatan dan ukuran.

### Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

#### Scaffold
Widget yang bersifat seperti container yang berekspansi ke seluruh layar sekarang. Scaffold juga memberikan beberapa parameter yang membuatnya cocok untuk child dari root widget. Parameter AppBar dapat digunakan untuk menampilkan bar diatas layar yang dapat digunakan untuk menampilkan nama app (Flag "DEBUG" juga muncul jika flutter dilaunch mode debugging).

#### AppBar
Secara default widget AppBar memiliki Leading (seperti tempat logo atau judul website, ataupun tombol menu), Actions (Tombol yang dapat dipencet untuk aksi, biasanya digunakan untuk navigasi), dan title (judul dari App kita). Umumnya digunakan sebagai child dari Scaffold.

#### Text
Widget sederhana untuk menampilkan teks. Parameter yang saya pakai ditugas ini pertama jelas (teksnya sendiri), lalu parameter textAlign yang berfungsi mengatur alignment teks (Seperti align left, align center, align justify, dll) dari class TextAlign. Parameter style menerima class TextStyle yang berisi segala hal terkait penampilan teks tersebut (Seperti color dan fontweight)

#### Padding
Widget yang berfungsi memberi suatu child widget suatu padding. Parameter padding menerima class EdgeInSets untuk mendefinisikan padding yang diperlukan. Fungsi EdgeInSets.all(double v) mendefinisikan "kasih spasi sejauh v pada setiap arah dari child widgetnya". Sedangkan fungsi EdgeInSets.only(...) menerima parameter arah top, left, right, bottom nilai double untuk mendefinisikan jarak padding dari arah tersebut. Lalu letakkan widget yang ingin dipadding ke child parameter. 

#### Column
Widget yang berfungsi sebagai container banyak widget lainnya, dimana widget tersebut akan diposisikan (lebih intuitifnya) perbaris. Setiap item parameter children pada container Column  memposisikan widget tersebut di barisnya masing - masing. Parameter crossAxisAlignment dan mainAxisAlignment mereferensi hal berikut.
![CrossMainAxis](https://samanthaming.gumlet.io/flexbox30/4-flexbox-axes.jpg.gz?format=auto)
Dimana dalam kasus Column, main axis adalah sumbu vertikal yang jika diset ke center maka children akan diposisikan ke tengah (dalam konteks ini akan meletakkan objek ke tengah layar secara vertikal), dalam projek saya tidak diset maka menggunakan default yaitu start (diletakkan di atas layar). Namun dalam menata body utama, saya gunakan crossAxisAlignment agar objek diletakkan layar ke tengah secara horizontal.

#### Row
Widget ini berfungsi sama persis widget Column sebelumnya, hanya saja terbalik dimana objek diletakkan dari kiri ke kanan. Parameter child dan crossAxisAlignment dan mainAxisAlignment sama dengan Column, hanya saja di flip antar main dan cross axis. Dalam tugas ini saya pakai untuk menata Card ke suatu baris dari kiri ke kanan, salah satu alignment yang digunakan adalah MainAxisAlignment.spaceEvenly untuk penempatan NPM, Nama, dan Kelas

#### SizedBox
Widget ini membuat suatu box, dengan parameter ukuran fixed, dalam kasus ini hanya dipakai dengan Row atau Column untuk memberikan jarak antara Axis utama. Saat tidak memiliki child, widget ini berusaha mengubah ukuran agar dekat dengan ukuran fixed tanpa terlalu jauh dari constrain parent layout.

#### Center
Widget sederhana untuk memposisikan child widget tepat ditengah. Dipakai untuk majoritas widget agar align ketengah.

#### Icon
Widget yang berisi beberapa default icon yang diberikan library material. Saya gunakan Icons.storefront, Icons.sell, dan Icons.add untuk melambangkan masing - masing tombol.

#### GridView
Widget ini digunakan sebagai alternatif menata 3 tombol secara horizontal. Parameter primary menandakan apakah terasosiasi dengan aksi scroll parent widget. Parameter padding di tambahkan ke main container GridView saja (bukan padding tiap cell). Parameter crossAxisSpacing dan mainAxisSpacing dapat digunakan untuk memasang spacing pada direction setiap axis, sehingga dapat digunakan untuk mengatur gap antar cell. Tipe GridView.count dipakai sehingga jumlah cell pada crossAxis bersifat fixed. Parameter shrinkwrap dipakai untuk membatasi maximum scroll alignment sesuai ukuran GridView jika true. Akhirnya parameter children ditambahkan dan akan diurutkan sesuai crossAxis count dahulu jika pakai constructor count.


#### Card
Widget berbasis material design Card yang berbentuk suatu panel dengan sudut bulat. Parameter elevasion digunakan untuk mengatur z axis pada shadow Card. Lalu dapat diisi widget child untuk meletakkan widget didalamnya.

#### Container 
Widget umum yang digunakan untuk memposisikan suatu child widget dengan fitur mengatur posisi, pewarnaan, dan ukuran widgets. Yang digunakan dalam tugas ini so far hanya Padding (mirip widget padding) dan width. Digunakan pada cards setiap operasi produk dimana width diatur menggunakan build context (mengambil atribut MediaQuery.of(context).size.width yang mengembalikan nilai lebar perangkat keras dan diset agar berukuran /3.5 dari ukuran lebar perangkat keras). 

#### MyHomePage
Custom widget root dari halaman utama.

#### InfoCard
Custom widget yang digunakan untuk menampilkan card NPM, nama, kelas, atau informasi lainnya. Memiliki parameter judul dan kontek dari informasinya.

#### SnackBar
Custom widget yang melambangkan popup sementara yang menandakan keberhasilkan atau informasi suatu operasi. Biasanya ditampilkan dengan ScaffoldMessager yang akan menampilkan SnackBarnya pada Scaffold yang digunakan sekarang. Pada tugas digunakan pada setiap ItemCard agar bisa menampilkan SnackBar yang berbeda-beda. Note penampilan SnackBar ScaffoldMessager bersifat mutually exclusive, sehingga hanya satu SnackBar bisa tampil dalam suatu kurun waktu.

#### InkWell
Custom widget yang menampilkan animasi seperti cat lukisan jika dihover, dan jika dipencet juga ada animasinya. Parameter onTap dapat digunakan untuk mendefinisikan fungsi apa yang terjadi jika dipencet. Dalam tugas ini digunakan untuk menghapus buffer SnackBar sekarang pada ScaffoldMessager dan menambahkan SnackBar yang diinginkan.

#### ItemCard
Custom widget yang menampilkan tombol operasi CRUD product. Menerima Icon untuk tombol, teks untuk operasinya, warna containernya, serta SnackBar yang ingin ditampilkan jika tombol diklik.

#### Material
Custom widget dari Material design yang dapat digunakan untuk mengatur warna dan border radius suatu desain (Nanti dapat digunakan untuk menambahkan efek elevation, clipping, dan efek tinta). Digunakan dalam tugas ini untuk styling tombol setiap operasi product.

Referensi
- [SnackBar](https://api.flutter.dev/flutter/material/SnackBar-class.html)
- [InkWell](https://api.flutter.dev/flutter/material/InkWell-class.html)
- [Material](https://api.flutter.dev/flutter/material/Material-class.html)
- [Container](https://api.flutter.dev/flutter/widgets/Container-class.html)
- [Card](https://api.flutter.dev/flutter/material/Card-class.html)
- [GridView](https://api.flutter.dev/flutter/widgets/GridView-class.html)
- [Icon](https://api.flutter.dev/flutter/widgets/Icon-class.html)
- [Center](https://api.flutter.dev/flutter/widgets/Center-class.html)
- [SizedBox](https://api.flutter.dev/flutter/widgets/SizedBox-class.html)
- [Scaffold](https://www.geeksforgeeks.org/flutter/scaffold-class-in-flutter-with-examples/)
- [AppBar](https://www.geeksforgeeks.org/flutter/flutter-appbar-widget/)
- [Row](https://api.flutter.dev/flutter/widgets/Row-class.html)
- [Text](https://api.flutter.dev/flutter/widgets/Text-class.html)
- [EdgeInSets](https://api.flutter.dev/flutter/painting/EdgeInsets-class.html)
- [Padding](https://api.flutter.dev/flutter/widgets/Padding-class.html)

### Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
Widget ini berfungsi sebagai root dari berbagai widget yang disediakan library Material. Memberikan fungsionalitas themes (agar desain konsisten), routing (navigasi antar layar), dan juga localization (perubahan bahasa sesuai pengguna). Sering digunakan karena jika diinginkan memakai fitur tersebut, MaterialApp memerlukan 

[Referensi](https://www.cmsgalaxy.com/blog/materialapp-class-in-flutter/)

### Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
StatelessWidget digunakan jika semua field pada widget tidak berubah seiring program berjalan. Cocok dipilih untuk hal seperti bagian informasi, halaman Contact Us, dll.
StatefulWidget digunakan jika ada setidaknya suatu field yang dapat berubah - ubah seiring program berjalan. Contohnya jika ingin menampilkan semua produk, maka widget yang menapung produk tersebut harus menggunakan stateful widget agar flutter dapat rebuild widgetnya dari widget tree.
[Referensi](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)


### Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
Setiap widget tidak menyimpan posisinya dalam tree secara eksplisit. Sehingga jika suatu widget perlu informasi terkait widget tree yang ingin dibuild sekarang (MediaQuery, Navigation, Theme), Fungsi ini jadi membutuhkan context widget tree sekarang bagaimana. Penggunaannya di metode build di passing sebagai function arguments, yang nanti akan dipassing dari widget tree tersendiri

[Referensi](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)


### Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
Building time di flutter umumnya relatif lama. Akan tedious jika harus menunggu build time jika hanya perlu tes bagaimana UI sekarang. Maka Hot Reload dibuat agar program dikompilasi ulang (hanya pada kode baru)  sehingga perbaruan kode dapat tampil pada program. Perbedaan utama dengan hot restart adalah Hot Reload tidak mereset State suatu StatefulWidget. Perubahan class jadi enumerate data dan sebaliknya juga tidak akan diubah oleh hot reload, sedangkan hot restart dalam melakukannya. Hot reload lebih cepat dari Hot restart, namun keduanya masih jauh lebih cepat daripada build kodenya dari awal.

[Referensi](https://www.geeksforgeeks.org/flutter/difference-between-hot-reload-and-hot-restart-in-flutter/)

## Tugas 8

### Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

Navigator mengatur stack layar pada program dimana stack paling atas yang ditampilkan. Misalkan sekarang stacknya (dengan A stack paling bawah)

/A

/B

Dan ingin menambahkan layar baru C, Navigator.push() akan sederhana menambahkan layar baru menjadi berikut

/A

/B

/C

Perhatikan layar sebelumnya juga masih aktif, jika user gunakan tombol back pada mobile device. Maka akan kembali ke halaman B (melakukan pop pada stack).
Sedangkan Navigator.pushReplacement() akan menyebabkan status layar berikut

/A

/C

Dimana layar B (top of stack) digantikan layar baru C. 

pushReplacement baik digunakan jika tidak diperlukan navigasi ke halaman sebelumnya, biasanya ini cocok untuk halaman - halaman utama yang memang tidak perlu ada halaman sebelumnya. Dalam tugas saya, layar Add Product dan Show Products berfungsi sebagai halaman utama, maka tombol drawer ke halaman tersebut sebaiknya gunakan saja pushReplacement agar overwrite layar sebelumnya. 
(Latihan 2024-25) Seorang turis yang saat ini sedang berada di Jakarta ingin pergi
mengunjungi kota Honolulu menggunakan maskapai Cheapest Airways yang merupakan
maskapai favoritnya. Turis tersebut akhirnya mengunjungi sebuah agen perjalanan
terkemuka di kota Jakarta. Sesampainya di kantor agen perjalanan tersebut, turis tersebut
diberikan daftar penerbangan yang dilayani oleh maskapai Cheapest Airways sebagai
berikut:
● Jakarta – Singapore ($100)
● Jakarta – Denpasar ($140)
● Denpasar – Manila ($40)
● Denpasar – Bangkok ($80)
● Singapore – Bangkok ($120)
● Manila – Bangkok ($70)
● Singapore – Hongkong ($160)
● Bangkok – Tokyo ($60)
● Manila – Kyoto ($110)
● Kyoto – Tokyo ($30)
● Hongkong – Honolulu ($90)
● Tokyo – Honolulu ($50)
● Kyoto – Honolulu ($150)
(*) Catatan: Daftar penerbangan yang dilayani oleh maskapai Cheapest Airways diatas
berlaku dua arah.
a. Gambarkan rute penerbangan yang dilayani oleh maskapai Cheapest Airways
tersebut ke dalam representasi struktur data graph (logical).
b. Berapakah biaya termurah yang harus dikeluarkan oleh turis tersebut untuk pergi ke
kota tujuannya? (Gunakan Dijstra Algorithm, buat predecesor Tablenya)
c. Bagaimana rute penerbangan dengan biaya termurah tersebut
push baik digunakan untuk subhalaman pada setiap halaman utama. Contoh jika pada halaman Show Product, diperlukan tampil halaman baru sementara untuk detail setiap produk, maka push memastikan user dapat cepat kembali ke halaman utama (Show Product).

### Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

Definisi "struktur halaman yang konsisten" umumnya refer pada tampilan visual yang tidak berbeda drastis antar satu halaman dengan halaman lainnya. Scaffold berfungsi agar setiap halaman mengikuti struktur basic yang mudah digunakan. Scaffold dapat mengandung AppBar yang berfungsi sebagai header atau judul pada halaman sehingga memudahkan user mengetahui sekarang sedang menggunakan aplikasi saya. Drawer berfungsi sebagai tab navigasi yang mudah dan intuitif digunakan. Dengan menggunakan Scaffold untuk setiap halaman utama aplikasi dimana terdiri dari AppBar sebagai judul aplikasi dan Drawer sebagai alat navigasi antar halaman, maka setiap struktur halaman menjadi konsisten pada seluruh aplikasi.

### Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

Sesuai namanya layout widget membantu simplifikasi implementasi memposisikan widgets sesuai kebutuhan. Dalam konteks elemen form, Padding berfungsi memberikan spasi kecil antar ujung layar sehingga field lebih enak dilihat. Lalu SingleChildScrollView berfungsi agar saat field diperbanyak, pengguna bisa "mengscroll" layarnya. Saya tidak menggunakan ListView dalam Form, namun dapat digunakan untuk pemilihan kategori dengan menyebarkan opsi sebagai ListItem. ListView sendiri digunakan untuk Drawer untuk menampilkan setiap tombol seperti list.     

[Referensi](https://docs.flutter.dev/ui/widgets/layout)

### Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Saya sesuaikan dengan tema pada tugas web Apex Football sebelumnya dengan color scheme abu - abu dan keputihan. saya buat sesuai dengan cara mengset color scheme default pada main.dart (Primary color, onPrimary color, etc). Sehingga tidak perlu mengetik semua warna elemen.

## Tugas 9

### Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
Tanpa model pada flutter, kita harus manual membuat dan memproses field setiap model. Hal ini menyulitkan diri dalam segi maintainability. Selanjutnya dengan model kita dapat membuat kontrol validasi tipe dan null-safety yang modular (setiap kali memproses objek, dijamin aplikasi akan melemparkan error jika fieldnya tidak legal). Jika langsung pakai Map<String, dynamic>, tipe data setiap field tidak terkontrol (menggunakan dynamic type), sehingga menjadi lebih mudah terkena error validasi data dan null pointer errors.

 ### Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.

http adalah library bawaan dari flutter yang berfungsi menghandle http request dan response secara primitif. Sedangkan CookieRequest adalah class yang bertugas maintain header dan cookie suatu http session bagaikan browser. CookieRequest juga handle autentikasi dan memiliki fungsi async bawaan berdasarkan http dengan tujuan memudahkan development.
[Referensi](https://github.com/pbp-fasilkom-ui/pbp_django_auth/blob/main/lib/pbp_django_auth.dart)

### Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
CookieRequest juga menyimpan cookie yang dibutuhkan agar Django mengenal sessionid suatu user. Anggapnya seperti kita perlu membuat browser, jika ada banyak window browser (asumsi same user) seharusnya semua window tersebut menggunakan http cookie yang sama. Dalam flutter, setiap window bagaikan komponen widget, dimana kita membutuhkan setiap komponen share the same cookie.
[Referensi](https://github.com/pbp-fasilkom-ui/pbp_django_auth/blob/main/lib/pbp_django_auth.dart)


### Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
Kita perlu menambahkan 10.0.2.2 karena ip pada android emulator tidak langsung terhubung pada localhost. Ini berfungsi agar emulation pada androidnya lebih "virtualised" atau "terbungkus", sehingga localhost pada android benar - benar mereferensi localhost device tersebut. Jika tidak dilakukan, android tidak bisa akses endpoint server djangonya (bagaikan linknya tidak exist).

Penambahan izin akses jelas dilakukan untuk kepentingan keamanan dan privasi, majoritas perangkat lunak ponsel perlu eksplisit bilang akses yang diperlukan agar dapat tertampil jelas pada user bahwa app kita melakukan koneksi internet. Jika tidak dilakukan maka aktivitas terkait network akan gagal (usually silently) tergantung sistem operasinya.

CORS stands for Cross-Origin Resource Sharing, yang memperbolehkan suatu situs mendapatkan data dari situs lainnya lewat API dan sebagainya. CORS pada Django defaultnya hanya akan menerima jika originnya sama (sehingga prevent hal seperti CSRF attack). Namun dalam kasus tugas pbp, CORS cenderung mempersulit development awal karena harus memastikan mengset setiap external API yang digunakan. Maka pada Django disetting pada tugas CORS_ALLOW_ALL_ORIGINS = True dan CORS_ALLOW_CREDENTIALS = True agar link dapat diakses. Selanjutnya di setting CSRF_COOKIE_SECURE = True dan SESSION_COOKIE_SECURE = True agar Django langsung menandakan csrf cookie sudah otomatis aman. CSRF_COOKIE_SAMESITE = 'None' dan SESSION_COOKIE_SAMESITE = 'None' agar http library kita tidak otomatis melakukan pengecekan keamanan terkait CSRF.

[CSRF samesite](https://owasp.org/www-community/SameSite)
[CORS Reference](https://aws.amazon.com/what-is/cross-origin-resource-sharing/)
[Endpoint Reference](https://stackoverflow.com/questions/76300572/how-to-connect-localhost-django-rest-api-to-android-emulator)


### Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Karena filtering saya dilakukan pada flutter maka saya perlu membuat global provider bernama uid provider yang menyetor uid user django. Saya gunakan MultiProvider dalam main.dart untuk menggunakan multiple provider (untuk cookie request dan juga uid). Berikutnya kedua provider dibaca pada halaman product entry list, CookieRequest akan melakukan low level fetching via library http, kemudian Django akan memproses request tersebut dan mengembalikan JSONResponse yang sesuai. Lalu mengembalikan responsenya, lalu dengan class dari quicktype, akan otomatis diproses menjadi data type ProductEntry. Jika filtering adalah all maka secara sederhana ditampilkan setiap entry sebagai card, namun jika ada filter, hanya akan ditampilkan produk yang uidnya sesuai dengan uid yang sedang logged in sekarang.


### Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Dalam konteks login / register / logout, input pertama menggunakan input field form dari flutter. Dari input field ini dilakukan validasi input sederhana seperti cek apakah kosong atau tidak. Setelah field tervalidasi, dengan CookieRequest provider akan melakukan request http pada server (dengan mengirimkan form data username dan password). Lalu setelah diterima django, akan diproses dan mengembalikan JSONResponse yang menjelaskan apakah autentikasinya gagal atau berhasil dan ditampilkan pada aplikasi.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).


#### Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.
Mengubah Django field thumbnail menjadi non nullable tapi bisa blank agar lebih mudah prosesnya di flutter.

#### Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter.
Pertama dibuat view register khusus api yang akan membuat user baru dan mengembalikan JSON untuk menampilkan statusnya. Lalu pada flutter dibuat page register yang berisi input form field untuk divalidasi level client, dan kemudian menggunakan library http pbp untuk melakukan akses pada api endpoint tersebut. 

#### Membuat halaman login pada proyek tugas Flutter.
Secara sederhana menggunakan input form field seperti sebelumnya dan melakukan fetch pada server.

#### Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
Sudah dijelaskan pada poin sebelumnya.

#### Membuat model kustom sesuai dengan proyek aplikasi Django.
menggunakan https://app.quicktype.io/ lalu memasukkan sample data jsonnya

#### Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
menggunakan future builder sehingga bisa async (fungsi futurenya simply mengembalikan objek produknya). Lalu ditampilkan sebagai listview

#### Tampilkan name, price, description, thumbnail, category, dan is_featured dari masing-masing item pada halaman ini (Dapat disesuaikan dengan field yang kalian buat sebelumnya).
Dari snapshot array maka langsung di tampilkan dengan widgetnya masing masing

#### Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
Membuat wwidget baru yang menerima model yang diperlukan, (sehingga lebih mudah integrasinya)

#### Halaman ini dapat diakses dengan menekan salah satu card item pada halaman daftar Item.
Membuat fungsi ontap yang redirection ke widget detailnya (pass class modelnya)

#### Tampilkan seluruh atribut pada model item kamu pada halaman ini.
Gunakan widget yang diperlukan saja.

#### Tambahkan tombol untuk kembali ke halaman daftar item.
Tambahkan tombol yang pop navigatornya

### Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.
Sudah dijelaskan pada poin sebelumnya.

