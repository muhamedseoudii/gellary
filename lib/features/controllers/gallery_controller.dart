import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:my_gellary/features/models/get_images_model.dart';
import 'package:my_gellary/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GalleryController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<String> images = <String>[].obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchGallery();
  }

  Future<void> fetchGallery() async {
    try {
      isLoading(true);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';

      final response = await dio.get(
        'https://flutter.prominaagency.com/api/my-gallery',
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
      );

      var data = response.data;
      if (data != null) {
        GalleryResponse galleryResponse = GalleryResponse.fromJson(data);
        images.value = galleryResponse.data.images;
      } else {
        errorMessage('Failed to load data');
      }
    } catch (error) {
      errorMessage(error.toString());
    } finally {
      isLoading(false);
    }
  }
}
