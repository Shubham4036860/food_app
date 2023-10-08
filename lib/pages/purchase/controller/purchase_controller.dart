import 'dart:async';
import 'dart:convert';

import 'package:eatery/pages/purchase/model/purchase_mode.dart';
import 'package:eatery/pages/routes/app_routes.dart';
import 'package:eatery/widget/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PurchaseController extends GetxController {
  final loading = false.obs;
  final dataList = <PurchaseModel>[].obs;
  final searchTextFormField = TextEditingController().obs;
  final dataListSearch = <PurchaseModel>[].obs;
  final isChanged = false.obs;
  Timer? debounce;


  @override
  void onInit() {
    super.onInit();
    getPurchaseData();
  }

  Future<void> getPurchaseData() async {
    checkConnectivity().then((connectivity) async {
      print("check data connectivity ${connectivity}");
      if (connectivity == true) {
        try {
          loading.value = true;
          final value = await http.get(Uri.parse("https://issg.shopfast.net/api/v1/catalog/products/app-products"));
          print("check data value.statusCode ${value.statusCode}");
          if (value.statusCode == 200) {
            loading.value = false;
            List jsonResponse = json.decode(value.body);
            print("jsonResponse ${jsonResponse}");
            List<PurchaseModel> fetchedData = jsonResponse.map((job) => PurchaseModel.fromJson(job)).toList();
            dataList.assignAll(fetchedData);
            print("check data dataList ${dataList.length}");
          } else {
            loading.value = false;

            throw "something went wrong";
          }
        } catch (error) {
          loading.value = false;
          // Handle error, if needed
          print(error);
        } finally {
          loading.value = false; // Set
        }
      } else {
        Get.toNamed(Routes.networkError)!.then((value) {
          if (value != null) {
            print("object check back to screen");
            onInit();
          }
        });
      }
    });
  }

  String greetings() {
    final hour = TimeOfDay.now().hour;
    if (hour <= 12) {
      return 'Good Morning';
    } else if (hour <= 17) {
      return 'Good AfterNoon';
    }
    return 'Evening';
  }

  getSearchResult(String searchQuery) {
    isChanged.value = true;
    checkConnectivity().then((connectivity) async {
      if (connectivity) {
        if (dataList.isNotEmpty) {
          for (var i = 0; i < dataList.length; i++) {
            if ((dataList[i].name.toLowerCase()).contains(searchQuery.toLowerCase())) {
              dataListSearch.add(dataList[i]);
            }
          }
        } else {
          dataListSearch.clear();
        }
      }
    });
  }
}
