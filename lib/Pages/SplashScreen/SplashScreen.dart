import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Pages/Controller/splashcontroller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Spacer(),
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset("images/Logo.png", width: 140)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Pocket",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center),
              Text("News",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center),
            ],
          ),
          Spacer(),
          Text(
            "poweredBy Hitarth Bhatt",
            style: TextStyle(
                fontSize: 10,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 20)
        ],
      ),
    ));
  }
}
