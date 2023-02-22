import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fps/controller/service/home_service/district_service/district_data.dart';
import 'package:fps/model/all_fps_number_model/all_fps_number_model.dart';
import 'package:fps/model/all_fps_numbers_model/all_fps_model_number.dart';
import 'package:fps/model/home_models/distric_model/district_model.dart';
import 'package:fps/model/home_models/firka_model/firka.dart';
import 'package:fps/model/home_models/taluk_model/taluk.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  DistrictModel districtDropdown = DistrictModel();
  TalukModel talukDropdown = TalukModel();
  FirkaModel firkadropdown = FirkaModel();
AllFpsNumberModel fpsNumber = AllFpsNumberModel();

  var selectedDate = DateTime.now().obs;
  var switchValue = false.obs;  var  isLoding=false.obs;

  List<AllDistrict> districtList = [];
  List<FirkaList> firkaList = [];
  List<Taluk> talukList = [];
  List<Taluk> tempTalukList = [];
  List<FirkaList> tempFrikaList = [];
//  List<FPSNumber> fpsNumberList = [];
//   List<FPSNumber> tempfpsNumberList = [];

  String? firkaValue;
  String? districtValue;
  String? talukvalues;
 

 // String? fpsValue;

  //togle funtion==========================

  changeTogle(bool toggleValue) {
    switchValue.value = toggleValue;
    update();
  }

  //district items=======================================
  districtController() async {
    try {
      var data = await DistrictDataService.districService();
      return data;
    } catch (e) {
       Get.snackbar('warnig', 'Please check Internet Connection');
      log("error: $e");
      log('catch bloc called');
    }
    update();
    return null;
  }
//  fpsNumberController() async {
//     try {
//       var data = await DistrictDataService.allFpsNumber();
//       return data;
//     } catch (e) {
//       Get.snackbar('oopz', ' $e');
//       log("error: $e");
//       log('catch bloc called');
//     }
//     update();
//     return null;
//   }
  

  //taluk items===================================================

  getTalukData() async {
    try {
      var data = await DistrictDataService.talukService();
      log("$data=============");
      return data;
    } catch (e) {
     Get.snackbar('warnig', 'Please check Internet Connection');
      log("error: $e");
      log('catch bloc called');
    }
    update();
    return null;
  }

//firkka items===================================================
  firkaController() async {
    try {
      var data = await DistrictDataService.firkaService();
      log("$data=============");
      return data;
    } catch (e) {
       Get.snackbar('warnig', 'Please check Internet Connection');
      log("error: $e");
      log('catch bloc called');
    }
    update();
    return null;
  }

//populating methosds===============================================
  populateDropdowns() async { 
   //  AllFpsNumberModel? fpsModel = await fpsNumberController();
    DistrictModel? dmodel = await districtController();
    TalukModel? tmodel = await getTalukData();
    FirkaModel? fmodel = await firkaController();
   

//===================================================================
    districtList = dmodel!.data!;
    firkaList = fmodel!.data!;
    talukList = tmodel!.data!;
  //  fpsNumberList = fpsModel!.data!;
//====================================================================
    update();
  }

  @override
  void onInit() {
    populateDropdowns();
    super.onInit();
  }

// value changing methed
//==================
  dropdownValueChanging(String value, String checkingValue) {
    if (checkingValue == "District") {
      districtValue = value;
    } else if (checkingValue == "Taluk") {
      talukvalues = value;
    } else if (checkingValue == "Firka") {
      firkaValue = value;
    } 
    update();
  }

  //date time

  choseDate() async {
    DateTime? pickDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: selectedDate.value.subtract(const Duration(days: 770)),
      lastDate: DateTime.now(),
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorInvalidText: 'Provide Valid Date',
    );

    if (pickDate != null && pickDate != selectedDate.value) {
      selectedDate.value = pickDate;
    }
  }

//note use in ihis picker=============================================
//====================================================================

  // bool disableDate(DateTime day) {
  //   if (day.isAfter(DateTime.now().subtract(Duration(days: 1)))) {
  //     return true;
  //   }
  //   return false;
  // }

  // @override
  // void onInit() {
  //   districtController().then((value) => districtDropdown = value!);
  //   super.onInit();
  // }
}
