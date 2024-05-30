import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_gellary/component/buttom_custom.dart';
import 'package:my_gellary/component/elliptical_gradient_painter.dart';
import 'package:my_gellary/component/text_field_custom.dart';
import 'package:my_gellary/features/controllers/login_controllers.dart';
import 'package:my_gellary/screens/home_screeen/home_view.dart';
import 'package:my_gellary/utils/app_text_styles.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode buttonFocusNode = FocusNode();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: EllipticalGradientPainter(),
            ),
          ),
          SafeArea(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16).w,
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 45.h),
                        Image.asset(
                          "assets/images/love_photography.png",
                          fit: BoxFit.scaleDown,
                        ),
                        SizedBox(height: 45.h),
                        const Center(
                            child: Text(
                          textAlign: TextAlign.center,
                          "My \nGellary",
                          style: AppTextStyles.largeTitle30,
                        )),
                        SizedBox(height: 45.h),
                        GetBuilder<LoginController>(
                          builder: (controller) {
                            return Form(
                              key: formKey,
                              child: Container(
                                height: 380.h,
                                width: 500.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  gradient: RadialGradient(
                                    center: Alignment.center,
                                    radius: 1.0,
                                    colors: [
                                      const Color(0xffDDCDFF).withOpacity(0.5),
                                      const Color(0xffEA94D7).withOpacity(0.5),
                                      Colors.transparent,
                                    ],
                                    stops: const [0.0, 0.5, 1.0],
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        textAlign: TextAlign.center,
                                        "Log in",
                                        style: AppTextStyles.largeTitle22,
                                      ),
                                      SizedBox(height: 35.h),
                                      TextFieldCustomEdit(
                                        fillColor: Colors.white,
                                        style: const TextStyle(
                                            color: Colors.black),
                                        hintText: "Email".tr,
                                        controller: controller.emailController,
                                        validatorText:
                                            "Please enter your email".tr,
                                        textInputType:
                                            TextInputType.emailAddress,
                                        prefixIcon: SvgPicture.asset(
                                          "assets/icons/sms.svg",
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                      SizedBox(height: 20.h),
                                      TextFieldEditPass(
                                          fillColor: Colors.white,
                                          style: const TextStyle(
                                              color: Colors.black),
                                          onClick: controller.toggleDesign,
                                          prefixIcon: SvgPicture.asset(
                                            "assets/icons/lock.svg",
                                            fit: BoxFit.scaleDown,
                                          ),
                                          hintText: "Password".tr,
                                          textController:
                                              controller.passController,
                                          icon: Icon(
                                            controller.obscureT
                                                ? Icons.visibility_off_outlined
                                                : Icons.visibility_outlined,
                                            color: Colors.grey,
                                          ),
                                          obscureText: controller.obscureT),
                                      SizedBox(height: 30.h),
                                      Obx(
                                        () => controller.isLoading.value
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                        color:
                                                            Color(0xff79A3D3)),
                                              )
                                            : FilledButtomEdit(
                                                focusNodes: buttonFocusNode,
                                                text: "SUBMIT".tr,
                                                color: const Color(0xff79A3D3),
                                                size: 16,
                                                color1: Colors.white,
                                                onClick: () {
                                                  if (formKey.currentState!
                                                      .validate()) {
                                                    // Passwords are valid and match
                                                    // Perform further actions like saving the password
                                                    controller.login();
                                                  }
                                                },
                                              ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
