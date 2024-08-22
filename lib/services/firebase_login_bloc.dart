// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test_project/auth/models/user_model.dart';
import 'package:flutter_test_project/services/local_storage.dart';
import 'package:flutter_test_project/utils/app_dialogs.dart';
import 'package:flutter_test_project/utils/app_navigation.dart';
import 'package:flutter_test_project/utils/app_routes_name.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthBloc {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  ///-------------------- Google Sign In -------------------- ///
  Future<void> signInWithGoogle({
    required BuildContext context,
    required bool isLogin,
  }) async {
    try {
      GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      GoogleSignInAccount? _googleSignInAccount = await _googleSignIn.signIn();
      if (_googleSignInAccount != null) {
        await _googleSignIn.signOut();
        String? displayName = _googleSignInAccount.displayName;
        if (displayName != null) {
          saveUser(
            googleSignInAccount: _googleSignInAccount,
            context: context,
          );
        }
      }
    } catch (error) {
      log(error.toString());
      AppDialogs.showToast(message: error.toString());
    }
  }

  Future<void> saveUser(
      {required GoogleSignInAccount googleSignInAccount,
      required BuildContext context}) async {
    final userModel = UserModel(
      displayName: googleSignInAccount.displayName ?? '',
      email: googleSignInAccount.email,
      id: googleSignInAccount.id,
      photoUrl: googleSignInAccount.photoUrl ?? '',
      serverAuthCode: googleSignInAccount.serverAuthCode ?? '',
    );

    final sharedPreference = SharedPreference();
    await sharedPreference.setUser(userModel);
    if (userModel != null) {
      AppNavigation.navigateToRemovingAll(
          context, AppRouteName.HOME_SCREEN_ROUTE);
    } else {
      AppNavigation.navigateToRemovingAll(
        context,
        AppRouteName.LOGIN_SCREEN_ROUTE,
      );
    }
  }

  ///-------------------- Sign out from firebase -------------------- ///
  Future<void> firebaseUserSignOut({
    required BuildContext context,
  }) async {
    await _firebaseAuth.signOut();
    SharedPreference().clear();
    AppNavigation.navigateToRemovingAll(
      context,
      AppRouteName.LOGIN_SCREEN_ROUTE,
    );
    AppDialogs.showToast(message: "User Logout Successfully");
  }
}
