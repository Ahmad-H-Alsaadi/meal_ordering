import 'package:flutter/material.dart';
import '../../core/api/api_service_controll.dart';
import 'meal_card.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key, required this.name});
  final String name;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Map<String, dynamic>> listResponse = [];

  Future<void> fetchData() async {
    try {
      final meal =
          await ApiServiceController.fetchProductsInCategory(widget.name);
      setState(() {
        listResponse = meal;
      });
    } catch (error) {
      // Handle the error
      // ignore: avoid_print
      print('Error: $error');
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text(
            snapshot.error.toString(),
          );
        } else {
          final mealCards = listResponse.map((product) {
            return MealCard(
              name: product['strMeal'],
              image: product['strMealThumb'],
              mealIndex: product['idMeal'],
            );
          }).toList();

          return Column(
            children: mealCards,
          );
        }
      },
    );
  }
}
