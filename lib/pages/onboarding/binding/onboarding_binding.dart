import 'package:eatery/pages/onboarding/controller/onboarding_conroller.dart';
import 'package:get/get.dart';

class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut(() => OnBoardingController());
  }
}
