import 'dart:convert';

import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/everything?q=apple&from=2024-06-18&to=2024-06-18&sortBy=popularity&apiKey=c46a66d51f96428996e6d5bb2f92e6fd";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element["title"],
              description: element["description"],
              urlToImage: element["urlToImage"],
              url: element["url"],
              content: element["content"],
              author: element["author"]);
          news.add(articleModel);
        }
      });
    }
  }
}
