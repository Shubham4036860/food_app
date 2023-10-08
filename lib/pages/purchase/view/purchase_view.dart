import 'dart:async';

import 'package:eatery/constant/app_colors.dart';
import 'package:eatery/constant/app_string.dart';
import 'package:eatery/constant/app_text.dart';
import 'package:eatery/pages/purchase/controller/purchase_controller.dart';
import 'package:eatery/widget/components.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class PurchaseView extends GetView<PurchaseController> {
  const PurchaseView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
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
            ],
          ),
          // foodList()
          searchField(),
          Obx(() {
            return controller.isChanged.value == true ? getSearchListView() : const Offstage();
          }),
          Obx(() => controller.dataList.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(
                  color: primaryColor,
                ))
              : foodListForShow(context).marginOnly(top: 25, left: 25)),
        ],
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
            controller.dataListSearch.clear();
            controller.isChanged.value = !checkString(controller.searchTextFormField.value.text.trim());
            print("controller.isChanged.value ${controller.isChanged.value}");
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
              return SizedBox(
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
                            controller.dataList[index].productPictures.isNotEmpty
                                ? controller.dataList[index].productPictures[0].pictureUrl
                                : "https://i.pinimg.com/originals/49/e5/8d/49e58d5922019b8ec4642a2e2b9291c2.png",
                            boxFit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      controller.dataList[index].name ?? "",
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppText.textBold.copyWith(color: colorBlack, fontSize: 20),
                    ).marginOnly(left: 20, right: 20),
                    Text(
                      controller.dataList[index].shortDescription ?? "",
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppText.textMedium.copyWith(color: colorGrey, fontSize: 12),
                    ).marginOnly(left: 20, right: 20)
                  ],
                ),
              ).marginOnly(left: 10);
            });
      }),
    );
  }

  Widget getSearchListView() {
    return Obx(() => controller.dataListSearch.isEmpty
        ? Offstage()
        : ListView.builder(
            itemCount: controller.dataListSearch.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (chatContext, index) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(color: colorWhite, border: Border.all(color: primaryColor)),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(color: colorGreyLight),
                          child: getNetworkImageView(controller.dataListSearch[index].productPictures[0].toString()),
                        ),
                      ),
                      title: Row(
                        children: [
                          Flexible(
                            child: Text(
                              controller.dataListSearch[index].name.toString(),
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
                              controller.dataListSearch[index].shortDescription!,
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              style: AppText.textMedium.copyWith(color: colorGreyLight, fontSize: 10),
                            ).marginOnly(left: 5),
                          ),
                        ],
                      ),
                    ),
                  ).marginOnly(top: 15)
                ],
              );
            },
          ));
  }
}
