import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fps/controller/service/dioclint/token/token.dart';
import 'package:fps/controller/service/witness_service/witness_service.dart';
import 'package:fps/view/screens/camerScreen/camera_signature.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fps/view/screens/sreen_survay/widgets/survey_form_wiidget.dart';
import 'package:fps/view/screens/widgets/double_tapp.dart';
import 'package:fps/view/screens/widgets/shadow_button.dart';
import 'package:fps/view/screens/witness_screen/witness_appbar.dart';
import 'package:fps/view/style/style.dart';
import 'package:get/get.dart';

class WitnessScreen2 extends StatelessWidget {
  WitnessScreen2({super.key});

  final nameController = TextEditingController();
  final cardNumberController = TextEditingController();
  final phoneController = TextEditingController();
  final positionController = TextEditingController();
  final fomkey = GlobalKey<FormState>();
  String? survayId = GetLocalStorage.getfpsId('sId');
  DateTime? lastpressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: WitnessAppbar(
          text: 'Witness 2',
          subText: '(Particulars of 2 witnesses to be furnished)'),
       body: DoubleTapBackPress(lastpressed: lastpressed, widget: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Column(
              children: [
                Form(
                  key: fomkey,
                  child: Column(
                    children: [
                      h40,
                      CustomSurveyTextForm(
                        suffix: "",
                        onChanged: (p0) {},
                        controller: nameController,
                        textinputType: TextInputType.text,
                        title: "Name",
                        validator: (value) {},
                      ),
                      h15,
                      CustomSurveyTextForm(
                        validator: (value) {
                          if (value!.length != 10) {
                            return "         Enter 10 digit Card number";
                          } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                            return '         Please enter a valid fps number';
                          } else {
                            return null;
                          }
                        },
                        suffix: "",
                        onChanged: (p0) {},
                        controller: cardNumberController,
                        textinputType: TextInputType.number,
                        title: "Card No",
                      ),
                      h15,
                      CustomSurveyTextForm(
                        suffix: "",
                        onChanged: (p0) {},
                        controller: phoneController,
                        textinputType: TextInputType.number,
                        title: "Phone No",
                        validator: (value) {
                          if (value!.length >= 13) {
                            return "         Enter valid number";
                          } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                            return '         Please enter a valid number';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                h50,
                Row(
                  children: [
                    CustomShadowButton(
                      buttonColor: mainred,
                      height: 40.h,
                      width: 160,
                      title: butenText(title: 'SUBMIT', textColor: bg),
                      onTap: () {
                        bool isValid = fomkey.currentState!.validate();
      
                        if (isValid) {
                          WitnessService.witnessService(
                                  name: nameController.text,
                                  cardNo: cardNumberController.text,
                                  survayId: survayId!,
                                  number: phoneController.text)
                              .then((value) {
                            if (value == "success") {
                              Get.to(CameraSignature());
                            }
                          });
                        }
                        // Navigator.push(
                        //   context,
                        //   CupertinoPageRoute(
                        //     builder: (context) => WitnessScreen2(),
                        //   ),
                        // );
                      },
                    ),
                    w30,
                    CustomShadowButton(
                      buttonColor: mainred,
                      height: 40.h,
                      width: 100,
                      title: butenText(title: 'SKIP', textColor: bg),
                      onTap: () {
                        // bool isValid = fomkey.currentState!.validate();
      
                        WitnessService.witnessService(
                                name: nameController.text.isEmpty
                                    ? ""
                                    : nameController.text,
                                cardNo: cardNumberController.text.isEmpty
                                    ? ""
                                    : cardNumberController.text,
                                survayId: survayId!,
                                number: phoneController.text.isEmpty
                                    ? ""
                                    : phoneController.text)
                            .then((value) {
                          if (value == "success") {
                            Get.offAll(CameraSignature());
                          }
                        });
      
                        // Navigator.push(
                        //   context,
                        //   CupertinoPageRoute(
                        //     builder: (context) => WitnessScreen2(),
                        //   ),
                        // );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
