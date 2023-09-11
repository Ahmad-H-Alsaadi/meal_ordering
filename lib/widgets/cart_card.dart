import 'package:flutter/material.dart';

import '../cart/cart_logic.dart';

class CartCard extends StatelessWidget {
  final int itemIndex;
  final Cart items;
  const CartCard(
      {super.key,
      required this.itemIndex,
      required this.items,
      required Null Function() press});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned(
          top: 0.0,
          left: 0.0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            height: 140.0,
            width: 180.0,
            child: Image.network(
              items.toString(),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: SizedBox(
            height: 136.0,
            width: size.width - 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        items.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 60, 0),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Text(
                          "price: \$${items.getTotalPrice()}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
