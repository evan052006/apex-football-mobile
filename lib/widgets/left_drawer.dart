import 'package:apex_football/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:apex_football/screens/menu.dart';
import 'package:apex_football/screens/product_list.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:apex_football/screens/product_creation_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
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
                MaterialPageRoute(builder: (context) => ProductListPage()),
              );
            },
          ),
           ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            // ListTile yang halaman view newsnya belum diimplementasikan
            // Hanya akan redirect ke home
            onTap: () async {
              final response = await request.logout(
              "https://christopher-evan41-apexfootball.pbp.cs.ui.ac.id/logout_api/");
              String message = response["message"];
              if (context.mounted) {
                  if (response['status']) {
                      String uname = response["username"];
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("$message See you again, $uname."),
                      ));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                  } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(message),
                          ),
                      );
                  }
              }
            },
          ),
        ],
      ),
    );
  }
}

