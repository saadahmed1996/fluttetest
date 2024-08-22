import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_project/custom_widgets/custom_empty_data.dart';
import 'package:flutter_test_project/custom_widgets/custom_text.dart';
import 'package:flutter_test_project/home/blocs/delete_post_bloc.dart';
import 'package:flutter_test_project/home/blocs/fetch_post_bloc.dart';
import 'package:flutter_test_project/home/controller/home_controller.dart';
import 'package:flutter_test_project/home/models/generic_post_model.dart';
import 'package:flutter_test_project/services/firebase_login_bloc.dart';
import 'package:flutter_test_project/utils/app_colors.dart';
import 'package:flutter_test_project/utils/app_dialogs.dart';
import 'package:flutter_test_project/utils/app_fonts.dart';
import 'package:flutter_test_project/utils/app_navigation.dart';
import 'package:flutter_test_project/utils/app_routes_name.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeController _homeController;
  final ScrollController _scrollController = ScrollController();
  bool _isFetchingMore = false;
  int _currentPage = 1; // Track current page

  @override
  void initState() {
    super.initState();
    _homeController = Get.put(HomeController());
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _fetchPosts();
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchMorePosts();
      }
    });
    //Add Local Fav List
    HomeController.i.loadWishlist();
  }

  Future<void> _fetchPosts({bool isRefresh = false}) async {
    if (isRefresh) {
      _currentPage = 1; // Reset page number for refresh
      _homeController.categoryRecentData.value?.posts?.clear();
    }

    await FetchPostBloc().fetchPostBlocMethod(
      context: context,
      setProgressBar: () {
        AppDialogs.progressAlertDialog(context: context);
      },
      currentPage: _currentPage, // Pass currentPage
      isRefresh: isRefresh,
    );

    if (!isRefresh) {
      _currentPage++; // Increment page number for subsequent loads
    }
  }

  Future<void> _fetchMorePosts() async {
    if (_isFetchingMore) return;
    _isFetchingMore = true;

    await _fetchPosts();

    _isFetchingMore = false;
  }

  Future<void> _onRefresh() async {
    await _fetchPosts(isRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading: const Icon(Icons.menu, size: 20),
        title: const Text(
          'Home Screen',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.favorite, size: 20),
            onPressed: () {
              // AppDialogs.progressAlertDialog(context: context);
              // FirebaseAuthBloc().firebaseUserSignOut(context: context);
              AppNavigation.navigateTo(
                  context, AppRouteName.FAVOURITE_SCREEN_ROUTE);
            },
          ),
          IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.logout, size: 20),
            onPressed: () {
              AppDialogs.progressAlertDialog(context: context);
              FirebaseAuthBloc().firebaseUserSignOut(context: context);
            },
          ),
        ],
        backgroundColor: AppColors.kPrimaryColor,
      ),
      body: GetBuilder<HomeController>(
        builder: (homeController) {
          return RefreshIndicator(
            onRefresh: _onRefresh,
            child: homeController.categoryRecentData.value?.posts == null ||
                    homeController.categoryRecentData.value?.posts?.isEmpty ==
                        true
                ? CustomEmptyData(
                    title: "No Data Found",
                  )
                : ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(8.0),
                    itemCount: homeController
                            .categoryRecentData.value?.posts?.length ??
                        0,
                    itemBuilder: (context, index) {
                      final post = homeController
                          .categoryRecentData.value?.posts?[index];
                      return _postCardWidget(post, context);
                    },
                  ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.kPrimaryColor,
        foregroundColor: AppColors.whiteColor,
        elevation: 5,
        onPressed: () {
          AppNavigation.navigateTo(context, AppRouteName.ADD_POST_SCREEN_ROUTE);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _postCardWidget(Post? post, BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
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
                Obx(() {
                  bool isInWishlist =
                      HomeController.i.wishlistProductIds.contains(post?.id);
                  return IconButton(
                    icon: Icon(
                        isInWishlist ? Icons.favorite : Icons.favorite_border,
                        color: Colors.pink[600]),
                    onPressed: () async {
                      //
                      await HomeController.i.toggleWishlist(
                        post?.id ?? 0,
                        post!,
                      );
                    },
                  );
                }),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red[600]),
                  onPressed: () {
                    _showDeleteConfirmationDialog(context, post);
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            CustomText(
              text: post?.body ?? 'No Body',
              color: AppColors.blackColor,
              fontsize: 14.sp,
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
                    Text('${post?.reactions?.likes ?? 0}',
                        style: TextStyle(color: Colors.green[600])),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.thumb_down, color: Colors.red[600]),
                    const SizedBox(width: 4),
                    Text('${post?.reactions?.dislikes ?? 0}',
                        style: TextStyle(color: Colors.red[600])),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, Post? post) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: Text('Are you sure you want to delete "${post?.title}"?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                AppNavigation.navigatorPop(context);
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                AppNavigation.navigatorPop(context);
                _deletePost(post);
              },
            ),
          ],
        );
      },
    );
  }

  void _deletePost(Post? post) {
    DeletePostBloc().deletePostBlocMethod(
      context: context,
      setProgressBar: () {
        AppDialogs.progressAlertDialog(context: context);
      },
      postId: post?.id.toString() ?? '',
    );
  }
}
