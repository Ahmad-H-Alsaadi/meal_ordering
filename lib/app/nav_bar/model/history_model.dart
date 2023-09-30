class HistoryModel {
  final String id;
  final int orderNumber;
  final DateTime timestamp;
  final List<Map<String, dynamic>> items;

  HistoryModel({
    required this.id,
    required this.orderNumber,
    required this.timestamp,
    required this.items,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      id: json['id'] as String,
      orderNumber: json['orderNumber'] as int,
      timestamp: DateTime.parse(json['timestamp'] as String),
      items: List<Map<String, dynamic>>.from(json['items'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'orderNumber': orderNumber,
      'timestamp': timestamp.toIso8601String(),
      'items': items,
    };
  }
}
