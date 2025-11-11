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

push baik digunakan untuk subhalaman pada setiap halaman utama. Contoh jika pada halaman Show Product, diperlukan tampil halaman baru sementara untuk detail setiap produk, maka push memastikan user dapat cepat kembali ke halaman utama (Show Product).

### Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

Definisi "struktur halaman yang konsisten" umumnya refer pada tampilan visual yang tidak berbeda drastis antar satu halaman dengan halaman lainnya. Scaffold berfungsi agar setiap halaman mengikuti struktur basic yang mudah digunakan. Scaffold dapat mengandung AppBar yang berfungsi sebagai header atau judul pada halaman sehingga memudahkan user mengetahui sekarang sedang menggunakan aplikasi saya. Drawer berfungsi sebagai tab navigasi yang mudah dan intuitif digunakan. Dengan menggunakan Scaffold untuk setiap halaman utama aplikasi dimana terdiri dari AppBar sebagai judul aplikasi dan Drawer sebagai alat navigasi antar halaman, maka setiap struktur halaman menjadi konsisten pada seluruh aplikasi.

### Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

Sesuai namanya layout widget membantu simplifikasi implementasi memposisikan widgets sesuai kebutuhan. Dalam konteks elemen form, Padding berfungsi memberikan spasi kecil antar ujung layar sehingga field lebih enak dilihat. Lalu SingleChildScrollView berfungsi agar saat field diperbanyak, pengguna bisa "mengscroll" layarnya. Saya tidak menggunakan ListView dalam Form, namun dapat digunakan untuk pemilihan kategori dengan menyebarkan opsi sebagai ListItem. ListView sendiri digunakan untuk Drawer untuk menampilkan setiap tombol seperti list.     

[Referensi](https://docs.flutter.dev/ui/widgets/layout)

### Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Saya sesuaikan dengan tema pada tugas web Apex Football sebelumnya dengan color scheme abu - abu dan keputihan. saya buat sesuai dengan cara mengset color scheme default pada main.dart (Primary color, onPrimary color, etc). Sehingga tidak perlu mengetik semua warna elemen.

