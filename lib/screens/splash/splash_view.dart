import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  Future<void> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    if (email != null && email.isNotEmpty) {
      // User is logged in, navigate to home screen
      Get.offAllNamed('/home');
    } else {
      // User is not logged in, navigate to login screen
      Get.offAllNamed('/login');
    }
  }

  Future<void> clearSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SvgPicture.asset(
            "assets/images/Blur.svg",
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          FadeIn(
            onFinish: (direction) {
              checkLogin();
            },
            duration: const Duration(seconds: 3),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/images/love_photography.png",
                    height: 130.h,
                    width: 160.w,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
