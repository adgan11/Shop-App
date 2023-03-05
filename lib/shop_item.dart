import 'package:flutter/material.dart';
import 'package:shop_app_tut/item_page.dart';

class ShopItem extends StatelessWidget {
  const ShopItem({
    super.key,
    @required this.items,
    @required this.index,
    @required this.cart,
  });

  final items;
  final index;
  final cart;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ItemPage(
              items: items,
              selfIndex: index,
              cart: cart,
            ),
          ),
        );
      },
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              items[index][1],
              scale: 0.8,
            ),
            Text(
              items[index][0],
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 50,
              ),
              child: Text(
                items[index][2],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
