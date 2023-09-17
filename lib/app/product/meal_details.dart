import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../../core/api/api_service_controll.dart';
import '../../core/widgets/nav_bar.dart';
import '../Category/category_details_view.dart';

class MealDetails extends StatefulWidget {
  const MealDetails({super.key, required this.id});
  // ignore: prefer_typing_uninitialized_variables
  final id;

  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  Map<String, dynamic> mealDetail = {};

  Future<void> fetchData() async {
    try {
      mealDetail = await ApiServiceController.fetchProductDetails(widget.id);
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
                mealDetail['strMealThumb'],
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
                    mealDetail['strMeal'],
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
                mealDetail['strInstructions'],
                style: const TextStyle(color: Colors.white, fontSize: 19.0),
                moreStyle: const TextStyle(color: Colors.blue),
                lessStyle: const TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
