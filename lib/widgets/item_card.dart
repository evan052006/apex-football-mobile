import 'package:flutter/material.dart';
import 'package:apex_football/screens/product_creation_form.dart';
import 'package:apex_football/screens/menu.dart';

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
            Navigator.pushReplacement(context, MaterialPageRoute(builder: item.redirectionBuilder));
          },
        )
      );
    }
}

