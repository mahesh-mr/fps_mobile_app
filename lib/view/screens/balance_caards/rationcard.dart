import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:fps/controller/controller/commen_controller/commen_controller.dart';
import 'package:fps/controller/controller/qustion_pagae_controller/qustion_controller.dart';
import 'package:fps/controller/controller/tost/tost.dart';
import 'package:fps/controller/service/dioclint/token/token.dart';
import 'package:fps/controller/service/qustion_air_service/dational_qustio_service/aditional_qustion_service.dart';
import 'package:fps/model/balace_card_model.dart';
import 'package:fps/view/screens/widgets/custom_appbar.dart';
import 'package:fps/view/screens/screen%20_login/widgets/custom_textform.dart';
import 'package:fps/view/screens/screen_home/stock_items.dart';
import 'package:fps/view/screens/fps_owner_name/fps_owner_name.dart';
import 'package:fps/view/screens/widgets/double_tapp.dart';
import 'package:fps/view/screens/widgets/shadow_button.dart';
import 'package:fps/view/style/style.dart';
import 'package:get/get.dart';

class RationCardNumbers extends StatefulWidget {
  const RationCardNumbers({super.key});

  @override
  State<RationCardNumbers> createState() => _RationCardNumbersState();
}

class _RationCardNumbersState extends State<RationCardNumbers> {
  TextEditingController cardCountController = TextEditingController();
  final commencontroller = Get.put(CommenController());
  final qustionContoller = QustionController();
  List<TextEditingController> cardNumberControllerList = [];
  List<CardList> cardNumberList = [];

  int? cardCount;
  String? survayId = GetLocalStorage.getfpsId('sId');
  final fomkey = GlobalKey<FormState>();
  List<GlobalKey> fomkeyList = [];
  bool isLoding = false;
  DateTime? lastpressed;
  @override
  Widget build(BuildContext context) {
    // List<Map<String, dynamic>> allCardList = cardNumberList
    //     .map((e) => {"card_no": e.cardNumbers, "survey_id": survayId})
    //     .toList();

    //  final qustionContoller = QustionController();
    return Scaffold(
      appBar: CustomAppbar(height: 220.h),
      body: DoubleTapBackPress(
        lastpressed: lastpressed,
        widget: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Obx(() {
              return Column(
                children: [
                  progressBarAndCount(),
                  h10,
                  qustion(),
                  Container(
                    //   color: green,
                    height: 240.h,
                    width: 280.w,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustoName(
                              name: 'Number of cards',
                              color: mainred,
                            ),
                             SizedBox(
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
                  ),
                          ],
                        ),
                        h10,
                        Form(
                          key: fomkey,
                          child: CustomFomField(
                              controller: cardCountController,
                              textinputType: TextInputType.number,
                              validator: (value) {
                                if (!RegExp(r'[0]').hasMatch(value)) {
                                  return "          Please enter a valid number";
                                } else if (value!.length <= 2) {
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (p0) {
                                setState(() {
                                  cardCount =
                                      int.parse(cardCountController.text);
                                  cardNumberControllerList = List.generate(
                                      cardCount!,
                                      (index) => TextEditingController());
                                  cardNumberList = List.generate(
                                      cardCount!, (index) => CardList());
                                });
                                print("$cardNumberList ==23");
                              },
                              maxline: 1,
                              titles: ""),
                        ),
                        h20,
                        LimitedBox(
                          maxHeight: 120.h,
                          child: cardCount == null
                              ? Container(
                                  // color: yellow,
                                  width: 300.w,
                                  height: 420.h,
                                  child: const Center(
                                    child: Text(
                                      "No cards  available",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: grey),
                                    ),
                                  ))
                              : ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: cardCount,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      //  color: blue,
                                      width: 280.w,
                                      height: 510.h,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Row(
                                              children: [
                                                CustoName(
                                                  name: 'Card Number',
                                                  color: mainred,
                                                ),
                                                Container(
                                                  // color: green,
                                                  width: 160.w,
                                                ),
                                                //   w210,
                                                //  Spacer(),
                                                Text(
                                                  "${index + 1}/$cardCount",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: mainred),
                                                ),
                                              ],
                                            ),
                                          ),
                                          h20,
                                          //  Form(key: fomkeyList[index],
                                          //  child:
                                          CustomFomField(
                                              controller:
                                                  cardNumberControllerList[
                                                      index],
                                              textinputType:
                                                  TextInputType.number,
                                              validator: (value) {
                                                String data = Get.snackbar(
                                                        'please', "message")
                                                    .toString();
                                                if (value!.length != 10) {
                                                  return data;
                                                  //"            Enter valid number";
                                                } else if (!RegExp(r'[0-9]')
                                                    .hasMatch(value)) {
                                                  return 'Please enter a valid number';
                                                } else {
                                                  return null;
                                                }
                                              },
                                              onChanged: (value) {
                                                setState(() {
                                                  cardNumberList[index]
                                                      .cardNumbers = value;
                                                });
                                              },
                                              maxline: 1,
                                              titles: ""),
                                          // ),
                                          h20,

                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: const [
                                                  Icon(
                                                    Icons.arrow_back_ios,
                                                    color: mainred,
                                                  ),
                                                  Text(
                                                    "swipe",
                                                    style:
                                                        TextStyle(color: grey),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: const [
                                                  Text(
                                                    "swipe",
                                                    style:
                                                        TextStyle(color: grey),
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: mainred,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                        )
                      ],
                    ),
                  ),
                  h10,
                  Obx(() {
                    return CustomShadowButton(
                      onTap: commencontroller.isLoding.value
                          ? null
                          : () async {
                              commencontroller.isLoding.value = true;

                              await Future.delayed(const Duration(seconds: 1));

                              commencontroller.isLoding.value = false;

                              print("$survayId======idf");
                              List<Map<String, dynamic>> allCardList =
                                  cardNumberList
                                      .map((e) => {
                                            "card_no": e.cardNumbers,
                                            "survey_id": survayId
                                          })
                                      .toList();
                              String? number;

                              if (cardCountController.text.isNotEmpty) {
                                for (var element in cardNumberList) {
                                  number = element.cardNumbers;
                                }
                                print(allCardList);

                                if (number != null) {
                                  RationCardNumbersService.balanceCard(
                                    params: allCardList,
                                  ).then((value) {
                                    if (value == 'success') {
                                      Get.offAll(FpsOwnerName(),
                                          transition: Transition.noTransition,
                                          duration: const Duration(seconds: 1));
                                    } else {
                                      print('no data');
                                      Get.snackbar("Warning",
                                          "Please fill the all feilds",
                                          backgroundColor: yellow);
                                    }
                                  });
                                } else {
                                  TostClass.warningTost(context);
                                  // Get.snackbar(
                                  //         "Warning", "Please fill the all feilds",
                                  //         backgroundColor: yellow);
                                  //  }

                                }

                                /// for (var element in cardNumberList) {

                                // }

                              } else {
                                TostClass.warningTost(context);
                              }

                              // for (var element in cardNumberList) {
                              //   var list1 = element.cardNumbers;
                              //   print(list1);
                              //   print("${allCardList}===1");
                              //   print("${cardNumberList}===2");
                              // }
                              // Get.to(ItemsListHome());
                            },
                      buttonColor: mainred,
                      height: 40.h,
                      width: double.infinity,
                      title: commencontroller.isLoding.value
                          ? const CupertinoActivityIndicator(
                              animating: true,
                              color: yellow,
                              radius: 25,
                            )
                          : butenText(title: 'Submit', textColor: bg),
                    );
                  }),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Container qustion() {
    return Container(
      height: 70.h,
      width: double.infinity,
      //color: yellow,
      child: Text(
        qustionContoller.tabTextIndexSelected.value == 1
            ? 'If so how many cards? (enter card numbers)'
            : "ഉണ്ടെങ്കിൽ എത്ര കാർഡുകൾ ? ( കാർഡ് നമ്പരുകൾ രേഖപ്പെടുത്തുക )",
        // qustionsList[24].text,
        maxLines: 7,
        textAlign: TextAlign.center,
        style: normalText,
      ),
    );
  }

  Row progressBarAndCount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '28',
          style: numbeText,
        ),
        SizedBox(
          width: 70.w,
          height: 50.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LinearProgressIndicator(
                backgroundColor: black,
                value: 25,
                color: yellow,
              ),
              SizedBox(
                height: 3.h,
              ),
              const Text(
                '28/28',
                style: TextStyle(color: yellow, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }
}
