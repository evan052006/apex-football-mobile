import 'package:flutter/material.dart';
import 'package:apex_football/widgets/product_card.dart';
import 'package:apex_football/models/product_model.dart';
import 'package:apex_football/widgets/left_drawer.dart';
import 'package:apex_football/screens/product_detail.dart';
import 'package:apex_football/providers/uid_provider.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _NewsEntryListPageState();
}

class _NewsEntryListPageState extends State<ProductListPage> {
  bool unFiltered = true;
  Future<List<ProductEntry>> fetchNews(CookieRequest request, int id) async {
    if (unFiltered || id == -1) {
      final response = await request.get('https://christopher-evan41-apexfootball.pbp.cs.ui.ac.id/json');
      var data = response;
      // Convert json data to NewsEntry objects
      List<ProductEntry> listObj = [];
      for (var d in data) {
        if (d != null) {
          listObj.add(ProductEntry.fromJson(d));
        }
      }
      return listObj;
    } else {
      final response = await request.get('https://christopher-evan41-apexfootball.pbp.cs.ui.ac.id/json');
      var data = response;
      // Convert json data to NewsEntry objects
      List<ProductEntry> listObj = [];
      for (var d in data) {
        if (d != null) {
          listObj.add(ProductEntry.fromJson(d));
          if (listObj.last.fields.requester != id) {
            listObj.removeLast();
          }
        }
      }
      return listObj;
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>(); 
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchNews(request, userProvider.uid),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Column(children: [
              ElevatedButton(
                onPressed: () {
                    setState(() {
                      unFiltered = true;
                    });
                },
                child: Text("All Products"),
              ),
              ElevatedButton(
                onPressed: () { setState(() {
                      unFiltered = false;
                });
                },
                child: Text("My Products"),
              ),
              Center(child: CircularProgressIndicator())
            ]);
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        unFiltered = true;
                      });
                    },
                    child: Text("All Products"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        unFiltered = false;
                      });
                    },
                    child: Text("My Products"),
                  ),
                  Text(
                    'There are no products in apex football yet.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length + 2,
                itemBuilder: (_, index) {
                  if (index == 0) {
                    return ElevatedButton(
                      onPressed: () {
                        setState(() {
                          unFiltered = true;
                        });
                      },
                      child: Text("All Products", style: TextStyle(color: Colors.white))
                    );
                  } else if (index == 1) {
                    return ElevatedButton(
                      onPressed: () {
                        setState(() {
                          unFiltered = false;
                        });
                      },
                      child: Text("My Products", style: TextStyle(color: Colors.white))
                    );
                  } else {
                    return ProductEntryCard(
                      product: snapshot.data![index - 2],
                      onTap: () {
                        // Navigate to news detail page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage(
                              product: snapshot.data![index - 2],
                            ),
                          ),
                        );
                      },
                    );
                  }
                }
              );
            }
          }
        },
      ),
    );
  }
}
