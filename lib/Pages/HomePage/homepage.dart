import 'package:flutter/material.dart';
import 'package:news_app/Services/Data.dart';
import 'package:news_app/models/Category_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  @override
  void initState() {
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            Text(" On The "),
            Text(
              "Go",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CatergoryTile(
                      image: categories[index].image,
                      categoryName: categories[index].categoryName,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class CatergoryTile extends StatelessWidget {
  final image, categoryName;
  CatergoryTile({this.image, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        Image.asset(
          image,
          width: 120,
          height: 60,
        )
      ]),
    );
  }
}
