import 'package:get/get.dart';
import 'package:news_app/Pages/Controller/LandingController.dart';
import 'package:news_app/Pages/Landing%20Page/LandingPage.dart';
import 'package:news_app/Pages/SplashScreen/SplashScreen.dart';
import 'package:news_app/Routes/routes_name.dart';
import 'package:news_app/Pages/Controller/splashcontroller.dart';

class AppRoutes {
  static  getRoutes() => [
    GetPage(
        name: RouteName.splash,
        page: () => SplashPage(),
        binding: BindingsBuilder.put(() => SplashController()),
        ),
        GetPage(
        name: RouteName.landing,
        page: () => LandingPage(),
        binding: BindingsBuilder.put(() => LandingController()),
        ),
  ];
}
