class ShoppingCart {
  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  void addToCart(Map<String, dynamic> meal) {
    _items.add(meal);
  }

  void removeFromCart(Map<String, dynamic> meal) {
    _items.remove(meal);
  }

  double getTotalPrice() {
    double totalPrice = 0;
    for (var item in _items) {
      totalPrice += item['price'];
    }
    return totalPrice;
  }
}
