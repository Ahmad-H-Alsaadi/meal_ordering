import 'package:flutter/material.dart';
import 'cart_controller.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});
  final ShoppingCart shoppingCart = ShoppingCart();

  @override
  Widget build(BuildContext context) {
    final cartItems = shoppingCart.items;

    List<Widget> itemTiles = [];

    for (int index = 0; index < cartItems.length; index++) {
      final cartItem = cartItems[index];
      final itemImage = cartItem['strMealThumb'] as String?;
      final itemName = cartItem['strMeal'] as String?;

      itemTiles.add(
        ListTile(
          leading: itemImage != null
              ? Image.network(
                  itemImage,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                )
              : const SizedBox(width: 80, height: 80),
          title: itemName != null ? Text(itemName) : const SizedBox(),
          // You can also display other item details here
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 60, 0),
        title: const Center(child: Text('My Cart')),
      ),
      body: ListView(
        children: itemTiles,
      ),
    );
  }
}
