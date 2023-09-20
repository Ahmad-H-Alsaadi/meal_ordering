import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import '../api/api_service_controll.dart';
import '../../core/widgets/nav_bar.dart';
import '../Category/category_details_view.dart';
import '../cart/cart_controller.dart';

class MealDetails extends StatefulWidget {
  const MealDetails({super.key, required this.id});
  // ignore: prefer_typing_uninitialized_variables
  final id;

  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  Map<String, dynamic>? mealDetail; // Make the map nullable
  Future<void> fetchData() async {
    try {
      final fetchedMealDetail =
          await ApiServiceController.fetchMealDetails(widget.id);
      setState(() {
        mealDetail = fetchedMealDetail;
      });
    } catch (error) {
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
              child: mealDetail != null && mealDetail!['strMealThumb'] != null
                  ? Expanded(
                      child: Image.network(
                        mealDetail!['strMealThumb'],
                        height: size.width,
                        width: size.width,
                        fit: BoxFit.fitWidth,
                      ),
                    )
                  : const SizedBox(), // Handle null value or missing key
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
                  Expanded(
                    child: Text(
                      mealDetail != null && mealDetail!['strMeal'] != null
                          ? mealDetail!['strMeal']
                          : 'Meal Name Missing',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
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
              child: ReadMoreText(
                mealDetail != null && mealDetail!['strInstructions'] != null
                    ? mealDetail!['strInstructions']
                    : 'Instructions Missing',
                style: const TextStyle(color: Colors.white, fontSize: 19.0),
                moreStyle: const TextStyle(color: Colors.blue),
                lessStyle: const TextStyle(color: Colors.blue),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: InkWell(
                onTap: () {
                  final cartProvider =
                      Provider.of<CartProvider>(context, listen: false);
                  cartProvider.addToCart(mealDetail ?? {});
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
                  child: const Text(
                    "Add to Cart",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
