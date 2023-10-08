import 'package:eatery/pages/purchase/controller/purchase_controller.dart';
import 'package:get/get.dart';

class PurchaseBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(PurchaseController());
  }

}