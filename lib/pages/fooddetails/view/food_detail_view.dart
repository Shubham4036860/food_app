import 'package:eatery/constant/app_colors.dart';
import 'package:eatery/constant/app_text.dart';
import 'package:eatery/pages/fooddetails/controller/food_detail_controller.dart';
import 'package:eatery/widget/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class FoodDetail extends GetView<FoodDetailController> {
  const FoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  child: getNetworkImageView(controller.image.value ?? ""),
                ),
                InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorWhite,
                        border: Border.all(color: primaryColor, width: 0.2)),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: primaryColor,
                    ),
                  ).marginOnly(top: 50, left: 25),
                ),
              ],
            ),
            Text(
              controller.title.value ?? "",
              style:
                  AppText.textBold.copyWith(color: primaryColor, fontSize: 24),
            ).marginOnly(top: 20, left: 10),
            Text(
              controller.description.value ?? "",
              maxLines: 10,
              style: AppText.textBold
                  .copyWith(color: colorGreyLight, fontSize: 18),
            ).marginOnly(top: 20, left: 10, right: 10),
            Text(
              'How To Make This Recepie',
              style:
                  AppText.textBold.copyWith(color: primaryColor, fontSize: 18),
            ).marginOnly(top: 20, left: 10, right: 10),
            ListView.builder(
              itemCount: controller.stepsList.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("=> ${controller.stepsList[index]}"),
                );
              },
            ).marginOnly(top:10,left: 10, right: 10),
            Text(
              'Ingredients',
              style:
              AppText.textBold.copyWith(color: primaryColor, fontSize: 18),
            ).marginOnly(top: 20, left: 10, right: 10),
            ListView.builder(
              itemCount: controller.ingredients.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("=> ${controller.ingredients[index]}"),
                );
              },
            ).marginOnly(top:10,left: 10, right: 10),
            Text(
              'Tags',
              style:
              AppText.textBold.copyWith(color: primaryColor, fontSize: 18),
            ).marginOnly(top: 20, left: 10, right: 10),
            ListView.builder(
              itemCount: controller.tags.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(controller.tags[index]),
                );
              },
            ).marginOnly(top:10,left: 10, right: 10),
          ],
        ),
      ),
    );
  }
}
