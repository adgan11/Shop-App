import 'package:flutter/material.dart';

import 'items.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: 130,
        color: Colors.green,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(35.0),
              child: Text(
                "Check Out",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 42,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text("PAY NOW"),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Cart"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListTile(
              tileColor: cart[index][0],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              leading: Image.asset(cart[index][2]),
              trailing: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    cart.removeAt(index);
                  });
                },
              ),
              title: Row(
                children: [
                  Text(
                    "${cart[index][4]}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "size: ${cart[index][1]}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "${cart[index][3]}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              contentPadding: const EdgeInsets.all(15),
            ),
          );
        },
      ),
    );
  }
}
