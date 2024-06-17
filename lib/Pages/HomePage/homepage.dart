import 'package:flutter/material.dart';
import 'package:news_app/Pages/HomePage/Widgets/NewsTile.dart';
import 'package:news_app/Pages/HomePage/Widgets/TrendingCard.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News On The Go',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hottest News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text("See All", style: Theme.of(context).textTheme.labelSmall)
                ],
              ),
              const SizedBox(height: 20),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  Trendingcard(
                    imageUrl:
                        "https://images.indianexpress.com/2024/06/All-you-need-to-know-about-Fathers-Day-2024.-Source_-freepik.jpg?w=640",
                    title:
                        "Father’s Day 2024: Know the History, Significance, celebration and more",
                    author: "Hitarth Bhatt",
                    tag: "Trending No. 1",
                    time: "2 days ago",
                  ),
                  Trendingcard(
                      imageUrl:
                          "https://static.toiimg.com/thumb/msid-111043485,imgsize-601949,width-400,resizemode-4/111043485.jpg",
                      tag: "Trending No.2",
                      time: "1 day ago",
                      title:
                          "Russia kept out of Ukraine meet, India doesn’t sign communique",
                      author: "Sachin Parachar")
                ]),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "News For You",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text("See All", style: Theme.of(context).textTheme.labelSmall)
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: [
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
