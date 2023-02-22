import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:fps/controller/controller/commen_controller/commen_controller.dart';
import 'package:fps/controller/controller/qustion_pagae_controller/qustion_controller.dart';
import 'package:fps/controller/service/qustion_air_service/fps_owner_name_service/fps_owner_name.dart';
import 'package:fps/view/screens/items_list/items_list.dart';
import 'package:fps/view/screens/widgets/custom_appbar.dart';
import 'package:fps/view/screens/sreen_survay/widgets/survey_form_wiidget.dart';
import 'package:fps/view/screens/widgets/double_tapp.dart';
import 'package:fps/view/screens/widgets/shadow_button.dart';
import 'package:fps/view/style/style.dart';
import 'package:get/get.dart';

class FpsOwnerName extends StatelessWidget {
  FpsOwnerName({super.key});

  @override
  final nameController = TextEditingController();

  final relationController = TextEditingController();

  final fomkey = GlobalKey<FormState>();
  final commencontroller = Get.put(CommenController());
  DateTime? lastpressed;
  final qustionContoller = QustionController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: CustomAppbar(height: 220.h),
      body: DoubleTapBackPress(
        lastpressed: lastpressed,
        widget: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.h),
            child: Obx(() {
              return Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 110.h,
                        width: 130.w,
                        decoration: const BoxDecoration(
                          
                            image: DecorationImage(
                                image: AssetImage('assets/owner.png'))),
                      ),
                      w60,
                      Container(
                        height: 120,
                        width: double.infinity,
                        // color: yellow,
                        child: Text(
                          qustionContoller.tabTextIndexSelected.value == 0
                              ? 'പരിശോധന സമയം എഫ്.പി.എസ് നിയന്ത്രിച്ചിരുന്ന വ്യക്തിയുടെ പേര്, എഫ്.പി.എസ്-ഉം മായുള്ള ബന്ധം'
                              : 'Name of person who controlled  the FPS at the time of inspection and relationship with FPS',
                          maxLines: 5,
                          textAlign: TextAlign.center,
                          style: normalText,
                        ),
                      ),
                      Form(
                        key: fomkey,
                        child: Column(
                          children: [
                            CustomSurveyTextForm(
                                controller: nameController,
                                textinputType: TextInputType.name,
                                title: "Name",
                                validator: (value) {
                                  if (value!.length == 0) {
                                    return "        please Enter the owners name";
                                  } else if (!RegExp(r'(^[a-z A-Z]+$)')
                                      .hasMatch(value)) {
                                    return '         Please enter a valid name';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (p0) {},
                                suffix: ''),
                            h10,
                            CustomSurveyTextForm(
                                controller: relationController,
                                textinputType: TextInputType.name,
                                title: "Relation",
                                validator: (value) {
                                  if (value!.length == 0) {
                                    return "        please Enter the owners relation";
                                  } else if (!RegExp(r'(^[a-z A-Z]+$)')
                                      .hasMatch(value)) {
                                    return '         Please enter a valid relation';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (p0) {},
                                suffix: ''),
                          ],
                        ),
                      ),
                      h30,
                      CustomShadowButton(
                        onTap: commencontroller.isLoding.value
                            ? null
                            : () async {
                                commencontroller.isLoding.value = true;

                                await Future.delayed(
                                    const Duration(seconds: 1));

                                commencontroller.isLoding.value = false;

                                bool isValid = fomkey.currentState!.validate();
                                if (isValid) {
                                  FpsOwnerNameService.fpsOwnerName(
                                          fpsOwnerName: nameController.text,
                                          relation: relationController.text)
                                      .then((value) {
                                    if (value == 'success') {
                                      Get.offAll(ItemsListHome(),
                                          transition: Transition.noTransition,
                                          duration: const Duration(seconds: 1));
                                    }
                                  });
                                }
                              },
                        buttonColor: mainred,
                        width: double.infinity,
                        height: 40.h,
                        title: commencontroller.isLoding.value
                            ? const  CupertinoActivityIndicator(
                              animating: true,
                              color: yellow,
                              radius: 25,
                            )
                            : butenText(title: 'Submit', textColor: bg),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    top: 210.h,
                      child: SizedBox(
                    height: 15.h,
                    child: FlutterToggleTab(
                      width: 20.w,
                      borderRadius: 10.r,
                      selectedBackgroundColors: const [mainred, mainred],
                      selectedIndex:
                          qustionContoller.tabTextIndexSelected.value,
                      selectedTextStyle: const TextStyle(
                        color: bg,
                      ),
                      unSelectedTextStyle: const TextStyle(
                        color: grey,
                      ),
                      labels: qustionContoller.listTextTabToggle,
                      selectedLabelIndex: (index) {
                        qustionContoller.tabTextIndexSelected.value = index;
                      },
                    ),
                  ),),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
