import 'package:fps/controller/service/confirm_OWNER/confirm_owner_service.dart';
import 'package:fps/model/confirmOwnerModel/confirmOwnerModel.dart';
import 'package:get/get.dart';

class ConfirmController extends GetxController {
  RxBool loding = false.obs;
  // var  isLoding=false.obs;
  ComfirmModel? confirmModel = ComfirmModel();
  Future<ComfirmModel?> getConfirmService() async {
    try {
      loding.value = true;
      var data = await ConfirmOwnerService.confirmUserService();
      loding.value = false;
      return data;
    } catch (e) {
      Get.snackbar('warnig', 'Please check Internet Connection');
      print(e);
      print('catch bloc called');
      loding.value = true;
    }
    update();
    return null;
  }

  @override
  void onInit() {
    getConfirmService().then((value) => confirmModel = value);
    update();
    super.onInit();
  }
}
