import 'dart:async';
import 'package:fps/view/screens/screen%20_login/login_screen.dart';
import 'package:fps/view/screens/screen_onboarding/onbording_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
 
  @override
  void onInit() {
    gotoHome();
    super.onInit();
  }

  gotoHome() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    Get.offAll(
       LoginScreen(),
    );
  }
}
