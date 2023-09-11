import 'package:flutter/material.dart';
import 'package:meal_ordering/database/categories.dart';

class Cart {
  List<Category> items = [];

  void addToCart(Category category) {
    items.add(category);
  }

  void removeFromCart(Category category) {
    items.remove(category);
  }

  double getTotalPrice() {
    return items.fold(0, (total, category) => total + category.price);
  }
}

class CartProvider with ChangeNotifier {
  final Cart cart = Cart();

  void addToCart(Category category) {
    cart.addToCart(category);
    notifyListeners();
  }

  void removeFromCart(Category category) {
    cart.removeFromCart(category);
    notifyListeners();
  }
}
