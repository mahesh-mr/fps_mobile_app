import 'package:get/get.dart';

class RemarkController extends GetxController{
 String? recomendedValues;
  List<String> recommendedItems = [
    'RECOMMENDED 1',
    'RECOMMENDED 2',
    'RECOMMENDED 3',
    'RECOMMENDED 4',
    'RECOMMENDED 5',
    'RECOMMENDED 6'
  ];
   dropdownValueChanging(String value, String checkingValue) {
    if (checkingValue == "RECOMMENDED") {
      recomendedValues = value;
      } update();
   }

}