import 'package:flutter/material.dart';
import 'package:meal_ordering/app/cart/cart_page.dart';
import 'package:meal_ordering/core/widgets/nav_bar.dart';
import '../Category/category_list.dart';

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
                  builder: (context) => CartPage(),
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
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 70.0),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 204, 200, 200),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  ),
                  const CategoryList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
