import 'package:get/get.dart';

class FoodDetailController extends GetxController {

  final stepsList =<String>[].obs;
  final tags =<String>[].obs;
  final ingredients =<String>[].obs;
  final image ="".obs;
  final description ="".obs;
  final title ="".obs;
  @override
  void onInit() {
    if(Get.arguments!=null){
      image.value=Get.arguments['image'];
      title.value=Get.arguments['title'];
      description.value=Get.arguments['description'];
      ingredients.value=Get.arguments['ingraditions'];
      stepsList.value=Get.arguments['steps'];
      tags.value=Get.arguments['tags'];
      print("check data ${image.value}");
    }
    super.onInit();
  }
}