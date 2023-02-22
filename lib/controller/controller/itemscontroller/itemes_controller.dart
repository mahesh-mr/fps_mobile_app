import 'package:flutter/material.dart';
import 'package:fps/controller/service/stock_ites_service/get_items_name.dart';
import 'package:fps/model/get_items_model/get_item.dart';
import 'package:fps/view/screens/camerScreen/camera_shop.dart';
import 'package:get/get.dart';

class ItemController extends GetxController {
  var selectedIndex = 0.obs;
  bool get isLastPage => selectedIndex.value == getItemModel.length - 1;
  var pagecontroller = PageController();
  final countValue = 0.obs;
  var  isLoding=false.obs;
  increment() => countValue.value++;
  final assignedquantityController = TextEditingController();
  final physicalstockController = TextEditingController();
  final badstockController = TextEditingController();
  forwerdPageJumb() {
    pagecontroller.nextPage(
      duration: 550.milliseconds,
      curve: Curves.ease,
    );
  }

  forwerdAction() {
    if (isLastPage) {
      Get.to(CameraShop());
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => CameraShop()));
    } else {
      pagecontroller.nextPage(duration: 550.milliseconds, curve: Curves.ease);
    }
  }

  gotoHome() async {
    await Future.delayed(
      const Duration(seconds: 50),
    );
  }

  List<Rows> getItemModel = <Rows>[];
  RxBool loding = true.obs;
  Future<List<Rows>?> getItemsController() async {
    try {
      var data = await GetItemsNameService.getItemName();
      loding.value = false;
      return data!;
    } catch (e) {
      Get.snackbar('warnig', 'Please check Internet Connection');
      print(e);
      print('catch bloc called');
      loding.value = false;
    }
    return null;
  }

  @override
  void onInit() {
    getItemsController().then((value) => getItemModel = value!);
    super.onInit();
  }

  // List<String> itemsName = [
  //   'പച്ചരി',
  //   'പുഴുക്കലരി',
  //   'കുത്തരി',
  //   'ഗോതമ്പ്',
  //   'ആട്ട',
  //   'പഞ്ചസാര',
  //   'മണ്ണെണ്ണ',
  // ];
}
