import 'package:apex_football/screens/product_creation_form.dart';
import 'package:flutter/material.dart';
import 'package:apex_football/widgets/item_card.dart';
import 'package:apex_football/widgets/info_card.dart';
import 'package:apex_football/screens/product_list.dart';
import 'package:apex_football/widgets/left_drawer.dart';

class MyHomePage extends StatelessWidget {
  final String nama = "Christopher Evan Tanuwidjaja";
  final String npm = "2406358056";
  final String kelas = "A";
  final List<ItemHomepage> items = [
    ItemHomepage(
      "All Products",
      Icons.storefront,
      SnackBar(
        content: const Text('Kamu telah menekan tombol All Products'),
      ),
      Colors.blue,
      (context) => (ProductListPage()),
    ),
    ItemHomepage(
      "My Products",
      Icons.sell,
      SnackBar(
        content: const Text('Kamu telah menekan tombol My Products'),
      ),
      Colors.green,
      (context) => ProductListPage(),
    ),
    ItemHomepage(
      "Create Product",
      Icons.add,
      SnackBar(
        content: const Text('Kamu telah menekan tombol Create Product'),
      ),
      Colors.red,
      (context) => ProductCreationFormPage(),
    ),
  ];
  MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Apex Football',
        ),
      ),
      drawer: LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: nama),
                InfoCard(title: 'Class', content: kelas),
              ],
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Selamat datang di Apex Football',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    )
                  ),
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ItemHomepage {
  final String name;
  final IconData icon;
  final SnackBar snackBar;
  final Color color;
  final WidgetBuilder redirectionBuilder;
  ItemHomepage(this.name, this.icon, this.snackBar, this.color, this.redirectionBuilder);
}

