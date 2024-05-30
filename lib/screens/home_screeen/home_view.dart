import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_gellary/features/controllers/gallery_controller.dart';
import 'package:my_gellary/features/controllers/pick_image_controller.dart';
import 'package:my_gellary/utils/app_text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../component/buttom_custom.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static Future<void> clearSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
  }

  @override
  Widget build(BuildContext context) {
    final GalleryController galleryController = Get.put(GalleryController());
    Get.put(PickImageController());
    return Scaffold(
      backgroundColor: const Color(0xffDDCDFF),
      body: RefreshIndicator(
        color: const Color(0xff79A3D3),
        onRefresh: () async {
          galleryController.fetchGallery();
        },
        child: SafeArea(
          child: Stack(
            children: [
              SvgPicture.asset(
                "assets/images/Vector.svg",
                color: const Color(0xffF5F5F5),
                fit: BoxFit.fill,
              ),
              Padding(
                padding: EdgeInsets.all(10.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Welcome \nMina",
                          style: AppTextStyles.largeTitleBlack18,
                        ),
                        CircleAvatar(
                          backgroundImage:
                              const AssetImage("assets/images/person.jpg"),
                          backgroundColor: Colors.grey,
                          radius: 25.r,
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ContainerButtonEdit(
                          onClick: () {
                            Get.defaultDialog(
                              radius: 16.r,
                              contentPadding: const EdgeInsets.all(16),
                              title: 'Confirm deletion'.tr,
                              middleText: 'Are you sure?'.tr,
                              actions: [
                                FilledButtomEdit(
                                  text: "Confirm".tr,
                                  color: Colors.red,
                                  size: 16.sp,
                                  color1: Colors.white,
                                  onClick: () {
                                    Get.back(); // Close the dialog
                                    clearSharedPreferences();
                                    Get.offAllNamed('/login');
                                  },
                                ),
                                FilledButtomEdit(
                                  text: "Cancel",
                                  color: const Color(0xff79A3D3),
                                  size: 16.sp,
                                  color1: Colors.white,
                                  onClick: () {
                                    Get.back();
                                  },
                                ),
                              ],
                            );
                          },
                          boxColor: const LinearGradient(
                            colors: [
                              Color(0xffC83B3B),
                              Color(0xffFB4949),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          icon: "assets/icons/back_arrow.svg",
                          text: "Log Out",
                        ),
                        GetBuilder<PickImageController>(
                          builder: (controller) {
                            return ContainerButtonEdit(
                              onClick: () {
                                Get.dialog(
                                  Dialog(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                    ),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.23,
                                      decoration: BoxDecoration(
                                        gradient: RadialGradient(
                                          center: Alignment.center,
                                          radius: 1.0,
                                          colors: [
                                            const Color(0xffDDCDFF)
                                                .withOpacity(0.5),
                                            const Color(0xffEA94D7)
                                                .withOpacity(0.5),
                                            Colors.transparent,
                                          ],
                                          stops: const [0.0, 0.5, 1.0],
                                        ),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.r),
                                                  color:
                                                      const Color(0xffEFD8F9)),
                                              child: ListTile(
                                                leading: Image.asset(
                                                  "assets/images/gallery.png",
                                                  width: 30.w,
                                                  height: 30.h,
                                                ),
                                                title: Text('Gallery'.tr),
                                                onTap: () {
                                                  Get.back();
                                                  controller
                                                      .pickImageFromGallery();
                                                },
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.r),
                                                  color:
                                                      const Color(0xffEBF6FF)),
                                              child: ListTile(
                                                leading: Image.asset(
                                                  "assets/images/camera.png",
                                                  width: 30.w,
                                                  height: 30.h,
                                                ),
                                                title: Text('Camera'.tr),
                                                onTap: () {
                                                  Get.back();
                                                  controller
                                                      .pickImageFromCamera();
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  barrierColor: Colors.black.withOpacity(0.5),
                                );
                              },
                              boxColor: const LinearGradient(
                                colors: [
                                  Color(0xffFFEB38),
                                  Color(0xffFF9900),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              icon: "assets/icons/top_arrow.svg",
                              text: "Upload",
                            );
                          },
                        )
                      ],
                    ),
                    SizedBox(height: 25.h),
                    Obx(() {
                      if (galleryController.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (galleryController.errorMessage.isNotEmpty) {
                        return Center(
                            child: Text(galleryController.errorMessage.value));
                      } else {
                        return Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0,
                            ),
                            itemCount: galleryController.images.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    galleryController.images[index],
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
