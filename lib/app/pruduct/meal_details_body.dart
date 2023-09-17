import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../../core/controller/api_service_controll.dart';

class MealDetailsBody extends StatefulWidget {
  const MealDetailsBody({super.key, required this.id});
  final String id;

  @override
  State<MealDetailsBody> createState() => _MealDetailsBodyState();
}

class _MealDetailsBodyState extends State<MealDetailsBody> {
  Map<String, dynamic> mealDetails = {};

  Future<void> fetchData() async {
    try {
      final mealDetail =
          await ApiServiceController.fetchProductDetails(widget.id);
      setState(() {
        mealDetails = mealDetail;
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
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(
              mealDetails['strMealThumb'],
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
                  mealDetails['strMeal'],
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
              mealDetails['strInstructions'],
              style: const TextStyle(color: Colors.white, fontSize: 19.0),
              moreStyle: const TextStyle(color: Colors.blue),
              lessStyle: const TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
