import 'package:flutter/material.dart';

import 'items.dart';
import 'shop_item.dart';
import 'cart.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Cart(),
                ),
              );
            },
            icon: const Icon(
              Icons.shopping_bag_outlined,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu_rounded,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 190),
            child: Text(
              "Top 10",
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: (1 / 1.2),
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ShopItem(
                  items: items,
                  index: index,
                  cart: cart,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
