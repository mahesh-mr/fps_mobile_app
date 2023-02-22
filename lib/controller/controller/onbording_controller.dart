import 'package:flutter/cupertino.dart';
import 'package:fps/model/onbording_model.dart';
import 'package:fps/view/screens/screen%20_login/login_screen.dart';
import 'package:fps/view/style/style.dart';
import 'package:get/get.dart';

class OnbordingController extends GetxController {
  var selectedIndex = 0.obs;
  bool get isLastPage => selectedIndex.value == onbordingLists.length - 1;
  var pagecontroller = PageController();

  forwerdAction() {
    //bool isvaliod = fomliey.v.
    if (isLastPage) {
      Get.offAll(LoginScreen());
    } else {
      pagecontroller.nextPage(duration: 550.milliseconds, curve: Curves.ease);
    }
  }

  List<OnbordingModel> onbordingLists = [
    OnbordingModel(
      image: 'assets/1.png',
      mainText: Text(
        'Start\nThe Survey',
        style: onbordingText,
        textAlign: TextAlign.end,
      ),
    ),
    OnbordingModel(
      image: 'assets/2.png',
      mainText: Text('Anytime\nAnywhere',
          style: onbordingText, textAlign: TextAlign.center),
    ),
    OnbordingModel(
      image: 'assets/1.png',
      mainText: Text('Full\nSupport',
          style: onbordingText, textAlign: TextAlign.start),
    )
  ];

  gotoHome() async {
    await Future.delayed(
      const Duration(seconds: 50),
    );
  }

  @override
  void onInit() {
    gotoHome();
    super.onInit();
  }
}
