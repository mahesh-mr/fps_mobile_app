import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fps/controller/controller/confirm_owner_controller/confirm_owner_controller.dart';
import 'package:fps/view/screens/qution_air/page_view.dart';
import 'package:fps/view/screens/widgets/custom_appbar.dart';
import 'package:fps/view/screens/widgets/double_tapp.dart';
import 'package:fps/view/screens/widgets/popup_menu/popup_menu.dart';
import 'package:fps/view/screens/widgets/shadow_button.dart';
import 'package:fps/view/style/style.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ConformDetails extends StatefulWidget {
  ConformDetails({super.key});

  @override
  State<ConformDetails> createState() => _ConformDetailsState();
}

class _ConformDetailsState extends State<ConformDetails> {
  // final storageController = Get.put(GetLocalStorage());
  // String? fpsNo = GetLocalStorage.getfpsId('fps_no');

  // final survayData = GetStorage();

  // String? userId = GetLocalStorage.getUserIdAndToken('id');
  DateTime? lastpressed;
  @override
  Widget build(BuildContext context) {
    final confirmcontroller = Get.put(ConfirmController());

    return Scaffold(
      backgroundColor: bg,
      appBar: CustomAppbarProfile(height: 170.h, widget: Popups(color: bg)),
      body: DoubleTapBackPress(
        lastpressed: lastpressed,
        widget: Obx(() {
          if (confirmcontroller.loding.value) {
            return const Center(
              child: CupertinoActivityIndicator(
                animating: true,
                color: yellow,
                radius: 25,
              ),
            );
          }
          return Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child:
                  // Obx(() {
                  //   if (confirmcontroller.loding.value) {
                  //     return const Center(
                  //       child: CircularProgressIndicator(),
                  //     );
                  //   }
                  //   return
                  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClayContainer(
                    color: white,
                    borderRadius: 20.r,
                    depth: 40,
                    parentColor: white,
                    spread: 2,
                    child: Container(
                      height: 350.w,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: white,
                          border: Border.all(color: lightgrey)),
                      child: Padding(
                          padding: EdgeInsets.only(top: 15.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Container(
                                  height: 250.h, width: 120.w, //color: red,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      confirmText("FPS Number", 15.sp, 1),
                                      h25,
                                      Container(
                                          height: 30.h,
                                          width: 120,
                                          child: confirmText(
                                              "Licensee Name", 15.sp, 1)),
                                      h25,
                                      confirmText("Licensee Contact", 15.sp, 1),
                                      h25,
                                      confirmText("Licensee Address", 15.sp, 1),
                                    ],
                                  ),
                                ),
                              ),
                              w5,
                              Container(
                                height: 250.h, width: 10.w, //color: red,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    confirmText(":", 15.sp, 1),
                                    h25,
                                    Container(
                                        height: 30.h,
                                        width: 120,
                                        child: confirmText(":", 15.sp, 1)),
                                    h25,
                                    confirmText(":", 15.sp, 1),
                                    h25,
                                    confirmText(":", 15.sp, 1),
                                  ],
                                ),
                              ),
                              w5,
                              Container(
                                height: 250.h, width: 120.w, //color: red,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    confirmText(
                                        confirmcontroller
                                            .confirmModel!.data!.fpsNo
                                            .toString(),
                                        15.sp,
                                        1),
                                    h25,
                                    Container(
                                      height: 30.h,
                                      width: 120,
                                      child: confirmText(
                                          confirmcontroller
                                              .confirmModel!.data!.licenseeName
                                              .toString(),
                                          15.sp,
                                          2),
                                    ),
                                    h25,
                                    confirmText(
                                        confirmcontroller
                                            .confirmModel!.data!.phoneNo
                                            .toString(),
                                        15.sp,
                                        1),
                                    h25,
                                    Container(
                                        height: 100.h,
                                        width: 116.w,
                                        //color: yellow,

                                        child: confirmText(
                                            confirmcontroller
                                                .confirmModel!.data!.address!,
                                            15.sp,
                                            5)),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                  h50,

                  CustomShadowButton(
                    onTap:
                        // isLoding
                        // ? null
                        // :
                        () {
                      // setState(() {
                      //   isLoding = true;
                      // });
                      // await Future.delayed(Duration(milliseconds: 30));

                      // setState(() {
                      //   isLoding = false;
                      // });

                      // var dateFormat = DateFormat("yyyy-MM-dd hh:mm:ss")
                      //     .format(positionController
                      //         .lastInspectonDates.value)
                      //     .toString();
                      // String dates = DateFormat("yyyy-MM-dd hh:mm:ss")
                      //     .format(homecontroller.selectedDate.value)
                      //     .toString();

                      // print(
                      //     "${survayData.read('districtValue')} ===disVAL");
                      // print(
                      //     "${survayData.read('talukvalues')} ===talVAL");
                      // print(
                      //     "${survayData.read('firkaValue')} ===firVAL");
                      // print(
                      //     "${survayData.read('positionValue')} ===positionValue");

                      // StartSurvay.startSuvey(
                      //         district:
                      //             survayData.read('districtValue'),
                      //         // homecontroller.districtValue.toString(),
                      //         taluk: survayData.read(
                      //             'talukvalues'), //homecontroller.talukvalues.toString(),
                      //         firka: survayData.read('firkaValue'),
                      //         // homecontroller.firkaValue.toString(),
                      //         inspection_date: dates,
                      //         user_id: userId!,
                      //         fps_no: survayData.read('fpsNo'),
                      //         //   survayData.read('fpsNo'),
                      //         previous_inspector_name:
                      //             survayData.read('pName'),
                      //         last_inspection_date: dateFormat,
                      //         previous_inspector_position:
                      //             survayData.read('positionValue'),
                      //         context: context)
                      //     .then((value) {
                      //   if (value == "success") {
                      //     print("${survayData.read('pName')}==name");
                      //     print("${userId}==uid");
                      //     print("${dates}==tal");
                      //     print("${dateFormat}==tal");

                      //     // print( "${survayData.read('fpsNo')}==fpsNo");
                      //     print(survayData.read('pName'));
                      //     String? name;
                      //     String? role;
                      //     String? survayId =
                      //         GetLocalStorage.getfpsId('sId');
                      //     //    String? fpsNo = GetLocalStorage.getfpsId('fps_no');

                      //     List list = [];
                      //     List<dynamic>? inspecters =
                      //         survayData.read('inspectersList');
                      //     //     var data = inspecters == null ? list : inspecters;
                      //     var data = inspecters ?? list;
                      //     for (var element in data) {
                      //       name = element.name;
                      //       role = element.role_id;
                      //     }

                      //     if (name != null && role != null) {
                      //       List<Map<String, dynamic>>
                      //           acompampanaidList = data
                      //               .map((e) => {
                      //                     "name": e.name,
                      //                     "role_id": e.role_id,
                      //                     "survey_id": survayId
                      //                   })
                      //               .toList();
                      //       print(inspecters);
                      //       print(
                      //           "${acompampanaidList}=====================");
                      //       AccompaniedSurvey.accompaniedSurvice(
                      //               params: acompampanaidList)
                      //           .then(
                      //         (value) {
                      //           if (value == 'success') {
                      //             Get.to(QustionPage());

                      //             survayData.remove('inspectersList');
                      //           } else {
                      //             TostClass.warningTost(context);
                      //           }
                      //         },
                      //       );
                      //     } else {
                      //       print("no accompaned ====");
                      //       Get.to(QustionPage());
                      //       survayData.remove('inspectersList');

                      //       survayData.remove('pName');
                      //     }
                      //   }
                      // });
                      Get.offAll(QustionPage(),
                          transition: Transition.noTransition,
                          duration: const Duration(seconds: 1));
                    },
                    buttonColor: mainred,
                    width: double.infinity,
                    height: 40.h,
                    title:
                        //  isLoding
                        //     ? CircularProgressIndicator(
                        //
                        //       )
                        //     :
                        butenText(
                      title: "CONFIRM",
                      textColor: bg,
                    ),
                  ),
                  //   ],
                  // )
                ],
              )
              //  }),
              );
        }),
      ),
    );
    //   }
    // );
  }

  Widget confirmText(String title, double size, int maxline) {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.w600, color: lightblack, fontSize: size),
      maxLines: maxline,
    );
  }
}
// QustionPage()
