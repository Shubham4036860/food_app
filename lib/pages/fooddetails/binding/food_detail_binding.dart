import 'package:eatery/pages/fooddetails/controller/food_detail_controller.dart';
import 'package:get/get.dart';

class FoodDetailBinding extends Bindings{

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => FoodDetailController());
  }

}