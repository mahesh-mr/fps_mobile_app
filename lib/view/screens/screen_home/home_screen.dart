import 'package:flutter/material.dart';
import 'package:fps/controller/controller/home_controller.dart/home_controller.dart';
import 'package:fps/controller/controller/survey_controller/position_controller.dart';
import 'package:fps/controller/controller/tost/tost.dart';
import 'package:fps/controller/service/dioclint/token/token.dart';
import 'package:fps/view/screens/sreen_survay/survay_screen.dart';
import 'package:fps/view/screens/widgets/custom_dropdown.dart';
import 'package:fps/view/screens/widgets/double_tapp.dart';
import 'package:fps/view/screens/widgets/popup_menu/popup_menu.dart';
import 'package:fps/view/screens/widgets/shadow_button.dart';
import 'package:fps/view/style/style.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final number = TextEditingController();
  final positions = TextEditingController();
  final inspectorname = TextEditingController();
  final homecontroller = Get.put(HomeController());
  final positionController = Get.put(PositionController());
  final survayData = GetStorage();
  String? userIds = GetLocalStorage.getUserIdAndToken('id');
  String? userId = GetLocalStorage.getUserIdAndToken('id');
  String cdate = DateFormat("dd-MM-yyy").format(DateTime.now());
  DateTime? lastpressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: bg,
        title: Text(
          "CIVIL SUPPLIES",
          style: appText,
        ),
        actions: [
          PopupHome(
            color: mainred,
          ),
        ],
      ),
      body: DoubleTapBackPress(
        lastpressed: lastpressed,
        widget: GetBuilder<HomeController>(
          dispose: (_) {
            homecontroller.districtValue = null;
            homecontroller.talukvalues = null;
            homecontroller.firkaValue = null;
          },
          builder: (controller) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 100.h,
                          width: 200.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 100.h,
                                width: 130.w,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/6.png'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 25.h,
                          left: 15.w,
                          child: Text(
                            "Start\nInspection",
                            style: welcomeText,
                          ),
                        )
                      ],
                    ),
                    h10,
                    const Text(
                      "Inspections Of Ration\nshops across kerala",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, color: grey),
                    ),
                    h30,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.h),
                      child: Column(
                        children: [
                          buttons(),
                          h30,
                          districtDropdown(),
                          h30,
                          talukDropdown(),
                          h30,
                          firkaDropdown(),
                          h50,
                          CustomShadowButton(
                            title:
                                butenText(title: 'Start Inspection', textColor: bg),
                            buttonColor: mainred,
                            height: 40.h,
                            width: double.infinity,
                            onTap: () {
                              String dates = DateFormat("yyyy-MM-dd hh:mm:ss")
                                  .format(controller.selectedDate.value)
                                  .toString();
                              if (controller.districtValue != null &&
                                  controller.talukvalues != null &&
                                  controller.firkaValue != null) {
                                survayData.write(
                                    "districtValue", controller.districtValue);
                                survayData.write(
                                    "talukvalues", controller.talukvalues);
                                survayData.write(
                                    "firkaValue", controller.firkaValue);
                                survayData.write("dateFormat", dates);

                                Get.to(SurveyScreen(),transition: Transition.noTransition,
                              duration: Duration(seconds: 1));
                              } else {
                                if (controller.districtValue == null) {
                                  TostClass.customWarningTost(
                                      context, 'district');
                                } else if (controller.talukvalues == null) {
                                  TostClass.customWarningTost(context, 'taluk');
                                } else if (controller.firkaValue == null) {
                                  TostClass.customWarningTost(context, 'firka');
                                } else {
                                  TostClass.warningTost(context);
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  CustomDropdown districtDropdown() {
    return CustomDropdown(
        onpressed: (String? newValue) {
          print("$userIds====id true");
          print("$userId====id orginal");
          homecontroller.talukvalues = null;
          homecontroller.dropdownValueChanging(newValue!, 'District');
          print("${newValue} =====district");
          homecontroller.tempTalukList = homecontroller.talukList
              .where((element) =>
                  element.districtId.toString() ==
                  homecontroller.districtValue.toString())
              .toList();
        },
        value: homecontroller.districtValue,
        items: homecontroller.districtList.map((e) {
          return DropdownMenuItem(
            value: e.id.toString(),
            child: Text(e.name!),
          );
        }).toList(),
        hint: 'District');
  }

  CustomDropdown talukDropdown() {
    return CustomDropdown(
        onpressed: (String? newValue) {
          homecontroller.firkaValue = null;
          homecontroller.dropdownValueChanging(newValue!, 'Taluk');
          homecontroller.tempFrikaList = homecontroller.firkaList
              .where((element) =>
                  element.talukId.toString() ==
                  homecontroller.talukvalues.toString())
              .toList();

          print("${newValue} ==============tal");
        },
        value: homecontroller.talukvalues,
        items: homecontroller.tempTalukList.map((e) {
          return DropdownMenuItem(
            value: e.id.toString(),
            child: Text(e.name!),
          );
        }).toList(),
        hint: 'Taluk');
  }

  CustomDropdown firkaDropdown() {
    return CustomDropdown(
        onpressed: (String? newValue) {
          positionController.fpsValue = null;
          homecontroller.dropdownValueChanging(newValue!, 'Firka');
          positionController.tempfpsNumberList = positionController
              .fpsNumberList
              .where((element) =>
                  element.firka.toString() ==
                  homecontroller.firkaValue.toString())
              .toList();
          print("${newValue} ==============fir");
          print(
              "${positionController.tempfpsNumberList.length}  ==fps num len");
          print(
              "${positionController.tempfpsNumberList.map((e) => e.fpsNo)}  ==fps num fir");
          positionController.tempfpsNumberList
              .map((e) => print("${e.firka}===fps fir"));
        },
        value: homecontroller.firkaValue,
        items: homecontroller.tempFrikaList.map((e) {
          return DropdownMenuItem(
            child: Text(e.name!),
            value: e.id.toString(),
          );
        }).toList(),
        hint: 'Firka');
  }

//buttons=========================================================================
//================================================================================
  Row buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Inspection Date : ",
          style: TextStyle(fontWeight: FontWeight.w600, color: grey),
        ),
        w10,
        // Obx(
        //   () {
        // String formateDates = DateFormat("dd-MM-yyyy")
        //     .format(homecontroller.selectedDate.value)
        //     .toString();
        // return
        CustomShadowButton(
          onTap: () {
            //  homecontroller.choseDate();
          },
          buttonColor: mainred,
          height: 23.h,
          width: 150.w,
          title: butenText(title: cdate, textColor: bg),
        )
        // },
        // ),
      ],
    );
  }
}
