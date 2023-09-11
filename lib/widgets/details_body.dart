import 'package:flutter/material.dart';
import '../cart/cart_logic.dart';
import '../database/categories.dart';

class DetailsBody extends StatelessWidget {
  final Category category;
  final CartProvider cartProvider;
  const DetailsBody(
      {super.key, required this.category, required this.cartProvider});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.network(
            category.categoryImage,
            height: size.width,
            width: size.width,
            fit: BoxFit.fitWidth,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category.categoryName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              InkWell(
                onTap: () {
                  cartProvider.addToCart(category);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 60, 0),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Text(
                    "Order \$${category.price}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),
          child: Text(
            category.categoryDescription,
            style: const TextStyle(color: Colors.white, fontSize: 19.0),
          ),
        ),
      ],
    );
  }
}
