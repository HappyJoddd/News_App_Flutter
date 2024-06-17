import 'package:get/get.dart';
import 'package:news_app/Pages/ArticlePage/ArticlePage.dart';
import 'package:news_app/Pages/HomePage/homepage.dart';
import 'package:news_app/Pages/ProfilePage/ProfilePage.dart';

class BottomNavController extends GetxController {
  RxInt index = 0.obs;

  var pages = [
    Homepage(),
    ArticlePage(),
    Profilepage(),
  ];
}
