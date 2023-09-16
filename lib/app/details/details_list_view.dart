import 'package:meal_ordering/core/controller/api_service_controll.dart';
import 'package:flutter/material.dart';

class DetailsListView extends StatefulWidget {
  const DetailsListView({super.key, required this.name});
  final String name;

  @override
  State<DetailsListView> createState() => _DetailsListViewState();
}

class _DetailsListViewState extends State<DetailsListView> {
  List<Map<String, dynamic>> listResponse = [];
  List<Map<String, dynamic>> listResponsedetails = [];

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
    return SafeArea(
      child: Column(
        children: [
          ListView.builder(
            itemCount: listResponse.length,
            itemBuilder: (context, index) =>
                Text(listResponse[index]['strMeal']),
          ),
        ],
      ),
    );
  }
}
// ListView.builder(
//       itemCount: listResponse.length,
//       itemBuilder: (context, index) => MealCard(
//         image: listResponse[index]['strMealThumb'],
//         name: listResponse[index]['strMeal'],
//         mealIndex: int.parse(listResponse[index]['idMeal']),
//       ),
//     );