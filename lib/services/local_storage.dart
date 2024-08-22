import 'dart:convert';
import 'package:flutter_test_project/auth/models/user_model.dart';
import 'package:flutter_test_project/home/models/generic_post_model.dart';
import 'package:flutter_test_project/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static SharedPreference? _sharedPreferenceHelper;
  static SharedPreferences? _sharedPreferences;

  SharedPreference._createInstance();

  factory SharedPreference() {
    _sharedPreferenceHelper ??= SharedPreference._createInstance();
    return _sharedPreferenceHelper!;
  }

  Future<SharedPreferences> get sharedPreference async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return _sharedPreferences!;
  }

  void clear() {
    _sharedPreferences!.clear();
    SharedPreference().setViewOnBoardingScreen(viewOnBoarding: true);
  }

  void setBearerToken({String? token}) {
    _sharedPreferences!.setString(AppStrings.BEARER_TOKEN_KEY, token ?? "");
  }

  String? getBearerToken() {
    return _sharedPreferences!.getString(AppStrings.BEARER_TOKEN_KEY);
  }

  Future<void> setUser(UserModel user) async {
    final prefs = await sharedPreference;
    // Convert UserModel to JSON string
    String userJson = jsonEncode(user.toJson());
    await prefs.setString(AppStrings.CURRENT_USER_DATA_KEY, userJson);
  }

  Future<UserModel?> getUser() async {
    final prefs = await sharedPreference;
    String? userJson = prefs.getString(AppStrings.CURRENT_USER_DATA_KEY);
    if (userJson != null) {
      return UserModel.fromJson(jsonDecode(userJson));
    }
    return null;
  }

  void setViewOnBoardingScreen({bool? viewOnBoarding}) {
    _sharedPreferences?.setBool(
        AppStrings.VIEW_ONBOARDING_DATA_KEY, viewOnBoarding!);
  }

  bool? getViewOnBoardingScreen() {
    return _sharedPreferences?.getBool(AppStrings.VIEW_ONBOARDING_DATA_KEY);
  }

  void setNotificationMessageId({String? messageId}) {
    _sharedPreferences!
        .setString(AppStrings.NOTIFICATION_MESSAGE_ID_KEY, messageId ?? "");
  }

  String? getNotificationMessageId() {
    return _sharedPreferences!
        .getString(AppStrings.NOTIFICATION_MESSAGE_ID_KEY);
  }

  setLanguage({String? languageCode}) async {
    await _sharedPreferences!
        .setString(AppStrings.LANGUAGE_KEY, languageCode ?? "");
  }

  static String? getLanguage() {
    return _sharedPreferences!.getString(AppStrings.LANGUAGE_KEY);
  }

  void setCart({String? cart}) {
    _sharedPreferences!.setString(AppStrings.CART, cart ?? "");
  }

  String? getCart() {
    return _sharedPreferences!.getString(AppStrings.CART);
  }

  Future<void> setWishlist(List<Post> wishlist) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(AppStrings.WISHLIST, jsonEncode(wishlist));
  }

  Future<List<Post>> getWishlist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? wishlistString = prefs.getString(AppStrings.WISHLIST);
    if (wishlistString != null) {
      List<dynamic> jsonList = jsonDecode(wishlistString);
      return jsonList.map((json) => Post.fromJson(json)).toList();
    }
    return [];
  }

  Future<void> removeCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(AppStrings.CART);
  }

  Future<void> addProductToWishlist(Post product) async {
    List<Post> wishlist = await getWishlist();
    wishlist.add(product);
    await setWishlist(wishlist);
  }

  Future<void> removeProductFromWishlist(int productId) async {
    List<Post> wishlist = await getWishlist();
    wishlist.removeWhere((product) => product.id == productId);
    await setWishlist(wishlist);
  }

  Future<bool> hasProductInWishlist(int productId) async {
    List<Post> wishlist = await getWishlist();
    return wishlist.any((product) => product.id == productId);
  }
}
