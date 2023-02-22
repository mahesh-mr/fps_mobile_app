import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fps/controller/controller/confirm_owner_controller/confirm_owner_controller.dart';
import 'package:fps/controller/service/confirm_OWNER/confirm_owner_service.dart';
import 'package:fps/controller/service/home_service/district_service/district_data.dart';
import 'package:fps/controller/service/survay_screen_service/position_service.dart';
import 'package:fps/model/all_fps_number_model/all_fps_number_model.dart';
import 'package:fps/model/all_fps_numbers_model/all_fps_model_number.dart';
import 'package:fps/model/survey_model/position_model.dart';
import 'package:get/get.dart';

class PositionController extends GetxController {
  PositionModel positionModel = PositionModel();
  var lastInspectonDates = DateTime.now().obs;
  List<AllRoles> positinList = [];
  List<FPSNumber> fpsNumberList = [];
  AllFpsNumberModel fpsNumber = AllFpsNumberModel();
  // List<FPSNumber> fpsNumberList = [];
  List<FPSNumber> tempfpsNumberList = [];

  // List<FpsNumberList> FpsNumberList = [];
  String? positionValue;
  String? fpsValue;
  var switchValue = false.obs; var  isLoding=false.obs;

  changeTogle(bool toggleValue) {
    switchValue.value = toggleValue;
    update();
  }

  fpsNumberController() async {
 
    try {
      var data = await PositionService.allFpsNumber();
     

      return data;
    } catch (e) {
       Get.snackbar('warnig', 'Please check Internet Connection');
      log("error: $e");
      log('catch bloc called');
    }
    update();
    return null;
  }

  positionController() async {
    try {
      var data = await PositionService.positionService();
      return data;
    } catch (e) {
      Get.snackbar('warnig', 'Please check Internet Connection');
      log("error:$e");
      log('catch bloc called');
    }
    update();
    return null;
  }

  popupPositions() async {
    PositionModel? pmodel = await positionController();
    AllFpsNumberModel? fpsModel = await fpsNumberController();
    // AllFpsNumbersModel? fpsModel = await getPost();
    // fpsNumberList = fpsModel!.data!;
    fpsNumberList = fpsModel!.data!;
    positinList = pmodel!.data!.allRoles!;
    update();
  }

  @override
  void onInit() {
    popupPositions();
    super.onInit();
  }

  dropdownPositionChange(String value, String checkingValue) {
    if (checkingValue == "POSITION") {
      positionValue = value;
    } else if (checkingValue == "FPS Number") {
      fpsValue = value;
    }
    update();
  }

  choseLastInspectionDate() async {
    DateTime? pickDate = await showDatePicker(
      context: Get.context!,
      initialDate: lastInspectonDates.value,
      firstDate: lastInspectonDates.value.subtract(const Duration(days: 770)),
      lastDate: DateTime.now(),
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorInvalidText: 'Provide Valid Date',
    );

    if (pickDate != null && pickDate != lastInspectonDates.value) {
      lastInspectonDates.value = pickDate;
    }
  }
}
