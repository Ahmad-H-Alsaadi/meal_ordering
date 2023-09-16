import 'package:flutter/material.dart';
import 'package:meal_ordering/app/pruduct/meal_body.dart';
import '../../core/widgets/nav_bar.dart';
import '../details/details_screen.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 200, 200),
      drawer: const NavBar(),
      appBar: detailsAppBar(context),
      body: const MealBody(),
    );
  }
}
