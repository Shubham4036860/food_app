import 'package:eatery/pages/favorite/binding/Favorite_binding.dart';
import 'package:eatery/pages/favorite/view/favorite_view.dart';
import 'package:eatery/pages/fooddetails/binding/food_detail_binding.dart';
import 'package:eatery/pages/fooddetails/view/food_detail_view.dart';
import 'package:eatery/pages/home/binding/home_binding.dart';
import 'package:eatery/pages/home/view/home_view.dart';
import 'package:eatery/pages/networkerror/binding/network_error_binding.dart';
import 'package:eatery/pages/networkerror/view/network_error_view.dart';
import 'package:eatery/pages/onboarding/binding/onboarding_binding.dart';
import 'package:eatery/pages/onboarding/view/onboarding_view.dart';
import 'package:eatery/pages/purchase/binding/purchase_binding.dart';
import 'package:eatery/pages/purchase/view/purchase_view.dart';
import 'package:eatery/pages/routes/app_routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static const initialRoute = Routes.onBoarding;

  static final routes = [
    GetPage(
      name: Paths.onBoarding,
      page: () => const OnBindingView(),
      binding: OnBoardingBinding(),
      transitionDuration: Duration.zero,
    ),
    GetPage(
      name: Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transitionDuration: Duration.zero,
    ),
    GetPage(
      name: Paths.foodDetail,
      page: () => const FoodDetail(),
      binding: FoodDetailBinding(),
      transitionDuration: Duration.zero,
    ),
    GetPage(
      name: Paths.favorite,
      page: () => const FavoriteScreen(),
      binding: FavoriteBinding(),
      transitionDuration: Duration.zero,
    ),
    GetPage(
      name: Paths.networkError,
      page: () => const NetworkErrorView(),
      binding: NetworkErrorBinding(),
      transitionDuration: Duration.zero,
    ),
    GetPage(
      name: Paths.purchase,
      page: () => const PurchaseView(),
      binding: PurchaseBinding(),
      transitionDuration: Duration.zero,
    ),
  ];
}
