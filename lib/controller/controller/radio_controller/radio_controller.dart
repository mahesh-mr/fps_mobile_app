import 'package:get/get.dart';

class RadioController extends GetxController {
  var selectIndex =0.obs;
   static final Map<String, String> genderMap = {
    'YES': 'YES',
    'NO': 'NO',
  };

  chageRadio(int index){
selectIndex.value=index;
  }




}
