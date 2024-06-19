import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Pages/HomePage/Widgets/BlogTile.dart';
import 'package:news_app/Pages/HomePage/Widgets/CategoryTile.dart';
import 'package:news_app/Services/Data.dart';
import 'package:news_app/Services/News.dart';
import 'package:news_app/Services/Slider_data.dart';
import 'package:news_app/models/Category_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/slider_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<sliderModel> sliders = [];
  List<ArticleModel> articles = [];
  bool _loading = true;

  int activeIndex = 0;
  @override
  void initState() {
    categories = getCategories();
    getSlider();
    getNews();
    super.initState();
  }

  getNews() async {
    News newsclass = News();
    await newsclass.getNews();
    articles = newsclass.news;
    setState(() {
      _loading = false;
    });
  }

  getSlider() async {
    Sliders slider = Sliders();
    await slider.getSlider();
    sliders = slider.sliders;
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pocket",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              "News",
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
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      height: 70,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return CatergoryTile(
                              image: categories[index].image,
                              categoryName: categories[index].categoryName,
                            );
                          }),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Breaking News!",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Poppins'),
                          ),
                          Text(
                            "View All",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    CarouselSlider.builder(
                        itemCount: 5,
                        itemBuilder: (context, index, realIndex) {
                          String? res = sliders[index].urlToImage;
                          String? res1 = sliders[index].title;
                          return buildImage(res!, index, res1!);
                        },
                        options: CarouselOptions(
                            height: 250,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                            onPageChanged: (index, reason) {
                              setState(() {
                                activeIndex = index;
                              });
                            })),
                    SizedBox(height: 20),
                    Center(child: buildIndicator()),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Trending News",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Poppins'),
                          ),
                          Text(
                            "View All",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            return BlogTile(
                                blogUrl: articles[index].url!,
                                desc: articles[index].description!,
                                imageUrl: articles[index].urlToImage!,
                                title: articles[index].title!);
                          }),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  Widget buildImage(String image, int index, String name) => Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
              imageUrl: image,
              height: 250,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width),
        ),
        Container(
          padding: EdgeInsets.only(left: 10),
          margin: EdgeInsets.only(top: 170),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: Center(
            child: Text(name,
                maxLines: 3,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
          ),
        ),
      ]));
  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: 5,
        effect: WormEffect(
            activeDotColor: Colors.blue, dotHeight: 20, dotWidth: 20),
      );
}
