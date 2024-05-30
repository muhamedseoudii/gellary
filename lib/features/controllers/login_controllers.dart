import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  bool obscureT = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  var isLoading = false.obs;
  var errorMessage = RxString('');

  @override
  void onClose() {
    emailController.dispose();
    passController.dispose();
    super.onClose();
  }

  void toggleDesign() {
    obscureT = !obscureT;
    update();
  }

  Future<void> login() async {
    try {
      isLoading(true);
      var dio = Dio();
      var response = await dio.post(
        "https://flutter.prominaagency.com/api/auth/login",
        data: {
          'email': emailController.text,
          'password': passController.text,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', emailController.text);
        await prefs.setString('token', data['token']);

        Get.snackbar(
          'Message',
          "Sign in Successfully",
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        isLoading(false);
        Get.offAllNamed('/home');
      } else {
        isLoading(false);
        Get.snackbar(
          'Failed',
          "Login failed. Please try again.",
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } on DioException catch (e) {
      isLoading(false);
      if (e.response != null) {
        errorMessage(e.response!.data.toString());
        if (kDebugMode) {
          print(
              'Error ${e.response!.statusCode}: ${e.response!.statusMessage}');
        }
        Get.snackbar(
          'Failed',
          "Incorrect email or password",
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        errorMessage(e.message);
        if (kDebugMode) {
          print('Error: ${e.message}');
        }
        Get.snackbar(
          'Failed',
          "Network error. Please try again.",
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e, st) {
      isLoading(false);
      errorMessage(e.toString());
      if (kDebugMode) {
        print('Error: $e');
        print('StackTrace: $st');
      }
      Get.snackbar(
        'Failed',
        "An unexpected error occurred. Please try again.",
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }
}
