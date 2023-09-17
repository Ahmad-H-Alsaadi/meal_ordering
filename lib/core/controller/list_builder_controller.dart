import 'package:meal_ordering/core/controller/api_service_controll.dart';
import '../../app/details/details_screen.dart';
import '../../app/home/category_card.dart';
import 'package:flutter/material.dart';

class ListBuilderController extends StatefulWidget {
  const ListBuilderController({super.key});

  @override
  State<ListBuilderController> createState() => _ListBuilderControllerState();
}

class _ListBuilderControllerState extends State<ListBuilderController> {
  List<Map<String, dynamic>> listResponse = [];

  Future<void> fetchData() async {
    try {
      final categories = await ApiServiceController.fetchMealCategories();
      setState(() {
        listResponse = categories;
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
          return ListView.builder(
            itemCount: listResponse.length,
            itemBuilder: (context, index) => CategoryCard(
              image: listResponse[index]['strCategoryThumb'],
              name: listResponse[index]['strCategory'],
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      name: listResponse[index]['strCategory'],
                      image: listResponse[index]['strCategoryThumb'],
                      description: listResponse[index]
                          ['strCategoryDescription'],
                      index: index,
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
