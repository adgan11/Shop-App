import 'package:flutter/material.dart';

import 'items.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shop App",
      debugShowCheckedModeBanner: false,
      home: ShopPage(),
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
    );
  }
}

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
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: Colors.black,
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
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu_rounded,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 190.0),
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
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ItemPage(selfIndex: index),
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
                          padding: const EdgeInsets.only(bottom: 50.0),
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
              },
            ),
          )
        ],
      ),
    );
  }
}

class ItemPage extends StatefulWidget {
  const ItemPage({super.key, @required this.selfIndex});

  final selfIndex;

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  Color buyColor = Colors.yellow.shade700;

  int buySize = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: Colors.black,
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
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu_rounded,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 250),
            child: Text(
              items[widget.selfIndex][0],
              style: const TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Stack(
              children: [
                Container(
                  width: 250,
                  height: 200,
                  decoration: BoxDecoration(
                    color: buyColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    items[widget.selfIndex][1],
                    scale: 0.6,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            items[widget.selfIndex][2],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 42),
          ),
          const SizedBox(
            height: 70,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Other models",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          buyColor = Colors.yellow.shade700;
                        });
                      },
                      child: CircleAvatar(
                        radius: 17.5,
                        backgroundColor: Colors.yellow.shade700,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          buyColor = Colors.green.shade700;
                        });
                      },
                      child: CircleAvatar(
                        radius: 17.5,
                        backgroundColor: Colors.green.shade700,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          buyColor = Colors.red.shade700;
                        });
                      },
                      child: CircleAvatar(
                        radius: 17.5,
                        backgroundColor: Colors.red.shade700,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          buyColor = Colors.purple.shade700;
                        });
                      },
                      child: CircleAvatar(
                        radius: 17.5,
                        backgroundColor: Colors.purple.shade700,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          buyColor = Colors.pink.shade700;
                        });
                      },
                      child: CircleAvatar(
                        radius: 17.5,
                        backgroundColor: Colors.pink.shade700,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Size Options",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: DropdownButton(
                  value: buySize,
                  items: const [
                    DropdownMenuItem(
                      child: Text("5"),
                      value: 5,
                    ),
                    DropdownMenuItem(
                      child: Text("10"),
                      value: 10,
                    ),
                    DropdownMenuItem(
                      child: Text("15"),
                      value: 15,
                    ),
                    DropdownMenuItem(
                      child: Text("20"),
                      value: 20,
                    ),
                    DropdownMenuItem(
                      child: Text("25"),
                      value: 25,
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      buySize = value!;
                    });
                  },
                ),
              )
            ],
          ),
          const SizedBox(
            height: 70,
          ),
          SizedBox(
            width: 300,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                cart.add(
                  [
                    buyColor,
                    buySize,
                    items[widget.selfIndex][1],
                    items[widget.selfIndex][2],
                    items[widget.selfIndex][0],
                  ],
                );
                print(cart);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                "ADD TO CART",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

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
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: Text("PAY NOW"),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Cart"),
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.white,
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
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Size: ${cart[index][1]}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "${cart[index][3]}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
