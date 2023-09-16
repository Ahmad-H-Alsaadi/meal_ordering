import 'package:flutter/material.dart';
import '../../core/widgets/nav_bar.dart';
import '../cart/cart_page.dart';
import 'details_body.dart';

class DetailsScreen extends StatelessWidget {
  final String name, image, description;
  final int index;

  const DetailsScreen({
    super.key,
    required this.name,
    required this.image,
    required this.description,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 200, 200),
      drawer: const NavBar(),
      appBar: detailsAppBar(context),
      body: DetailsBody(
        description: description,
        image: image,
        name: name,
        index: index,
      ),
    );
  }
}

AppBar detailsAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: const Color.fromARGB(255, 255, 71, 15),
    elevation: 0,
    actions: [
      IconButton(
        padding: const EdgeInsets.only(right: 20),
        icon: const Icon(
          Icons.home,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
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
  );
}
