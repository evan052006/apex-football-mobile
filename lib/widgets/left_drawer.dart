import 'package:flutter/material.dart';
import 'package:apex_football/screens/menu.dart';
import 'package:apex_football/screens/product_creation_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Column(
              children: [
                Text(
                  'Apex Football',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "\"Play for the badge on the front of the shirt and they'll remember the name on the back.\" – Tony Adams",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.playlist_add),
            title: const Text('Add Product Request'),
            // Bagian redirection ke NewsFormPage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProductCreationFormPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('See Product Requests'),
            // ListTile yang halaman view newsnya belum diimplementasikan
            // Hanya akan redirect ke home
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

