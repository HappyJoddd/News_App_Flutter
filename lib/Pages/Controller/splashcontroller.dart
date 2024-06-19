import 'package:get/get.dart';
import 'package:news_app/Routes/routes_name.dart';

class SplashController extends GetxController {
  SplashController();

  @override
  void onInit() {
    navigateScreen();
    super.onInit();
  }

  navigateScreen() {
    Future.delayed(Duration(seconds: 3), () {
      Get.toNamed(RouteName.landing);
    });
  }
}
