import 'package:flutter/material.dart';
import 'package:meal_ordering/app/nav_bar/view/history_view.dart';
import 'package:provider/provider.dart';

import '../cart/cart_controller.dart';
// import '../nav_bar/history_view.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartController>(context);
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
          final itemImage = cartItem['mealDetailsImage'] as String?;
          final itemName = cartItem['mealDetailsName'] as String?;

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
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () async {
            final cartProvider =
                Provider.of<CartController>(context, listen: false);

            await cartProvider.saveCartHistory();

            cartProvider.clearCart();

            // ignore: use_build_context_synchronously
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const HistoryView(),
            ));
          },
          child: const Text('Complete Order'),
        ),
      ),
    );
  }
}
