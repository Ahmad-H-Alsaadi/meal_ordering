import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.items;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 60, 0),
        title: const Center(child: Text('My Cart')),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];
          final itemImage = cartItem['strMealThumb'] as String?;
          final itemName = cartItem['strMeal'] as String?;

          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  cartProvider.removeFromCart(cartItem);
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: itemImage != null
                        ? Image.network(
                            itemImage,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          )
                        : const SizedBox(width: 80, height: 80),
                  ),
                  title: Text(
                    itemName ?? 'Item Name Missing',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  // You can also display other item details here
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
