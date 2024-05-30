import 'package:get/get.dart';
import 'package:my_gellary/features/controllers/login_controllers.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
