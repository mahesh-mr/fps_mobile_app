import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class ComenController extends GetxController {
  var isLoding = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future uplodData() async {
    isLoding.value = true;
    Future.delayed(Duration(seconds: 3)).then((value) => CircularProgressIndicator());
    isLoding.value = false;
  }
}
