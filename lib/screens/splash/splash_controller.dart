import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 3), () {
      if (!isClosed) {
        Get.offAllNamed('/onboarding_screen_1');
      }
    });
  }
}
