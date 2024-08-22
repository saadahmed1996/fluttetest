import 'package:flutter/material.dart';
import 'package:flutter_test_project/custom_widgets/custom_button.dart';
import 'package:flutter_test_project/home/blocs/add_post_bloc.dart';
import 'package:flutter_test_project/utils/app_colors.dart';
import 'package:flutter_test_project/utils/app_dialogs.dart';
import 'package:flutter_test_project/utils/app_navigation.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: const Text('Add New Post'),
        backgroundColor: AppColors.kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
              maxLength: 100,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _bodyController,
              decoration: const InputDecoration(
                labelText: 'Body',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            CustomButton(
              buttonColor: AppColors.kPrimaryColor,
              onTap: () {
                final title = _titleController.text;
                final body = _bodyController.text;

                if (title.isNotEmpty && body.isNotEmpty) {
                  _addPost(title, body);
                } else {
                  AppDialogs.showToast(message: "Please fill in all fields");
                }
              },
              buttonText: "Add Post",
            )
          ],
        ),
      ),
    );
  }

  void _addPost(String title, String body) {
    // Call your bloc method to add the post here
    AddPostBloc().addPostBlocMethod(
      context: context,
      title: title,
      body: body,
      setProgressBar: () {
        AppDialogs.progressAlertDialog(context: context);
      },
    );

    // Go back to the previous screen
    AppNavigation.navigatorPop(context);
  }
}
