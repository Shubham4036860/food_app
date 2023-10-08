import 'dart:async';
import 'dart:convert';
import 'package:eatery/pages/home/model/home_response_model.dart';
import 'package:eatery/pages/routes/app_routes.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:eatery/widget/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {

  final searchTextFormField = TextEditingController().obs;

  final loading = false.obs;
  final isChanged = false.obs;
  var allResponseData = RxList<dynamic>();
  final dataList = <AppResponseModel>[].obs;
  final steps = <String>[].obs;
  final foodListSearch = <AppResponseModel>[].obs;
  Timer? debounce;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }


  @override
  void dispose() {
    super.dispose();
    print("dispose===>");
    Hive.box('ApiData').clear();

  }


  @override
  void onClose() {
    print("onClose===>");
    super.onClose();
  }

  Future<void> fetchData() async {
    checkConnectivity().then((connectivity) async {
      print("check data connectivity ${connectivity}");
      if (connectivity == true) {
        try {
          loading.value = true;
          final value = await http.get(Uri.parse("https://recipesapi.kutaybekleric.com/recipes"));
          print("check data value.statusCode ${value.statusCode}");
          if (value.statusCode == 200) {
            loading.value = false;
            List jsonResponse = json.decode(value.body);
            List<AppResponseModel> fetchedData = jsonResponse.map((job) => AppResponseModel.fromJson(job)).toList();
            final boxData=await Hive.openBox("ApiData");
            await boxData.addAll(fetchedData);

            dataList.assignAll(fetchedData);
            steps.value = dataList[0].tags ?? [];
            print("check data and ${dataList.length}");
            print("check data steps ${steps.length}");
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

        loadData();
        /*Get.toNamed(Routes.networkError)!.then((value) {
          if (value != null) {
            print("object check back to screen");
            onInit();
          }
        });*/
      }
    });
  }

  void toggleFavorite(int index) {
    dataList[index].isFavorite?.value = !dataList[index].isFavorite!.value;
    saveFavoritesToPrefs();
    // fetchData();
    // update();
  }

  Future<List<AppResponseModel>> readDataFromHive() async {
    final box = await Hive.openBox('ApiData');
    final List<AppResponseModel> data = box.values.map((value) => value as AppResponseModel).toList();
    await box.close();
    return data;
  }

  Future<void> loadData() async {
    // First, try to load data from Hive
    final offlineData = await readDataFromHive();

    if (offlineData.isNotEmpty) {
      // Data is available offline
      dataList.assignAll(offlineData);
      steps.value = dataList[0].tags ?? [];
      print("Data is available");
      print("Data is available dataList ${dataList.length}");
      print("Data is available steps${steps.length}");

    } else {
      // Data is not available offline, fetch it from the API (assuming you have an online fallback)
      print("Data is not available offline");
      // await fetchDataAndStoreInHive();
    }
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
            if ((dataList[i].name?.toLowerCase())!.contains(searchQuery.toLowerCase())) {
              foodListSearch.add(dataList[i]);
            }
          }
        } else {
          foodListSearch.clear();
        }
      }
    });
  }

  void saveFavoritesToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteIds = dataList.where((item) => item.isFavorite?.value ?? true).map((item) => item.id).toList();
    prefs.setStringList('favoriteIds', favoriteIds.map((id) => id.toString()).toList());
  }

  Future<List<String>> getFavoriteIdsFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('favoriteIds') ?? [];
  }
}
