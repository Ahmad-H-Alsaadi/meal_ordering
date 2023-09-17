import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../app/model/category.dart';

class CategoryApi {
  static Future<List<Categoty>> getBooks(String query) async {
    final url =
        Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List categories = json.decode(response.body);

      return categories
          .map((json) => Categoty.fromJson(json))
          .where((category) {
        final titleLower = category.categoryName.toLowerCase();
        final authorLower = category.categoryDescription.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) ||
            authorLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
