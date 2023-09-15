import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String stringResponse = '';
Map mapResponse = {};
Map dataResponse = {};
List listResponse = [];

class BodyTest extends StatefulWidget {
  const BodyTest({super.key});

  @override
  State<BodyTest> createState() => _BodyTestState();
}

class _BodyTestState extends State<BodyTest> {
  Future apicall() async {
    http.Response response;
    response = await http.get(
        Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php"));
    if (response.statusCode == 200) {
      setState(() {
        stringResponse = response.body;
        mapResponse = json.decode(stringResponse);
        listResponse = mapResponse['categories'];
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                Image.network(listResponse[index]['strCategoryThumb']),
              ],
            ),
          );
        },
        itemCount: listResponse == [] ? 0 : listResponse.length,
      ),
    );
  }
}
