import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_project/auth/controller/auth_controller.dart';
import 'package:flutter_test_project/base_widget/base_widget.dart';
import 'package:get/get.dart';
import 'services/local_storage.dart' as local_storage;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await local_storage.SharedPreference().sharedPreference;
  Get.put(AuthController());
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  ).then(
    (_) {
      runApp(
        const BaseWidget(),
      );
    },
  );
}
