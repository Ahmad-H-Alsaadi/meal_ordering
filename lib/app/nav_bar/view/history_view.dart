import 'package:flutter/material.dart';
import 'package:meal_ordering/app/nav_bar/controller/history_controller.dart';
import 'package:meal_ordering/app/nav_bar/model/history_model.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HistoryViewState createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  final HistoryController historyController = HistoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart History'),
      ),
      body: FutureBuilder<List<HistoryModel>>(
        future: historyController.getCartHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          final cartHistory = snapshot.data ?? [];

          return ListView.builder(
            itemCount: cartHistory.length,
            itemBuilder: (context, index) {
              final cartHistoryItem = cartHistory[index];
              return ListTile(
                title: Text('Order #${cartHistoryItem.orderNumber}'),
                subtitle: Text('Date: ${cartHistoryItem.timestamp.toString()}'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => OrderDetailsView(
                        order: cartHistoryItem,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class OrderDetailsView extends StatelessWidget {
  final HistoryModel order;

  const OrderDetailsView({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order #${order.orderNumber} Details'),
      ),
      body: ListView.builder(
        itemCount: order.items.length,
        itemBuilder: (context, index) {
          const itemImage = 'cartItem.';
          const itemName = 'cartItem.mealDetailsName';

          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  // ignore: unnecessary_null_comparison
                  child: itemImage != null
                      ? Image.network(
                          itemImage,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        )
                      : const SizedBox(width: 80, height: 80),
                ),
                title: const Text(
                  itemName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
