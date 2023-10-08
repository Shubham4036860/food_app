import 'package:eatery/pages/favorite/controller/favorite_controller.dart';
import 'package:get/get.dart';

class FavoriteBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => FavoriteController());
  }
}