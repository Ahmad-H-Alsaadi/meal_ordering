import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiServiceController {
  static Future<List<Map<String, dynamic>>> fetchMealCategories() async {
    final response = await http.get(
        Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php"));

    if (response.statusCode == 200) {
      final stringResponse = response.body;
      final mapResponse = json.decode(stringResponse);
      final listResponse = mapResponse['categories'] as List<dynamic>;

      return listResponse
          .map((category) => category as Map<String, dynamic>)
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<List<Map<String, dynamic>>> fetchProductsInCategory(
      String categoryName) async {
    final response = await http.get(Uri.parse(
        "https://www.themealdb.com/api/json/v1/1/filter.php?c=$categoryName"));

    if (response.statusCode == 200) {
      final stringResponse = response.body;
      final mapResponse = json.decode(stringResponse);
      final listResponse = mapResponse['meals'] as List<dynamic>;

      return listResponse.map((meal) => meal as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<Map<String, dynamic>> fetchProductDetails(String mealId) async {
    final response = await http.get(Uri.parse(
        "https://www.themealdb.com/api/json/v1/1/lookup.php?i=$mealId"));

    if (response.statusCode == 200) {
      final stringResponse = response.body;
      final mapResponse = json.decode(stringResponse);
      final listResponse = mapResponse['meals'] as List<dynamic>;

      if (listResponse.isNotEmpty) {
        return listResponse[0] as Map<String, dynamic>;
      } else {
        throw Exception('Product not found');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}
