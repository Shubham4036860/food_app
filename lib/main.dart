import 'package:eatery/constant/app_string.dart';
import 'package:eatery/pages/onboarding/binding/onboarding_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'constant/app_colors.dart';
import 'constant/app_fonst.dart';
import 'pages/home/model/RecipeModel.dart';
import 'pages/routes/app_pages.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AppResponseModelAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        fontFamily: appFont,
        bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: AppPages.initialRoute,
      initialBinding: OnBoardingBinding(),
      getPages: AppPages.routes,
      enableLog: true,
    );
  }
}
