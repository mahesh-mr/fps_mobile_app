// ignore_for_file: unrelated_type_equality_checks, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:fps/controller/controller/qustion_pagae_controller/qustion_controller.dart';
import 'package:fps/controller/service/dioclint/token/token.dart';
import 'package:fps/controller/service/qustion_air_service/qustion_air_service.dart';
import 'package:fps/model/balace_card_model.dart';
import 'package:fps/view/screens/camerScreen/camera_shop.dart';
import 'package:fps/view/screens/items_list/items_list.dart';
import 'package:fps/view/screens/balance_caards/rationcard.dart';
import 'package:fps/view/screens/widgets/custom_appbar.dart';
import 'package:fps/view/screens/qution_air/widgets/custom_radio/yes_or_no_button.dart';
import 'package:fps/view/screens/fps_owner_name/fps_owner_name.dart';
import 'package:fps/view/screens/widgets/double_tapp.dart';
import 'package:fps/view/screens/widgets/shadow_button.dart';
import 'package:fps/view/style/style.dart';
import 'package:fps/view/screens/sreen_survay/widgets/survey_back_button.dart';
import 'package:get/get.dart';

class QustionPage extends StatelessWidget {
  QustionPage({super.key});

  String? survayId = GetLocalStorage.getfpsId('sId');

  TextEditingController cardCounController = TextEditingController();

  List<TextEditingController> cardNumberControllerList = [];
  List<CardList> cardNumberList = [];

  int? cardCount;
  DateTime? lastpressed;
  @override
  Widget build(BuildContext context) {
    final qustionContoller = QustionController();
    return Scaffold(
      backgroundColor: bg,
      appBar: CustomAppbar(height: 190.h),
      body: DoubleTapBackPress(
        lastpressed: lastpressed,
        widget: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: qustionContoller.pagecontroller,
          onPageChanged: qustionContoller.selectedIndex,
          itemCount: qustionsList.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Obx(() {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${qustionsList[index].number}",
                            style: numbeText,
                          ),
                          Container(
                            // color: yellow,
                            width: 70.w,
                            height: 35.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                LinearProgressIndicator(
                                  backgroundColor: black,
                                  value: qustionsList[index].bar,
                                  color: yellow,
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  '${qustionsList[index].number}/28',
                                  style: const TextStyle(
                                      color: yellow,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            qustionContoller.selectedIndex != 0
                                ? ""
                                : qustionsList[index].headaLine!,
                            style: welcomeText,
                          ),
                          qustionContoller.selectedIndex == 0
                              ? h15
                              : const SizedBox(
                                  height: 0,
                                ),
                        ],
                      ),
                      Container(
                    // color: yellow,
                        height: 210.h,
                        width: 280.w,
                        child: Text(
                          qustionContoller.tabTextIndexSelected.value == 0
                              ? qustionsList[index].text
                              : englishQustion[index],
                          maxLines: 7,
                          textAlign: TextAlign.center,
                          style: normalText,
                        ),
                      ),
                      Container(
                      // color: red,
                        height: 70.h,
                        child: YesOrNoButton(qustionIdex: index),
                      ),
                     // h25,
                      CustomShadowButton(
                          onTap: () {
                            bool isNull =
                                qustionsList[index].isSelectedYes != null;
                            int qustionId = qustionsList[index].number;
                            int answer =
                                qustionsList[index].isSelectedYes! ? 1 : 0;
                            int qustionLength =
                                qustionContoller.selectedIndex.value;
                            if (isNull) {
                              if (qustionContoller.selectedIndex.value <= 25) {
                                QustionAairSservice.qustionAirServce(
                                        answer: answer,
                                        questionId: qustionId,
                                        surveyId: int.parse(survayId!))
                                    .then((value) {
                                  if (value == "success") {
                                    qustionsList[index].isSubmited = true;
                                    if (answer == 0) {
                                      if (qustionLength == 0) {
                                        Get.offAll(CameraShop1(),
                                            transition: Transition.noTransition,
                                            duration:
                                                const Duration(seconds: 1));
                                      } else {
                                        qustionContoller.forwerdPageJumb();
                                      }
                                    } else {
                                      // if(answer ==1) {
                                      //   if (qustionLength ==0||qustionLength ==1||qustionLength==17) {
                                      // return showDialog(context: context, builder: (context) {
                                      //   return Container(color: red,height: 200,width: 250,);
                                      // },);

                                      //   }

                                      qustionContoller.forwerdPageJumb();
                                    }
                                  }
                                });
                              } else if (qustionLength == 26) {
                                if (answer == 0) {
                                  Get.offAll(FpsOwnerName(),
                                      transition: Transition.noTransition,
                                      duration: const Duration(seconds: 1));
                                } else {
                                  Get.offAll(const RationCardNumbers(),
                                      transition: Transition.noTransition,
                                      duration: const Duration(seconds: 1));
                                  // Get.to(const RationCardNumbers());
                                }
                              }
                            }
                          },
                          buttonColor: mainred,
                          height: 40.h,
                          width: double.infinity,
                          title: butenText(
                            title: "SUBMIT",
                            textColor: qustionsList[index].isSubmited == false
                                ? bg
                                : white.withOpacity(.5),
                          )),
                      h30,
                      SizedBox(
                        height: 20.h,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SurvayBackButton(
                                bg: lightblack,
                                onPressed: () {
                                  ('asdfasdfasdfsf');
                                  qustionContoller.pagecontroller.previousPage(
                                    duration: 550.milliseconds,
                                    curve: Curves.ease,
                                  );
                                },
                                width: 60.w,
                                height: 20.h,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_back_ios,
                                      color: white,
                                      size: 10.sp,
                                    ),
                                    const Text(
                                      'Back',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: white),
                                    ),
                                  ],
                                )),
                            FlutterToggleTab(
                              width: 20.w,
                              borderRadius: 10.r,
                              selectedBackgroundColors: const [
                                mainred,
                                mainred
                              ],
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
                                qustionContoller.tabTextIndexSelected.value =
                                    index;
                              },
                            ),
                            SurvayBackButton(
                              bg: mainred,
                              onPressed: () {
                                qustionsList[index].isSubmited == false
                                    ? null
                                    : qustionContoller.pagecontroller.nextPage(
                                        duration: 550.milliseconds,
                                        curve: Curves.ease,
                                      );
                              },
                              width: 60.w,
                              height: 20.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Next',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: qustionsList[index].isSubmited ==
                                              false
                                          ? white.withOpacity(.5)
                                          : white,
                                    ),
                                  ),
                                  w5,
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color:
                                        qustionsList[index].isSubmited == false
                                            ? white.withOpacity(.5)
                                            : white,
                                    size: 10.sp,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              ),
            );
          },
        ),
      ),
    );
  }
}
