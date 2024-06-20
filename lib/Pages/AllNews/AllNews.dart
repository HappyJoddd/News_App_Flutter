import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Pages/ArticlePage/ArticlePage.dart';
import 'package:news_app/Services/News.dart';
import 'package:news_app/Services/Slider_data.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/slider_model.dart';

class Allnews extends StatefulWidget {
  String news;
  Allnews({required this.news});

  @override
  State<Allnews> createState() => _AllnewsState();
}

class _AllnewsState extends State<Allnews> {
  List<sliderModel> sliders = [];
  List<ArticleModel> articles = [];
  bool _loading = true;

  void initState() {
    getSlider();
    getNews();
    super.initState();
  }

  getNews() async {
    News newsclass = News();
    await newsclass.getNews();
    articles = newsclass.news;
    setState(() {
    });
  }

  getSlider() async {
    Sliders slider = Sliders();
    await slider.getSlider();
    sliders = slider.sliders;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.news+ " News",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: widget.news== "Breaking"? sliders.length : articles.length,
              itemBuilder: (context, index) {
                return AllNewsSection(
                  Image: widget.news== "Breaking"? sliders[index].urlToImage! : articles[index].urlToImage!,
                  desc: widget.news== "Breaking"? sliders[index].description! : articles[index].description!,
                  title: widget.news== "Breaking"? sliders[index].title! : articles[index].title!,
                  url: widget.news== "Breaking"? sliders[index].url! : articles[index].url!,
                );
              }),
        ),
    );
  }
}
class AllNewsSection extends StatelessWidget {
  String Image, desc, title, url;
  AllNewsSection(
      {required this.Image,
      required this.desc,
      required this.title,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url)));
      },
      child: Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: Image,
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              desc,
              maxLines: 3,
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
