import 'package:flutter_test_project/home/models/generic_post_model.dart';
import 'package:flutter_test_project/services/app_logger.dart';
import 'package:flutter_test_project/services/local_storage.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get i => Get.find();

  Rxn<GenericPostModel> categoryRecentData = Rxn(null);

  //Fav

  Future<void> toggleWishlist(int productId, Post productData) async {
    logData(message: "toggleWishlist");
    bool isInWishlist =
        await SharedPreference().hasProductInWishlist(productId);
    // logData(message: "isInWishlist: ${isInWishlist}");
    if (isInWishlist) {
      logData(message: "toggleWishlist true");
      await SharedPreference().removeProductFromWishlist(productId);
    } else {
      logData(message: "toggleWishlist false");
      await SharedPreference().addProductToWishlist(productData);
    }
    loadWishlist();
    update();
  }

  RxList<int> wishlistProductIds = <int>[].obs;
  RxList<Post> wishlist = List<Post>.empty().obs;

  void loadWishlist() async {
    logData(message: "loadWishlist");
    wishlist.value = await SharedPreference().getWishlist();
    logData(message: "wishlist: ${wishlist.length}");
    wishlistProductIds.value =
        wishlist.map((product) => product.id ?? 0).toList();
  }

  Future<bool> isInWishlist(int productId) async {
    return await SharedPreference().hasProductInWishlist(productId);
  }
}
