import 'package:flutter/material.dart';
import 'package:meal_ordering/home/category_card.dart';
import '../database/categories.dart';
import '../pages/details_screen.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) => CategoryCard(
                    itemIndex: index,
                    category: categories[index],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            category: categories[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
