import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import '../../core/widgets/nav_bar.dart';
import '../Category/category_details_view.dart';
import '../cart/cart_controller.dart';
import '../model/meal_details_model.dart';
import 'meal_details_controller.dart';

class MealDetails extends StatefulWidget {
  const MealDetails({super.key, required this.id});
  // ignore: prefer_typing_uninitialized_variables
  final id;

  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  late final MealDetailsController controller;

  @override
  void initState() {
    controller = MealDetailsController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<List<MealDetailsModel>>(
      future: controller.getMealDetails(widget.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text(
            snapshot.error.toString(),
          );
        } else if (snapshot.hasData) {
          List<MealDetailsModel> mealDetailsData = snapshot.data!;
          return MealDetailsView(
            size: size,
            categoryName: mealDetailsData.elementAt(0).categoryName,
            mealDetailsName: mealDetailsData.elementAt(0).mealDetailsName,
            mealDetailsImage: mealDetailsData.elementAt(0).mealDetailsImage,
            mealDetailsId:
                mealDetailsData.elementAt(0).mealDetailsId.toString(),
            mealDetailsDescription:
                mealDetailsData.elementAt(0).mealDetailsDescription,
          );
        } else {
          return const Text("No data available.");
        }
      },
    );
  }
}

class MealDetailsView extends StatelessWidget {
  const MealDetailsView({
    Key? key,
    required this.size,
    required this.mealDetailsId,
    required this.mealDetailsName,
    required this.categoryName,
    required this.mealDetailsImage,
    required this.mealDetailsDescription,
  }) : super(key: key);

  final Size size;
  final String mealDetailsId,
      mealDetailsName,
      categoryName,
      mealDetailsImage,
      mealDetailsDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 200, 200),
      drawer: const NavBar(),
      appBar: detailsAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              // ignore: unnecessary_null_comparison
              child: mealDetailsImage != null
                  ? Image.network(
                      mealDetailsImage,
                      height: size.width,
                      width: size.width,
                      fit: BoxFit.fitWidth,
                    )
                  : const SizedBox(),
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
                      mealDetailsName,
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
                mealDetailsDescription,
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
                      Provider.of<CartController>(context, listen: false);
                  cartProvider.addToCart({
                    'mealDetailsId': mealDetailsId,
                    'mealDetailsName': mealDetailsName,
                    'categoryName': categoryName,
                    'mealDetailsImage': mealDetailsImage,
                    'mealDetailsDescription': mealDetailsDescription,
                  });
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
