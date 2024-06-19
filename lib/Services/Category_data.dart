import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/SHow_Categories.dart';
import 'package:news_app/models/slider_model.dart';

class ShowCategoryNews {
  List<ShowCategoryModel> Categories = [];

  Future<void> getcategories(String Category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$Category&apiKey=c46a66d51f96428996e6d5bb2f92e6fd";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ShowCategoryModel showCategorymodel = ShowCategoryModel(
              title: element["title"],
              description: element["description"],
              urlToImage: element["urlToImage"],
              url: element["url"],
              content: element["content"],
              author: element["author"]);
          Categories.add(showCategorymodel);
        }
      });
    }
  }
}
