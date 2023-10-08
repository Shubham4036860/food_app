import 'package:eatery/constant/app_colors.dart';
import 'package:eatery/constant/app_fonst.dart';
import 'package:eatery/constant/app_string.dart';
import 'package:eatery/constant/app_text.dart';
import 'package:eatery/pages/onboarding/controller/onboarding_conroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class OnBindingView extends GetView<OnBoardingController> {
  const OnBindingView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("check guest mode check Guest ${controller.isGuestMode.value}");
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/ic_logo.png',
            ).marginOnly(top: 35, left: 35),
            Text(
              lblOnBoarding,
              style: AppText.textBold.copyWith(
                  fontSize: 45,
                  fontFamily: appFontSecond,
                  color: colorWhite,
                  decoration: TextDecoration.none),
            ).marginOnly(top: 20, left: 35),
            Image.asset(
              'assets/images/ic_person.png',
            ),
            Center(
              child: Container(
                height: 55,
                width: 300,
                decoration: BoxDecoration(
                    color: colorWhite, borderRadius: BorderRadius.circular(20)),
                child: InkWell(
                  onTap: (){
                    print("object check");
                    controller.redirection();
                  },
                  child: Center(
                    child: Text(
                      lblGetStart,
                      textAlign: TextAlign.center,
                      style: AppText.textBold.copyWith(
                          fontSize: 25,
                          fontFamily: appFontSecond,
                          color: primaryColor,
                          decoration: TextDecoration.none),
                    ),
                  ),
                ),
              ),
            ).marginOnly(top: 20)
          ],
        ),
      ),
    );
  }
}
