import 'package:flutter/material.dart';
import '../../core/widgets/nav_bar.dart';
import '../details/details_screen.dart';
import 'meal_details_body.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key, required this.id});
  final id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 200, 200),
      drawer: const NavBar(),
      appBar: detailsAppBar(context),
      body: MealDetailsBody(id: id),
    );
  }
}
