import 'package:get/get.dart';

class LandingController extends GetxController {
  LandingController();

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}
