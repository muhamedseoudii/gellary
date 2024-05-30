import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_gellary/features/controllers/theme_service_controller.dart';
import 'package:my_gellary/screens/home_screeen/home_view.dart';
import 'package:my_gellary/screens/login/login_view.dart';
import 'package:my_gellary/screens/splash/splash_view.dart';
import 'package:my_gellary/utils/my_bindings.dart';
import 'package:my_gellary/utils/themes_controller.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'My Gellary',
          debugShowCheckedModeBanner: false,
          theme: ThemeClass().lightTheme,
          darkTheme: ThemeClass().darkTheme,
          themeMode: ThemeController().isDarkMode.value
              ? ThemeMode.dark
              : ThemeMode.light,
          initialBinding: MyBindings(),
          initialRoute: '/',
          getPages: [
            GetPage(
                name: '/',
                page: () => const SplashView(),
                binding: MyBindings()),
            GetPage(
                name: '/login',
                page: () => const LoginView(),
                binding: MyBindings()),
            GetPage(
                name: '/home',
                page: () => const HomeView(),
                binding: MyBindings()),
          ],
        );
      },
    );
  }
}
