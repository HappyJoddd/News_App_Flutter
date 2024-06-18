import 'package:flutter/material.dart';
import 'package:news_app/Pages/ArticlePage/Widgets/SearchWidget.dart';
import 'package:news_app/Pages/HomePage/Widgets/NewsTile.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: const [
              SearchWidget(),
              SizedBox(height: 20),
              Newstile(
                imageUrl:
                    "https://images.indianexpress.com/2024/06/All-you-need-to-know-about-Fathers-Day-2024.-Source_-freepik.jpg?w=640",
                title:
                    "Father’s Day 2024: Know the History, Significance, celebration and more",
                author: "Hitarth Bhatt",
                time: "2 days ago",
              ),
              Newstile(
                  imageUrl:
                      "https://static.toiimg.com/thumb/msid-111043485,imgsize-601949,width-400,resizemode-4/111043485.jpg",
                  time: "1 day ago",
                  title:
                      "Russia kept out of Ukraine meet, India doesn’t sign communique",
                  author: "Sachin Parachar"),
              Newstile(
                  imageUrl:
                      "https://static.toiimg.com/thumb/msid-111036755,imgsize-464991,width-400,resizemode-4/111036755.jpg",
                  time: "16 June",
                  title:
                      "Despite Nike's exit, Russian retailers continue to sell Western Brands via backdoor channels",
                  author: "TOI World Desk"),
              Newstile(
                imageUrl:
                    "https://images.indianexpress.com/2024/06/All-you-need-to-know-about-Fathers-Day-2024.-Source_-freepik.jpg?w=640",
                title:
                    "Father’s Day 2024: Know the History, Significance, celebration and more",
                author: "Hitarth Bhatt",
                time: "2 days ago",
              ),
              Newstile(
                  imageUrl:
                      "https://static.toiimg.com/thumb/msid-111043485,imgsize-601949,width-400,resizemode-4/111043485.jpg",
                  time: "1 day ago",
                  title:
                      "Russia kept out of Ukraine meet, India doesn’t sign communique",
                  author: "Sachin Parachar"),
              Newstile(
                  imageUrl:
                      "https://static.toiimg.com/thumb/msid-111036755,imgsize-464991,width-400,resizemode-4/111036755.jpg",
                  time: "16 June",
                  title:
                      "Despite Nike's exit, Russian retailers continue to sell Western Brands via backdoor channels",
                  author: "TOI World Desk"),
            ],
          ),
        ),
      ),
    );
  }
}
