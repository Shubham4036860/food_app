import 'package:eatery/constant/app_colors.dart';
import 'package:flutter/material.dart';

class AppText{
  static var textRegular = const TextStyle(
      fontSize: 16,
      color: primaryColor);

  static var textLight = textRegular.copyWith(fontWeight: FontWeight.w200);

  static var textMedium = textRegular.copyWith(fontWeight: FontWeight.w500);

  static var textSemiBold = textRegular.copyWith(fontWeight: FontWeight.w600);

  static var textBold = textRegular.copyWith(fontWeight: FontWeight.bold);

}