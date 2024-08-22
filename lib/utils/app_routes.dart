import 'package:flutter_test_project/auth/screens/login_screen.dart';
import 'package:flutter_test_project/home/screen/add_post_screen.dart';
import 'package:flutter_test_project/home/screen/favourite_screen.dart';
import 'package:flutter_test_project/home/screen/home_screen.dart';
import 'package:flutter_test_project/splash/screen/splash_screen.dart';
import 'package:flutter_test_project/utils/app_routes_name.dart';
import 'package:get/get.dart';

class AppRouter {
  static final routes = [
    GetPage(
      name: AppRouteName.SPLASH_SCREEN_ROUTE,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRouteName.LOGIN_SCREEN_ROUTE,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: AppRouteName.HOME_SCREEN_ROUTE,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: AppRouteName.ADD_POST_SCREEN_ROUTE,
      page: () => AddPostScreen(),
    ),
    GetPage(
      name: AppRouteName.FAVOURITE_SCREEN_ROUTE,
      page: () => FavouriteScreen(),
    ),
    // GetPage(
    //   name: AppRouteName.PRODUCT_DETAIL_SCREEN_ROUTE,
    //   page: () {
    //     ProductDetailArguments? productDetailArguments =
    //         Get.arguments as ProductDetailArguments?;
    //     return ProductDetailScreen(
    //       productModel: productDetailArguments?.productModel,
    //       productId: productDetailArguments?.productId,
    //     );
    //   },
    // ),
  ];
}
