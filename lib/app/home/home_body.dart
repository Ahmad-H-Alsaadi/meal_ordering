import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../details/details_screen.dart';
import 'category_card.dart';

String stringResponse = '';
Map mapResponse = {};
Map dataResponse = {};
List listResponse = [];

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
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
      bottom: false,
      child: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 70.0),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 204, 200, 200),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount: listResponse == [] ? 0 : listResponse.length,
                  itemBuilder: (context, index) => CategoryCard(
                    image: listResponse[index]['strCategoryThumb'],
                    name: listResponse[index]['strCategory'],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            name: listResponse[index]['strCategory'],
                            image: listResponse[index]['strCategoryThumb'],
                            description: listResponse[index]
                                ['strCategoryDescription'],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
