import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:eatery/constant/app_colors.dart';
import 'package:eatery/pages/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';

Widget getNetworkImageView(String imageURL,
    {double? width, double? height, BoxFit? boxFit, bool isShowLoader = true, Color loaderColor = primaryColor}) {
  return CachedNetworkImage(
    imageUrl: imageURL,
    fit: boxFit ?? BoxFit.cover,
    progressIndicatorBuilder: (context, url, downloadProgress) => Container(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      alignment: Alignment.center,
      margin: isShowLoader ? EdgeInsets.zero : const EdgeInsets.only(top: 12),
      child: CircularProgressIndicator(
        color: loaderColor,
        value: downloadProgress.progress,
      ),
    ),
    errorWidget: (context, url, error) => SizedBox(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      child: Image.asset(
        'assets/images/ic_logo.png',
        fit: BoxFit.contain,
      ).marginAll(10),
    ) /*Image.asset(
        PLACE_HOLDER,
      )*/
    ,
  );
}

Future<bool> checkConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    /*Get.snackbar(
      "Internet",
      "Check Your Network Connectivity",
    );*/


    return false;
  } else {
    // Get.offAllNamed(Routes.home);
    return true;
  }
}

bool checkString(String? value) => value == null || value.toString().trim().isEmpty;
