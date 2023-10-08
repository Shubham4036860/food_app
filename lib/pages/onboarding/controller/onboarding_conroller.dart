import 'package:eatery/constant/storage_utils.dart';
import 'package:eatery/pages/routes/app_routes.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  final isGuestMode = true.obs;

  @override
  void onInit() async{
    super.onInit();
    await StorageUtils.getData(StorageUtils.keyGuestMode).then((value) {
      if (value != null) {

        isGuestMode.value=value;
        print("check guest mode check Guest ${isGuestMode.value}");
      }
    });
    /*if(isGuestMode.value==false){
      Get.offAllNamed(Routes.home);
    }*/
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print("check guest mode onReady ${isGuestMode.value}");
    redirection();

    // redirectToNextScreen();
  }

  Future<void> redirection() async {
    if(isGuestMode.value==false){
      Get.offAllNamed(Routes.home);
    }else{
      await StorageUtils.setData(StorageUtils.keyGuestMode, false);
      Get.offAllNamed(Routes.home);
    }

  }
}
