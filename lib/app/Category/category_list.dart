import 'package:flutter/material.dart';
import 'package:meal_ordering/app/model/category_model.dart';
import 'category_details_view.dart';
import 'categoty_list_controller.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key}); // Fixed super.key to Key? key

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  late final CategoryListController controller;

  @override
  void initState() {
    controller = CategoryListController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryModel>>(
      future: controller.getCategory(),
      builder: (context, snapshot) {
        // Changed the parameter name to 'snapshot'
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text(
            snapshot.error.toString(),
          );
        } else if (snapshot.hasData) {
          // Added this condition to check if data is available
          List<CategoryModel> categoryData = snapshot.data!; // Extract data
          return ListView(
            shrinkWrap: true,
            children: categoryData.map((categoryData) {
              // Corrected controller to categoryData
              return CategoryCard(
                image: categoryData.categoryImage,
                name: categoryData.categoryName,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryDetails(
                        name: categoryData.categoryName,
                        image: categoryData.categoryImage,
                        description: categoryData.categoryDescription,
                        index: categoryData
                            .categoryId, // Use categoryId instead of listResponse.indexOf(categoryData)
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          );
        } else {
          return const Text(
              "No data available."); // Handle the case when no data is available
        }
      },
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String name, image;
  // ignore: prefer_typing_uninitialized_variables
  final press;

  const CategoryCard({
    super.key,
    required this.press,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      height: 190.0,
      child: InkWell(
        onTap: press,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 166.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 15),
                      blurRadius: 25,
                      color: Colors.black12),
                ],
              ),
            ),
            Positioned(
              top: 0.0,
              left: 0.0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                height: 140.0,
                width: 180.0,
                child: Image.network(
                  image,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(
              bottom: 50.0,
              right: 50.0,
              child: Text(
                name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
