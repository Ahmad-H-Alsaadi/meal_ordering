import 'package:flutter/material.dart';

import 'package:meal_ordering/app/cart/cart_page.dart';
import 'package:meal_ordering/app/home/home_body.dart';
import 'package:meal_ordering/core/widgets/nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 60, 0),
      drawer: const NavBar(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 71, 15),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ),
              );
            },
          ),
        ],
        title: const Text(
          'Welcome to our restaurant',
        ),
        centerTitle: false,
      ),
      body: const HomeBody(),
    );
  }
}
