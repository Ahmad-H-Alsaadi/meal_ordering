import 'package:flutter/foundation.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  void addToCart(Map<String, dynamic> meal) {
    _items.add(meal);
    notifyListeners(); // Notify listeners to update the UI
  }

  void removeFromCart(Map<String, dynamic> meal) {
    _items.remove(meal);
    notifyListeners(); // Notify listeners to update the UI
  }

  double getTotalPrice() {
    double totalPrice = 0;
    for (var item in _items) {
      totalPrice += item[
          'price']; // Make sure to update this based on your data structure
    }
    return totalPrice;
  }
}
