import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class CartController with ChangeNotifier {
  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addToCart(Map<String, dynamic> meal) async {
    _items.add(meal);
    notifyListeners();
  }

  Future<void> removeFromCart(Map<String, dynamic> meal) async {
    _items.remove(meal);
    notifyListeners();
  }

  double getTotalPrice() {
    double totalPrice = 0;
    for (var item in _items) {
      totalPrice += item['price'];
    }
    return totalPrice;
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  Future<void> saveCartHistory() async {
    final cartHistoryItem = CartHistoryItem(
      items: _items,
      timestamp: DateTime.now(),
    );

    try {
      final CollectionReference historyCollection =
          firestore.collection('cart_history');

      await historyCollection.add(cartHistoryItem.toMap());
    } catch (e) {
      // ignore: avoid_print
      print('Error saving cart history: $e');
    }
  }
}

class CartHistoryItem {
  final List<Map<String, dynamic>> items;
  final DateTime timestamp;

  CartHistoryItem({required this.items, required this.timestamp});

  // Convert cart history item to a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'items': items,
      'timestamp': timestamp,
    };
  }

  // Add a constructor to create a CartHistoryItem from a map
  factory CartHistoryItem.fromMap(Map<String, dynamic> map) {
    return CartHistoryItem(
      items: List<Map<String, dynamic>>.from(map['items'] ?? []),
      timestamp: (map['timestamp'] as Timestamp).toDate(),
    );
  }
}
