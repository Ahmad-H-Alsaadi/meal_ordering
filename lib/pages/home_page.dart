import 'package:flutter/material.dart';
import 'package:meal_ordering/cart/cart_logic.dart';
import 'package:meal_ordering/home/home_body.dart';
import 'package:meal_ordering/pages/cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 60, 0),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 71, 15),
        elevation: 0,
        title: const Text(
          'Welcome to our restaurant',
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CartPage(
                          cart: Cart(),
                        )),
              );
            },
          ),
        ],
      ),
      body: const HomeBody(),
    );
  }
}
