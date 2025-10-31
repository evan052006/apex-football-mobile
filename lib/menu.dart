import 'package:flutter/material.dart';

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
    ),
    ItemHomepage(
      "My Products",
      Icons.sell,
      SnackBar(
        content: const Text('Kamu telah menekan tombol My Products'),
      ),
      Colors.green,
    ),
    ItemHomepage(
      "Create Product",
      Icons.add,
      SnackBar(
        content: const Text('Kamu telah menekan tombol Create Product'),
      ),
      Colors.red,
    ),
  ];
  MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Football News',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
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
                      'Selamat datang di Football News',
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

class InfoCard extends StatelessWidget {
  final String title;
  final String content;
  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
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
  ItemHomepage(this.name, this.icon, this.snackBar, this.color);
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;
  const ItemCard(this.item, {super.key});

  @override
    Widget build(BuildContext context) {
      return Material(
        color: item.color,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    item.icon,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  const Padding(padding: EdgeInsets.all(3)),
                  Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(item.snackBar);
          },
        )
      );
    }
}
