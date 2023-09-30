import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meal_ordering/app/nav_bar/model/history_model.dart';

class HistoryController {
  final CollectionReference historyCollection =
      FirebaseFirestore.instance.collection('cart_history');

  Future<List<HistoryModel>> getCartHistory() async {
    try {
      final snapshot = await historyCollection.get();
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;

        return HistoryModel(
          id: doc.id,
          orderNumber: data['orderNumber'] as int,
          timestamp: (data['timestamp'] as Timestamp).toDate(),
          items: List<Map<String, dynamic>>.from(data['items'] ?? []),
        );
      }).toList();
    } catch (e) {
      // ignore: avoid_print
      print('Error retrieving cart history: $e');
      return [];
    }
  }
}
