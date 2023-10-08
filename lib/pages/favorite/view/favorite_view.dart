import 'package:eatery/constant/app_colors.dart';
import 'package:eatery/constant/app_text.dart';
import 'package:eatery/pages/home/controller/home_controller.dart';
import 'package:eatery/widget/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<String>>(
        future: Get.find<HomeController>().getFavoriteIdsFromPrefs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Show loading indicator while fetching data
          }
          final favoriteIds = snapshot.data ?? [];
          final favoriteItems = Get.find<HomeController>().dataList.where((item) => favoriteIds.contains(item.id.toString())).toList();

          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: primaryColor, width: 0.2)),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: primaryColor,
                        ),
                      ).marginOnly(top: 50, left: 25),
                    ),
                    Text('Favorite ', style: AppText.textMedium.copyWith(color: colorGreyLight, fontSize: 25)).marginOnly(top: 50, left: 25),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: favoriteItems.isEmpty
                      ? Center(
                          child: Text('No Favorite items yet', style: AppText.textMedium.copyWith(color: colorGreyLight, fontSize: 25)),
                        )
                      : ListView.builder(
                          itemCount: favoriteItems.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Container(
                                height: 250,
                                width: 50,
                                child: getNetworkImageView(favoriteItems[index].image ?? ""),
                              ),
                              title: Text(favoriteItems[index].name ?? ""),
                              subtitle: Text(favoriteItems[index].description ?? ""),
                              // Customize UI as needed
                            );
                          },
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
