import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<dynamic> cartItems = [].obs;

  void addToCart(String item) {
    cartItems.add(item);
  }

  void removeFromCart(String item) {
    cartItems.remove(item);
  }

  int get itemCount => cartItems.length;
}
