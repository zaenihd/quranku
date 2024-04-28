import 'package:get/get.dart';
import 'package:quranku/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  getStarted() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String nama = prefs.getString('nama').toString();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      if (nama == "null") {
        Get.toNamed(Routes.INTRO);
      } else {
        Get.toNamed(Routes.DASHBOARD);
      }
    });
  }

  @override
  void onInit() {
    // print('object');
    // getStarted();
    // TODO: implement onInit
    super.onInit();
  }
}
