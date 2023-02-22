import 'dart:async';

import 'package:get/get.dart';

class ControllerC extends GetxController {
  var start = 30.obs;

  void startTime() {
    const onsec = Duration(seconds: 1);

    Timer.periodic(onsec, (timer) {
      if (start.value == 0) {
        timer.cancel();
      } else {
        start--;
      }
    });
  }
}
