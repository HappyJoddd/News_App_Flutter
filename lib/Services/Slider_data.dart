import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/slider_model.dart';

class Sliders {
  List<sliderModel> sliders = [];

  Future<void> getSlider() async {
    String url =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=c46a66d51f96428996e6d5bb2f92e6fd";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          sliderModel slidermodel = sliderModel(
              title: element["title"],
              description: element["description"],
              urlToImage: element["urlToImage"],
              url: element["url"],
              content: element["content"],
              author: element["author"]);
          sliders.add(slidermodel);
        }
      });
    }
  }
}
