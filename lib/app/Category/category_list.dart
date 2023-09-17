import 'package:meal_ordering/core/api/api_service_controll.dart';
import 'category_card.dart';
import 'package:flutter/material.dart';

import 'category_details_view.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key, required String name});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
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
            shrinkWrap: true,
            itemCount: listResponse.length,
            itemBuilder: (context, index) => CategoryCard(
              image: listResponse[index]['strCategoryThumb'],
              name: listResponse[index]['strCategory'],
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryDetails(
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