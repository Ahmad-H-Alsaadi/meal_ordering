import 'dart:convert';
import 'package:http/http.dart' as http;

class Server {
  Future<List<Map<String, dynamic>>> getUsers() async {
    final response = await http.get(
        Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as Map<String, dynamic>;
      final users = jsonData['data'] as List<dynamic>;
      final userList =
          users.map((user) => user as Map<String, dynamic>).toList();
      return userList;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
