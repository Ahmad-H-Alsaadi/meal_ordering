import 'package:flutter/material.dart';
import 'package:meal_ordering/cart/cart_logic.dart';
import '../database/categories.dart';
import '../widgets/details_body.dart';

class DetailsScreen extends StatelessWidget {
  final Category category;
  const DetailsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 200, 200),
      appBar: detailsAppBar(context),
      body: DetailsBody(
        category: category,
        cartProvider: CartProvider(),
      ),
    );
  }
}

AppBar detailsAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: const Color.fromARGB(255, 255, 60, 0),
    elevation: 0,
    leading: IconButton(
      padding: const EdgeInsets.only(right: 20),
      icon: const Icon(
        Icons.arrow_back,
        color: Color.fromARGB(255, 204, 200, 200),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    centerTitle: false,
    title: const Text(
      'Back',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
