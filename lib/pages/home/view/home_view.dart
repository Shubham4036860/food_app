import 'dart:async';

import 'package:eatery/constant/app_colors.dart';
import 'package:eatery/constant/app_fonst.dart';
import 'package:eatery/constant/app_string.dart';
import 'package:eatery/constant/app_text.dart';
import 'package:eatery/pages/home/controller/home_controller.dart';
import 'package:eatery/pages/routes/app_routes.dart';
import 'package:eatery/widget/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(text: "$lblGreetings, ", style: AppText.textMedium.copyWith(color: colorGreyLight, fontSize: 25)),
                    TextSpan(
                      text: controller.greetings(),
                      style: AppText.textSemiBold.copyWith(color: primaryColor, fontSize: 20),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ]),
                ).marginOnly(top: 50, left: 25),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.purchase);
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: primaryColor, width: 0.2)),
                    child: Icon(
                      Icons.favorite_border_rounded,
                      size: 20,
                      color: primaryColor,
                    ),
                  ).marginOnly(top: 50, right: 25),
                )
              ],
            ),
            // foodList()
            searchField(),
            Obx(() {
              return controller.isChanged.value == true ? getSearchListView() : const Offstage();
            }),
            Text(
              'Popular Dishes',
              style: AppText.textBold.copyWith(
                color: primaryColor,
              ),
            ).marginOnly(top: 25, left: 25),
            Obx(() => controller.dataList.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(
                    color: primaryColor,
                  ))
                : foodListForShow(context).marginOnly(top: 25, left: 25)),
            Text(
              'Popular Tags',
              style: AppText.textBold.copyWith(
                color: primaryColor,
              ),
            ).marginOnly(top: 25, left: 25),
            Obx(() {
              return controller.steps.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: primaryColor,
                    ))
                  : tags(context).marginOnly(top: 25, left: 25);
            }),
          ],
        ),
      ),
    );
  }

  Widget searchField() {
    return Container(
      height: 55,
      width: 350,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.transparent),
      child: Obx(() {
        return TextFormField(
          controller: controller.searchTextFormField.value,
          onTap: () {},
          onChanged: (val) {
            controller.foodListSearch.clear();
            controller.isChanged.value = !checkString(controller.searchTextFormField.value.text.trim());
            print("controller.isChanged.value ${controller.isChanged.value}");
/*            if (controller.searchTextFormField.value.text.trim().length > 1) {
              if (controller.debounce?.isActive ?? false) {
                controller.debounce?.cancel();
              }
              controller.debounce = Timer(const Duration(milliseconds: 500), () {
                controller.getSearchResult(controller.searchTextFormField.value.text);
                print("check recent search data${controller.foodListSearch.length}");
              });
            }*/

            if (controller.searchTextFormField.value.text.trim().length > 1) {
              if (controller.debounce?.isActive ?? false) controller.debounce?.cancel();
              controller.debounce = Timer(const Duration(milliseconds: 500), () {
                controller.getSearchResult(controller.searchTextFormField.value.text);
              });
            }
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 20, right: 5, top: 10, bottom: 0),
            alignLabelWithHint: false,
            suffixIcon: const Icon(
              Icons.search,
              color: primaryColor,
            ).marginOnly(right: 20),
            counter: null,
            isDense: true,
            counterText: "",
            focusColor: primaryColor,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 0.5, //<-- SEE HERE
                color: primaryColor,
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
            hintText: "search dish and many more..",
            hintStyle: AppText.textLight.copyWith(color: primaryColor, fontSize: 12, decoration: TextDecoration.none),
            filled: true,
            fillColor: colorWhite,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 0.5, //<-- SEE HERE
                color: colorGrey,
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
            border: InputBorder.none,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        );
      }),
    ).marginOnly(top: 25, left: 25, right: 25);
  }

  Widget foodListForShow(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.38,
      child: Obx(() {
        return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.dataList.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Get.toNamed(Routes.foodDetail, arguments: {
                    "image": controller.dataList[index].image,
                    "title": controller.dataList[index].name,
                    "description": controller.dataList[index].description,
                    "ingraditions": controller.dataList[index].ingredients,
                    "steps": controller.dataList[index].steps,
                    "tags": controller.dataList[index].tags,
                  });
                },
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            height: 200,
                            width: 300,
                            decoration:
                                BoxDecoration(border: Border.all(color: primaryColor.withOpacity(0.2)), borderRadius: BorderRadius.circular(20)),
                            child: getNetworkImageView(
                              controller.dataList[index].image ?? "",
                              boxFit: BoxFit.contain,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              print("check click is working or not");
                              controller.toggleFavorite(index);
                              print("check click is working or not ${controller.dataList[index].isFavorite}");
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration:
                                  BoxDecoration(color: colorWhite, shape: BoxShape.circle, border: Border.all(color: primaryColor, width: 0.2)),
                              child: Obx(() {
                                return Icon(
                                  controller.dataList[index].isFavorite?.value == true ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                                  size: 20,
                                  color: controller.dataList[index].isFavorite?.value == true ? primaryColor : colorGreyLight,
                                );
                              }),
                            ).marginOnly(right: 25, top: 15),
                          )
                        ],
                      ),
                      Text(
                        controller.dataList[index].name ?? "",
                        style: AppText.textBold.copyWith(color: colorBlack, fontSize: 20),
                      ).marginOnly(left: 20, right: 20),
                      Text(
                        controller.dataList[index].description ?? "",
                        softWrap: true,
                        maxLines: 2,
                        style: AppText.textMedium.copyWith(color: colorGrey, fontSize: 12),
                      ).marginOnly(left: 20, right: 20)
                    ],
                  ),
                ).marginOnly(left: 10),
              );
            });
      }),
    );
  }

  Widget tags(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.38,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: controller.steps.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: primaryColor,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      controller.steps[index],
                      style: AppText.textBold.copyWith(color: colorBlack, fontSize: 20),
                    ).marginOnly(left: 20, right: 20),
                  ),
                ],
              ),
            ).marginOnly(left: 5);
          }),
    );
  }

  Widget getSearchListView() {
    return Obx(() => controller.foodListSearch.isEmpty
        ? Offstage()
        : ListView.builder(
            itemCount: controller.foodListSearch.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (chatContext, index) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(color: colorWhite, border: Border.all(color: primaryColor)),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.foodDetail, arguments: {
                          "image": controller.foodListSearch[index].image,
                          "title": controller.foodListSearch[index].name,
                          "description": controller.foodListSearch[index].description,
                          "ingraditions": controller.foodListSearch[index].ingredients,
                          "steps": controller.foodListSearch[index].steps,
                          "tags": controller.foodListSearch[index].tags,
                        });
                      },
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(color: colorGreyLight),
                            child: getNetworkImageView(controller.foodListSearch[index].image.toString()),
                          ),
                        ),
                        title: Row(
                          children: [
                            Flexible(
                              child: Text(
                                controller.foodListSearch[index].name.toString(),
                                overflow: TextOverflow.clip,
                                softWrap: true,
                                style: AppText.textBold.copyWith(color: primaryColor, fontSize: 14),
                              ).marginOnly(left: 5),
                            ),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Flexible(
                              child: Text(
                                controller.foodListSearch[index].description!,
                                overflow: TextOverflow.clip,
                                softWrap: true,
                                style: AppText.textMedium.copyWith(color: colorGreyLight, fontSize: 10),
                              ).marginOnly(left: 5),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ).marginOnly(top: 15)
                ],
              );
            },
          ));
  }
}
