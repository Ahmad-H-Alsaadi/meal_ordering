import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 60, 0),
        title: const Text('resturant Cart'),
      ),
      body: const Text("cart body"),
    );
  }
}
