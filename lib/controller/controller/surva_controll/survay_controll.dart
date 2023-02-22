import 'package:get/get.dart';

class SurvayController extends GetxController {
  String? positionValue;
  List<String> positionItems = [
    'POSITION 1',
    'POSITION 2',
    'POSITION 3',
    'POSITION 4',
    'POSITION 5',
    'POSITION 6'
  ];

  dropdownValueChanging(String value, String checkingValue) {
    if (checkingValue == "POSITION") {
      positionValue = value;
    }
    update();
  }
}
