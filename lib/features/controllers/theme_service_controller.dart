import 'package:get/get.dart';
import 'package:my_gellary/utils/themes_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;
  var theme = ThemeClass().lightTheme.obs;
  var switchValue = false.obs; // Add switchValue

  @override
  void onInit() {
    super.onInit();
    switchValue.value = isDarkMode.value; // Initialize switchValue
  }

  Future<void> loadThemeFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkMode.value = prefs.getBool('isDarkMode') ?? false;
    switchValue.value = isDarkMode.value; // Update switchValue
    theme.value =
        isDarkMode.value ? ThemeClass().darkTheme : ThemeClass().lightTheme;
    Get.changeTheme(theme.value);
  }

  void saveThemeToPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode.value);
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    switchValue.value = isDarkMode.value; // Update switchValue
    saveThemeToPreferences();
    theme.value =
        isDarkMode.value ? ThemeClass().darkTheme : ThemeClass().lightTheme;
    Get.changeTheme(theme.value);
  }
}
