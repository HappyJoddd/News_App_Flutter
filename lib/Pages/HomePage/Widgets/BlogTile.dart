import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Pages/ArticlePage/ArticlePage.dart';
import 'package:news_app/models/article_model.dart';

// ignore: must_be_immutable
class BlogTile extends StatelessWidget {
  String? imageUrl, title, desc, blogUrl;
  BlogTile(
      {required this.desc,
      required this.imageUrl,
      required this.title,
      required this.blogUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(blogUrl: blogUrl!)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      height: 130,
                      width: 130,
                      fit: BoxFit.cover,
                      imageUrl: imageUrl!,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.7,
                      child: Text(
                        title!,
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.7,
                      child: Text(
                        desc!,
                        maxLines: 4,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
