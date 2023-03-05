import 'package:flutter/material.dart';

import 'cart.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({
    super.key,
    @required this.items,
    @required this.selfIndex,
    @required this.cart,
  });

  final items;
  final selfIndex;
  final cart;

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
          Padding(
            padding: EdgeInsets.only(right: 250),
            child: Text(
              widget.items[widget.selfIndex][0],
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
            child: Container(
              width: 250,
              height: 200,
              decoration: BoxDecoration(
                color: buyColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                widget.items[widget.selfIndex][1],
                scale: 0.6,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            widget.items[widget.selfIndex][2],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 42,
            ),
          ),
          const SizedBox(height: 70),
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
                    )
                  ],
                ),
              ),
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
                widget.cart.add(
                  [
                    buyColor,
                    buySize,
                    widget.items[widget.selfIndex][1],
                    widget.items[widget.selfIndex][2],
                    widget.items[widget.selfIndex][0],
                  ],
                );
                print(widget.cart);
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
