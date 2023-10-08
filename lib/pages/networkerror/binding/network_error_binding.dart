import 'package:eatery/pages/networkerror/controller/network_error_controller.dart';
import 'package:get/get.dart';

class NetworkErrorBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut(() => NetworkErrorController());
  }
}
