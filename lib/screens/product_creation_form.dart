import 'package:flutter/material.dart';
import 'package:apex_football/widgets/left_drawer.dart';
import 'package:flutter/services.dart';

class ProductCreationFormPage extends StatefulWidget {
  const ProductCreationFormPage({super.key});

  @override
  State<ProductCreationFormPage> createState() => _ProductCreationFormPageState();
}

class _ProductCreationFormPageState extends State<ProductCreationFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";
  String _category = "Footwear"; // default
  String _thumbnail = "";
  bool _isFeatured = false; // default
  bool _isVerified = false; // default
  final List<String> _categories = [
    'Footwear',
    'Shirts',
    'Misc',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Form Tambah Product Request')),
      ),
      drawer: LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Title ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Produk",
                    labelText: "Nama Produk",
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Nama produk tidak boleh kosong!";
                    }
                    if (value.length > 255) {
                      return "Nama produk tidak boleh lebih dari 255 huruf";
                    }
                    return null;
                  },
                ),
              ),
              // == Price ==
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
                  decoration: InputDecoration(
                    hintText: "Ex. Ketik 20000 untuk Rp20.000,00",
                    labelText: "Harga Produk",
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Harga produk tidak boleh kosong!";
                    }
                    int? valueInt = int.tryParse(value);
                    if (valueInt == null){
                      return "Harga produk bukan angka";
                    }
                    if (valueInt > 2147483647){
                      return "Harga produk terlalu besar";
                    }
                    return null;
                  },
                ),
              ),
              // === Description ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Deskripsi Produk",
                    labelText: "Deskripsi Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    if (value.length > 1000) {
                      return "Deskripsi produk tidak boleh lebih dari 1000 huruf";
                    }
                    return null;
                  },
                ),
              ),
              // === Category ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Kategori",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  initialValue: _category,
                  items: _categories
                      .map(
                        (cat) => DropdownMenuItem(
                          value: cat,
                          child: Text(cat[0].toUpperCase() + cat.substring(1)),
                        ),
                      )
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _category = newValue!;
                    });
                  },
                ),
              ),
              // === Thumbnail URL ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "URL Thumbnail (opsional)",
                    labelText: "URL Thumbnail",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _thumbnail = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null) {
                      return null;
                    }
                    if (!Uri.parse(value).isAbsolute) {
                      return "Format tautan tidak valid";
                    }
                    return null;
                  },
                ),
              ),
              // === Is Featured ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SwitchListTile(
                  title: const Text("Tandai sebagai Produk Unggulan"),
                  value: _isFeatured,
                  onChanged: (bool value) {
                    setState(() {
                      _isFeatured = value;
                    });
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Produk berhasil disimpan!'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama Produk: $_name'),
                                    Text('Harga: $_price'),
                                    Text('Deskripsi: $_description'),
                                    Text('Kategori: $_category'),
                                    Row(
                                      children: [
                                        Text('Thumbnail: '),
                                        Image.network(_thumbnail, width: 200.0, height: 200.0),
                                      ],
                                    ),
                                    Text(
                                      'Unggulan: ${_isFeatured ? "Ya" : "Tidak"}',
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    _formKey.currentState!.reset();
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

