import 'package:flutter/material.dart';
import 'package:meal_ordering/app/nav_bar/view/nav_bar.dart';
import 'package:readmore/readmore.dart';

import '../cart/cart_view.dart';
import '../meal/meals_list.dart';

class CategoryDetails extends StatelessWidget {
  final String name, image, description;
  final int index;

  const CategoryDetails({
    super.key,
    required this.name,
    required this.image,
    required this.description,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 204, 200, 200),
        drawer: const NavBar(),
        appBar: detailsAppBar(context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  image,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30),
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
                child: ReadMoreText(
                  description,
                  style: const TextStyle(color: Colors.white, fontSize: 19.0),
                  moreStyle: const TextStyle(color: Colors.blue),
                  lessStyle: const TextStyle(color: Colors.blue),
                ),
              ),
              MealsList(
                name: name,
              ),
            ],
          ),
        ));
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
          Icons.arrow_back_ios,
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
              builder: (context) => const CartView(),
            ),
          );
        },
      ),
    ],
    title: const Text(
      'Meal Oredering',
    ),
    centerTitle: false,
  );
}
