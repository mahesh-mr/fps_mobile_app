import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fps/controller/controller/controller.dart';
import 'package:fps/controller/controller/qustion_pagae_controller/qustion_controller.dart';
import 'package:fps/controller/service/remark_service/remark_service.dart';
import 'package:fps/model/qustion_model.dart';
import 'package:fps/view/screens/camerScreen/camera_shop.dart';
import 'package:fps/view/screens/screen%20_login/widgets/custom_textform.dart';
import 'package:fps/view/screens/widgets/shadow_button.dart';

import 'package:fps/view/style/style.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class YesOrNoButton extends StatefulWidget {
  YesOrNoButton({super.key, required this.qustionIdex});
  int qustionIdex;

  @override
  State<YesOrNoButton> createState() => _YesOrNoButtonState();
}

class _YesOrNoButtonState extends State<YesOrNoButton> {
  // String initialIndex = '';
  final qustionController = Get.put(QustionController());
  final remarkController = TextEditingController();
  final riceControler = TextEditingController();
  final wheatController = TextEditingController();
  final attaController = TextEditingController();
  final keroseneController = TextEditingController();
  final otherItemController = TextEditingController();
  final remarkstore = GetStorage();

  @override
  Widget build(BuildContext context) {
    // riceControler.text='0';
    //  wheatController.text='0';
    //  attaController.text='0';
    //   keroseneController.text='0';
    //   otherItemController.text='0';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 120,
        width: 170,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customButton("YES", context),
            h5,
            customButton("NO", context),
          ],
        ),
      ),
    );
  }
  //====================================================

  Widget customButton(String text, BuildContext context) {
    bool? isSelectedYes = qustionsList[widget.qustionIdex].isSelectedYes;
    Color buttonColor = white;
    Color textColor = grey;

    if (text == "YES" && isSelectedYes != null && isSelectedYes ||
        text == "NO" && isSelectedYes != null && !isSelectedYes) {
      buttonColor = mainred;
      textColor = white;
    }

    //  return GetBuilder<QustionController>(builder: (controller) {
    return InkWell(
      splashColor: yellow,
      onTap: () {
        int qustionLength = qustionsList[widget.qustionIdex].number;

        setState(() {
          if (text == 'YES') {
            if (qustionLength == 15 ||
                qustionLength == 18 ||
                qustionLength == 23) {
              qustionLength == 23
                  ? showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: Colors.transparent,
                          insetPadding: EdgeInsets.all(10.w),
                          child: Container(
                            width: double.infinity,
                            height: 450.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: bg),
                            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                            child: Column(
                              children: [
                                Text("Enter the Quantity",
                                    style: TextStyle(fontSize: 24.sp),
                                    textAlign: TextAlign.center),
                                h10,
                                showDialogForm(
                                    textinputType: TextInputType.number,
                                    controller: riceControler,
                                    text: 'Rice - (in kg)'),
                                h10,
                                showDialogForm(
                                    textinputType: TextInputType.number,
                                    controller: wheatController,
                                    text: 'Wheat - (in kg)'),
                                h10,
                                showDialogForm(
                                    textinputType: TextInputType.number,
                                    controller: attaController,
                                    text: 'Atta - (in kg)'),
                                h10,
                                showDialogForm(
                                    textinputType: TextInputType.number,
                                    controller: keroseneController,
                                    text: 'Kerosene - (in ltr)'),
                                h10,
                                showDialogForm(
                                    textinputType: TextInputType.text,
                                    controller: otherItemController,
                                    text: 'Other Items - (in kg)'),
                                h40,
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: mainred,
                                      foregroundColor: bg,
                                      shadowColor: grey,
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0.r)),
                                      minimumSize: Size(150.w, 30.h),
                                    ),
                                    onPressed: () {
                                      String? rice =
                                          "Rice -(in kg) ${riceControler.text}/kg";
                                      String? wheat =
                                          "Wheat -(in kg) ${wheatController.text}/kg";
                                      String? atta =
                                          "Atta -(in kg) ${attaController.text}/kg";
                                      String? kerosene =
                                          "Kerosene -(in kg) ${keroseneController.text}/kg";
                                      String? other =
                                          "Other -(in kg) ${otherItemController.text}/kg";

                                      print(rice);
                                      print(wheat);
                                      print(atta);
                                      print(kerosene);
                                      print(other);

                                      String? rice1 =
                                          riceControler.text.isNotEmpty
                                              ? rice
                                              : '';
                                      String? wheat1 =
                                          wheatController.text.isNotEmpty
                                              ? wheat
                                              : '';
                                      String? atta1 =
                                          attaController.text.isNotEmpty
                                              ? atta
                                              : '';
                                      String? kerosene1 =
                                          keroseneController.text.isNotEmpty
                                              ? kerosene
                                              : '';
                                      String? other1 =
                                          otherItemController.text.isNotEmpty
                                              ? other
                                              : '';

                                      print(
                                          "$rice1   $wheat1  $atta1  $kerosene1  $other1 ");
                                      String output =
                                          "$rice1   $wheat1  $atta1  $kerosene1  $other1";

                                      // String datas =output.isEmpty?"":output;
                                      // print("$datas ==.........");
                                      if (qustionLength == 23) {
                                        RemarkService.addRemarkService(
                                                remark23: output,
                                                remark3: '',
                                                remarks11: "",
                                                remarks15: "",
                                                remarks18: '')
                                            .then((value) {
                                          if (value == "success") {
                                            riceControler.clear();
                                            wheatController.clear();
                                            attaController.clear();
                                            keroseneController.clear();
                                            otherItemController.clear();

                                            print('q 18');

                                            Get.back();
                                          }
                                        });
                                      }
                                    },
                                    child: const Text('Submit')),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : showDialogWidgets(
                      context: context,
                      controller: remarkController,
                      onChanged: (value) {},
                      ontap: () {
                        if (qustionLength == 15) {
                          RemarkService.addRemarkService(
                                  remark23: '',
                                  remark3: '',
                                  remarks11: "",
                                  remarks15: remarkController.text.isEmpty
                                      ? ""
                                      : remarkController.text,
                                  remarks18: '')
                              .then((value) {
                            if (value == "success") {
                              print('q 15');
                              print('${remarkController.text}==15');
                              Get.back();
                            }
                          });
                          ;
                        } else if (qustionLength == 18) {
                          RemarkService.addRemarkService(
                                  remark23: '',
                                  remark3: '',
                                  remarks11: "",
                                  remarks15: "",
                                  remarks18: remarkController.text.isEmpty
                                      ? ""
                                      : remarkController.text)
                              .then((value) {
                            if (value == "success") {
                              print('q 18');
                              print('${remarkController.text}==18');

                              Get.back();
                            }
                          });
                        }
                      },
                    );
            }
            print("${qustionsList[widget.qustionIdex].number}===length");

            qustionsList[widget.qustionIdex].isSelectedYes = true;
          } else {
            if (qustionLength == 3 ||
                qustionLength == 2 ||
                qustionLength == 11) {
              qustionLength == 2
                  ? showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                              "Do you want to continue the inspection?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Yes",
                                style: TextStyle(
                                  color: green,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.offAll(CameraShop1(),
                                    transition: Transition.noTransition,
                                    duration: const Duration(seconds: 1));
                              },
                              child: const Text(
                                "No",
                                style: TextStyle(
                                  color: red,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  : showDialogWidgets(
                      context: context,
                      controller: remarkController,
                      onChanged: (value) {},
                      ontap: () {
                        if (qustionLength == 3) {
                          RemarkService.addRemarkService(
                                  remark3: remarkController.text.isEmpty
                                      ? ""
                                      : remarkController.text,
                                  remarks11: "",
                                  remarks15: '',
                                  remarks18: '',
                                  remark23: '')
                              .then((value) {
                            if (value == "success") {
                              print('q 11');
                              print('${remarkController.text}==11');
                              Get.back();
                            }
                          });
                        } else if (qustionLength == 11) {
                          RemarkService.addRemarkService(
                                  remark3: "",
                                  remarks11: remarkController.text.isEmpty
                                      ? ""
                                      : remarkController.text,
                                  remarks15: '',
                                  remarks18: '',
                                  remark23: '')
                              .then((value) {
                            if (value == "success") {
                              print('q 11');
                              print('${remarkController.text}==11');
                              Get.back();
                            }
                          });
                        }
                      });
            }
            qustionsList[widget.qustionIdex].isSelectedYes = false;
          }
          print(qustionsList[widget.qustionIdex].isSelectedYes);
        });
      },
      child: Container(
        height: 40,
        width: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: buttonColor,
            boxShadow: const [
              BoxShadow(
                color: grey,
                offset: Offset(4, 4),
                blurRadius: 2,
                spreadRadius: 1,
              ),
              BoxShadow(
                color: white,
                offset: Offset(-4, -4),
                blurRadius: 2,
                spreadRadius: 1,
              ),
            ]),
        alignment: Alignment.center,
        margin: const EdgeInsets.all(2.0),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
    //  });
  }

  ClayContainer remarkForm() {
    return ClayContainer(
      color: white,
      borderRadius: 20.r,
      depth: 40,
      parentColor: white,
      spread: 2,
      child: TextFormField(
        onChanged: (value) {},
        maxLines: 10,
        controller: remarkController,
        validator: (value) {
          remarkstore.write('remarkController', remarkController.text);
          remarkstore.read('remarkController');
          // if (value!.length == 0) {
          //   return "      length shuld be 1 chareter";
          // }
        },
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.w),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: const BorderSide(color: black)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: const BorderSide(color: black),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: const BorderSide(color: red),
          ),
          hintText: '',
          fillColor: white,
          focusColor: white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
      ),
    );
  }
}

showDialogWidgets({
  required BuildContext context,
  required final TextEditingController controller,
  required final Function(String)? onChanged,
  required final VoidCallback ontap,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: bg,
        insetPadding: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
        title: Text(
          'Leave your comments below',
          style: fontZ_14_Grey,
        ),
        content: ClayContainer(
          color: white,
          borderRadius: 20.r,
          depth: 40,
          parentColor: white,
          spread: 2,
          child: TextFormField(
            onChanged: onChanged,
            maxLines: 10,
            controller: controller,
            validator: (value) {
              // if (value!.length == 0) {
              //   return "      length shuld be 1 chareter";
              // }
            },
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.w),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: const BorderSide(color: black)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: const BorderSide(color: black),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: const BorderSide(color: red),
              ),
              hintText: '',
              fillColor: white,
              focusColor: white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(20.0.r),
            child: CustomShadowButton(
                onTap: ontap,
                buttonColor: mainred,
                height: 30.h,
                width: double.infinity,
                title: butenText(title: 'Submit', textColor: bg)),
          )
        ],
      );
    },
  );
}

showDialogForm(
    {required final TextEditingController controller,
    required final text,
    required final TextInputType textinputType}) {
  return Row(
    children: [
      SizedBox(
        width: 150.w,
        child: Text(
          text,
          style: fontZ_14_Grey,
        ),
      ),
      w15,
      Expanded(
          child: TextFormField(
        keyboardType: textinputType,
        controller: controller,
        decoration: const InputDecoration(hintText: '0'),
      ))
    ],
  );
}
