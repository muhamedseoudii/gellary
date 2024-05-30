import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/controllers/theme_service_controller.dart';
import 'src/app_root.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSharedPreferences();
  Get.put(() => ThemeController().loadThemeFromPreferences());
  runApp(const AppRoot());
}

Future<SharedPreferences> initSharedPreferences() async {
  return await SharedPreferences.getInstance();
}

Dio dio = Dio(BaseOptions(
  receiveDataWhenStatusError: true,
  validateStatus: (status) => true,
));

void setupDio() {
  dio.interceptors.add(InterceptorsWrapper(
    onResponse: (response, handler) async {
      // Check if the response status is 401 (unauthorized)
      if (response.statusCode == 401) {
        // await ProfilePageView.clearSharedPreferences();

        // Redirect the user to the login screen
        // Replace '/login' with your actual login route
        Get.offAllNamed('/login');
      }
      return handler.next(response);
    },
  ));
}
