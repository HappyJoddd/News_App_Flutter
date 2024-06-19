import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/Pages/ArticlePage/ArticlePage.dart';
import 'package:news_app/Pages/HomePage/Widgets/BlogTile.dart';
import 'package:news_app/Services/Category_data.dart';
import 'package:news_app/models/SHow_Categories.dart';

class CategoryNews extends StatefulWidget {
  String name;
  CategoryNews({required this.name});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ShowCategoryModel> categories = [];
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    getcategories();
  }

  getcategories() async {
    ShowCategoryNews categoryNews = ShowCategoryNews();
    await categoryNews.getcategories(widget.name.toLowerCase());
    categories = categoryNews.Categories;
    setState(() {
      _loading = false;
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
                widget.name,
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
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return ShowCatergory(
                  Image: categories[index].urlToImage!,
                  desc: categories[index].description!,
                  title: categories[index].title!,
                  url: categories[index].url!,
                );
              }),
        ));
  }
}

class ShowCatergory extends StatelessWidget {
  String Image, desc, title, url;
  ShowCatergory(
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
