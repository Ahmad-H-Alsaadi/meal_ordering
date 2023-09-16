import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import '../../core/controller/cart_controller.dart';
import 'details_list_view.dart';

class DetailsBody extends StatelessWidget {
  final String name, image, description;
  final int index;
  final cartController = Get.put(CartController());

  DetailsBody({
    super.key,
    required this.name,
    required this.image,
    required this.description,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(
              image,
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
                  name,
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
              description,
              style: const TextStyle(color: Colors.white, fontSize: 19.0),
              moreStyle: const TextStyle(color: Colors.blue),
              lessStyle: const TextStyle(color: Colors.blue),
            ),
          ),
          DetailsListView(
            name: name,
          ),
        ],
      ),
    );
  }
}
