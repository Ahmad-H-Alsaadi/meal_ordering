import 'package:flutter/material.dart';
import 'package:meal_ordering/app/meal/meals_controller.dart';
import 'package:meal_ordering/app/model/meals_model.dart';

import 'meal_details.dart';

class MealsList extends StatefulWidget {
  const MealsList({super.key, required this.name});
  final String name;

  @override
  State<MealsList> createState() => _MealsListState();
}

class _MealsListState extends State<MealsList> {
  late final MealsListController controller;

  @override
  void initState() {
    controller = MealsListController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MealsModel>>(
      future: controller.getMeals(widget.name),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text(
            snapshot.error.toString(),
          );
        } else if (snapshot.hasData) {
          List<MealsModel> mealsData = snapshot.data!;
          return SizedBox(
            height: 400,
            child: ListView(
              shrinkWrap: false,
              children: mealsData.map(
                (mealsData) {
                  // Corrected controller to categoryData
                  return MealCard(
                      name: mealsData.mealName,
                      image: mealsData.mealImage,
                      mealIndex: mealsData.mealId);
                },
              ).toList(),
            ),
          );
        } else {
          return const Text("No data available.");
        }
      },
    );
  }
}

class MealCard extends StatelessWidget {
  const MealCard(
      {super.key,
      required this.name,
      required this.image,
      required this.mealIndex});
  final String name, image;
  final String mealIndex;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MealDetails(
              id: mealIndex,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.0),
        ),
        elevation: 5.0,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(22.0),
              child: Image.network(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300.0,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(22.0),
                  bottomRight: Radius.circular(22.0),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
              child: Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
