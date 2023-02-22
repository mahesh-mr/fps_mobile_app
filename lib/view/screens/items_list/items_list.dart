import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fps/controller/controller/itemscontroller/itemes_controller.dart';
import 'package:fps/controller/controller/tost/tost.dart';
import 'package:fps/controller/service/dioclint/token/token.dart';
import 'package:fps/controller/service/stock_details/stock_details.dart';
import 'package:fps/view/screens/camerScreen/camera_shop.dart';
import 'package:fps/view/screens/camerScreen/camera_signature.dart';
import 'package:fps/view/screens/items_list/other_items/other_items.dart';
import 'package:fps/view/screens/items_list/widgets/itemforms/items_forms.dart';
import 'package:fps/view/screens/widgets/custom_appbar.dart';
import 'package:fps/view/screens/sreen_survay/widgets/survey_back_button.dart';
import 'package:fps/view/screens/sreen_survay/widgets/survey_form_wiidget.dart';
import 'package:fps/view/screens/widgets/double_tapp.dart';
import 'package:fps/view/screens/widgets/shadow_button.dart';
import 'package:fps/view/screens/witness_screen/withness_1_screen.dart';
import 'package:fps/view/style/style.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ItemsListHome extends StatelessWidget {
  ItemsListHome({
    super.key,
  });
  final pageController = PageController();
  final itemStorage = GetStorage();
  String? survayId = GetLocalStorage.getfpsId('sId');
  DateTime? lastpressed;
  @override
  Widget build(BuildContext context) {
    final itemController = Get.put(ItemController());
    return Scaffold(
      backgroundColor: bg,
      appBar: CustomAppbar(height: 210.h),
      body: DoubleTapBackPress(
        lastpressed: lastpressed,
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // const Text(
            //   'Stock level at the time of inspection (kg)',
            //   style: TextStyle(
            //       fontWeight: FontWeight.w500, color: mainred, fontSize: 17),
            // ),
            // h10,
            Expanded(
              child: Obx(() {
                if (itemController.loding.value) {
                  return const Center(
                      child: CupertinoActivityIndicator(
                    animating: true,
                    color: yellow,
                    radius: 25,
                  ));
                }
                return PageView.builder(
                  controller: itemController.pagecontroller,
                  onPageChanged: itemController.selectedIndex,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: itemController.getItemModel.length,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.w),
                        child: Column(
                          children: [
                            Text(
                              itemController.getItemModel[index].name!,
                              style: fontZ_30_black,
                            ),
                            h10,
                            Container(
                              height: 370,
                              child: ItemForm(index: index),
                            ),
                            CustomShadowButton(
                                onTap: () {
                                  print(
                                      "${itemStorage.read('StockInEpos')}===qty");
                                  if (itemStorage.read('StockInEpos') !=
                                      null || itemStorage.read('Badstock') !=null||itemStorage.read('goodStock')!=null||  itemStorage.read('calculation')!=null) {
                                    StockDetaisSercive.stockItemService(
                                           
                                            survayId: survayId!,
                                            itemId: itemController
                                                .getItemModel[index].id
                                                .toString(),
                                            assignedQuandity: itemStorage
                                                .read('StockInEpos'),
                                            physicalStock: itemStorage
                                                .read('goodStock'), badsStock:
                                                itemStorage.read('Badstock'),
                                            diffrence: itemStorage
                                                .read('calculation')
                                                .toString())
                                        .then((value) {
                                      if (value == "success") {
                                        itemStorage.remove('StockInEpos');
                                        itemStorage.remove('goodStock');
                                        itemStorage.remove('calculation');
                                        itemStorage.remove('Badstock');
                                        if (itemController
                                                .getItemModel[index].id ==
                                            7) {
                                          Get.offAll(OtherItemsList(),
                                              transition:
                                                  Transition.noTransition,
                                              duration:
                                                  const Duration(seconds: 1));
                                        } else {
                                          itemController.forwerdPageJumb();
                                        }
                                      } else {
                                        TostClass.warningTost(context);
                                      }
                                    });
                                    // }
                                    print(
                                        "${itemController.getItemModel.length}==");
                                  } else {
                                    TostClass.warningTost(context);
                                  }
                                },
                                buttonColor: mainred,
                                height: 40.h,
                                width: double.infinity,
                                title:
                                    butenText(title: "SUBMIT", textColor: bg)),
                            h20,
                            SizedBox(
                              height: 20.h,
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SurvayBackButton(
                                      bg: lightblack,
                                      onPressed: () {
                                        itemController.pagecontroller
                                            .previousPage(
                                          duration: 550.milliseconds,
                                          curve: Curves.ease,
                                        );
                                      },
                                      width: 60.w,
                                      height: 20.h,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                  SurvayBackButton(
                                    bg: mainred,
                                    onPressed: () {
                                      // qustionsList[index].isSubmited == false
                                      //     ? null
                                      //:
                                      itemController.pagecontroller.nextPage(
                                        duration: 550.milliseconds,
                                        curve: Curves.ease,
                                      );
                                    },
                                    width: 60.w,
                                    height: 20.h,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Next',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color:
                                                //  qustionsList[index].isSubmited == false
                                                //     ? white.withOpacity(.5)
                                                //     :
                                                white,
                                          ),
                                        ),
                                        w5,
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color:
                                              // qustionsList[index].isSubmited == false
                                              //     ? white.withOpacity(.5)
                                              //     :
                                              white,
                                          size: 10.sp,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // SizedBox(
                            //   height: 20.h,
                            //   width: double.infinity,
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       SurvayBackButton(
                            //           width: 60.w,
                            //           height: 20.h,
                            //           child: Row(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.center,
                            //             children: [
                            //               Icon(
                            //                 Icons.arrow_back_ios,
                            //                 color: white,
                            //                 size: 10.sp,
                            //               ),
                            //               Text(
                            //                 'Back',
                            //                 style: TextStyle(
                            //                     fontWeight: FontWeight.w400,
                            //                     color: white),
                            //               ),
                            //             ],
                            //           ),
                            //           onPressed: () {
                            //             itemController.pagecontroller
                            //                 .previousPage(
                            //               duration: 550.milliseconds,
                            //               curve: Curves.ease,
                            //             );
                            //           },
                            //           bg: lightblack),

                            //       // ElevatedButton(
                            //       //   style: ElevatedButton.styleFrom(
                            //       //     backgroundColor: lightblack,
                            //       //     minimumSize: Size(60.w, 20.h),
                            //       //     shape: RoundedRectangleBorder(
                            //       //       borderRadius: BorderRadius.circular(20.r),
                            //       //     ),
                            //       //   ),
                            //       //   onPressed: () {
                            //       //     itemController.pagecontroller.previousPage(
                            //       //       duration: 550.milliseconds,
                            //       //       curve: Curves.ease,
                            //       //     );
                            //       //   },
                            //       //   child: Wrap(
                            //       //     children: [
                            //       //       Icon(
                            //       //         Icons.arrow_back_ios,
                            //       //         color: white,
                            //       //         size: 10.sp,
                            //       //       ),
                            //       //       Text(
                            //       //         'Back',
                            //       //         style: TextStyle(fontSize: 10.sp),
                            //       //       ),
                            //       //     ],
                            //       //   ),
                            //       // ),
                            //       SurvayBackButton(
                            //         bg: mainred,
                            //         onPressed: () {
                            //           // print("${itemStorage.read(
                            //           //   'assignedquantity',
                            //           // )}====1");
                            //           // print("${itemStorage.read(
                            //           //   'physicalstock',
                            //           // )}====1");
                            //           // print("${itemStorage.read(
                            //           //   'calculation',
                            //           // )}====1");

                            //         },
                            //         width: 60.w,
                            //         height: 20.h,
                            //         child: Row(
                            //           mainAxisAlignment: MainAxisAlignment.center,
                            //           children: [
                            //             Text('Next',
                            //                 style: TextStyle(
                            //                     fontWeight: FontWeight.w400,
                            //                     color: white)),
                            //             w5,
                            //             Icon(
                            //               Icons.arrow_forward_ios,
                            //               color: white,
                            //               size: 10.sp,
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //       // ElevatedButton(
                            //       //   style: ElevatedButton.styleFrom(
                            //       //     backgroundColor: mainred,
                            //       //     minimumSize: Size(60.w, 20.h),
                            //       //     shape: RoundedRectangleBorder(
                            //       //       borderRadius: BorderRadius.circular(20.r),
                            //       //     ),
                            //       //   ),
                            //       //   onPressed: () {
                            //       //     itemController.pagecontroller.nextPage(
                            //       //       duration: 550.milliseconds,
                            //       //       curve: Curves.ease,
                            //       //     );
                            //       //   },
                            //       //   child: Wrap(
                            //       //     children: [
                            //       //       Text(
                            //       //         'Next',
                            //       //         style: TextStyle(fontSize: 10.sp),
                            //       //       ),
                            //       //       Icon(
                            //       //         Icons.arrow_forward_ios,
                            //       //         color: white,
                            //       //         size: 10.sp,
                            //       //       ),
                            //       //     ],
                            //       //   ),
                            //       // ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
