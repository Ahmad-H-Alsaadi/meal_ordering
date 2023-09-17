import 'package:meal_ordering/core/controller/api_service_controll.dart';
import 'package:flutter/material.dart';

import '../pruduct/meal_card.dart';

class DetailsListView extends StatefulWidget {
  const DetailsListView({super.key, required this.name});
  final String name;

  @override
  State<DetailsListView> createState() => _DetailsListViewState();
}

class _DetailsListViewState extends State<DetailsListView> {
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
          return MealCard(
            name: listResponse[0]['strMeal'],
            image: listResponse[0]['strMealThumb'],
            mealIndex: listResponse[0]['idMeal'],
          );
        }
      },
    );
  }
}
