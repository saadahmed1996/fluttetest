import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_project/custom_widgets/custom_empty_data.dart';
import 'package:flutter_test_project/custom_widgets/custom_text.dart';
import 'package:flutter_test_project/home/controller/home_controller.dart';
import 'package:flutter_test_project/utils/app_colors.dart';
import 'package:flutter_test_project/utils/app_fonts.dart';
import 'package:flutter_test_project/home/models/generic_post_model.dart';
import 'package:get/get.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: CustomText(
          text: 'Favorites',
          color: AppColors.whiteColor,
          fontsize: 18,
          fontFamily: AppFonts.robotoBold,
        ),
        backgroundColor: AppColors.kPrimaryColor,
      ),
      body: GetBuilder<HomeController>(builder: (homCon) {
        return homCon.wishlist.isEmpty
            ? CustomEmptyData(
                title: "No Favorites Found",
              )
            : ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: homCon.wishlist.length,
                itemBuilder: (context, index) {
                  final post = homCon.wishlist[index];
                  return _postCardWidget(post, context);
                },
              );
      }),
    );
  }

  Widget _postCardWidget(Post post, BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomText(
                        text: post?.title ?? 'No Title',
                        color: AppColors.blackColor,
                        fontsize: 14.sp,
                        fontFamily: AppFonts.robotoBold,
                        maxLines: 2,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await HomeController.i.toggleWishlist(
                          post.id ?? 0,
                          post,
                        );
                      },
                      child: Obx(() {
                        bool isInWishlist = HomeController.i.wishlistProductIds
                            .contains(post.id);
                        return Icon(
                          isInWishlist ? Icons.favorite : Icons.favorite_border,
                          color: isInWishlist ? Colors.red : Colors.grey,
                        );
                      }),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                CustomText(
                  text: post.body ?? 'No Body',
                  color: AppColors.blackColor,
                  fontsize: 14,
                  fontFamily: AppFonts.robotoRegular,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.thumb_up, color: Colors.green[600]),
                        const SizedBox(width: 4),
                        CustomText(
                          text: '${post.reactions?.likes ?? 0}',
                          color: Colors.green[600],
                          fontsize: 14,
                          fontFamily: AppFonts.robotoRegular,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.thumb_down, color: Colors.red[600]),
                        const SizedBox(width: 4),
                        CustomText(
                          text: '${post.reactions?.dislikes ?? 0}',
                          color: Colors.red[600],
                          fontsize: 14,
                          fontFamily: AppFonts.robotoRegular,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
