import 'package:flutter/material.dart';
import '../cart/cart_logic.dart';
import '../widgets/cart_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key, required this.cart});
  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 60, 0),
        title: const Text('resturant Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) => CartCard(
          itemIndex: index,
          items: cart,
          press: () {},
        ),
      ),
    );
  }
}
