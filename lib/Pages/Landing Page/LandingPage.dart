import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Pages/Controller/LandingController.dart';
import 'package:news_app/Pages/HomePage/homepage.dart';

class LandingPage extends GetView<LandingController> {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(children: [
          Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "images/loadingscreen.jpg",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.8,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: Text("News from around the \nworld for you",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center),
          ),
          SizedBox(height: 30),
          Center(
            child: Text(
              "Best News for you to read\n Take your time to read to connect to the world",
              style: TextStyle(
                color: Colors.black45,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 30),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.4,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HomePage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
              ),
              child: Text(
                "Get Started",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
