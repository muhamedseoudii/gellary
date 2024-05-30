import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as client;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';

import 'gallery_controller.dart';

class PickImageController extends GetxController {
  final _image = Rx<File?>(null);
  var isLoading = false.obs;
  var errorMessage = RxString('');

  File? get image => _image.value;

  void pickImageFromCamera() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (pickedImage != null) {
      _image.value = File(pickedImage.path);
      updateProfile();
    }
  }

  void pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _image.value = File(pickedImage.path);
      updateProfile();
      print('image is ${pickedImage.path}');
    }
  }

  Future<void> updateProfile() async {
    try {
      isLoading(true);
      var dio = client.Dio();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';
      client.FormData formData = client.FormData.fromMap({
        if (_image.value != null)
          "img": await client.MultipartFile.fromFile(_image.value!.path,
              contentType: MediaType('image', '')),
      });
      var response = await dio.post(
        "https://flutter.prominaagency.com/api/upload",
        data: formData,
        options: client.Options(headers: {
          'Authorization': 'Bearer $token',
        }),
      );
      // Handle response
      if (kDebugMode) {
        print(response.data);
      }
      if (response.statusCode == 200) {
        GalleryController galleryController = Get.find();
        galleryController.fetchGallery();
        final message = response.data['message'];
        Get.snackbar(
          'Successful',
          message,
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }
      if (kDebugMode) {
        print(response.data);
      }
    } on client.DioException catch (e) {
      if (e.response != null) {
        // The request was made and the server responded with a status code
        // that falls out of the range of 2xx
        if (kDebugMode) {
          print(e.response!.data);
        }
        errorMessage(e.response!.data.toString());
        if (kDebugMode) {
          print(
              'Error ${e.response!.statusCode}: ${e.response!.statusMessage}');
        }
        final data = jsonDecode(e.response!.toString());
        final message = data['message'];
        Get.snackbar(
          'Failed',
          message,
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        errorMessage(e.message);
        if (kDebugMode) {
          print(e);
        }
        if (kDebugMode) {
          print('Error: ${e.message}');
        }
      }
    } catch (e, st) {
      // Handle other types of exceptions
      errorMessage(e.toString());
      if (kDebugMode) {
        print('Error: $e');
        print('Error in_____: $st');
      }
    } finally {
      isLoading(false);
    }
  }
}
