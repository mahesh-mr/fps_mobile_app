// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fps/view/screens/sreen_survay/widgets/survey_form_wiidget.dart';
import 'package:fps/view/screens/widgets/shadow_button.dart';
import 'package:fps/view/style/style.dart';
import 'package:get/get.dart';

class CustomBackForword extends StatelessWidget {
  CustomBackForword(
      {super.key,
      required this.onpressed,
      required this.itemName,
      required this.controllerDepostit,
      required this.controllerDiffrence,
      required this.controllerPhysical,
      required this.validatorDepostit,
      required this.validatorDiffrence,
      required this.validatorPhysical});
  final TextEditingController controllerDepostit;
  final FormFieldValidator validatorDepostit;
  final TextEditingController controllerPhysical;
  final FormFieldValidator validatorPhysical;
  final TextEditingController controllerDiffrence;
  final FormFieldValidator validatorDiffrence;

  final VoidCallback onpressed;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          itemName,
          style: fontZ_30_black,
        ),
        h20,
        CustomSurveyTextForm(
          suffix: "",
           onChanged: (p0) {
              
            },
          controller: controllerDepostit,
          textinputType: TextInputType.text,
          title: "Deposit in e-POS machine",
          validator: validatorDepostit,
        ),
        CustomSurveyTextForm(  suffix: "",
           onChanged: (p0) {
              
            },
          controller: controllerPhysical,
          textinputType: TextInputType.text,
          title: "Physical stock",
          validator: validatorPhysical,
        ),
        CustomSurveyTextForm(  suffix: "",
           onChanged: (p0) {
              
            },
          controller: controllerDiffrence,
          textinputType: TextInputType.text,
          title: "Difference",
          validator: validatorDiffrence,
        ),
        h30,
        CustomShadowButton(  onTap: () {},
            buttonColor: mainred,
            height: 40.h,
        
            width: double.infinity,
            title:butenText(title: "SUBMIT", textColor: bg) ),
       
        h50,
        SizedBox(
          height: 20.h,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: lightblack,
                  minimumSize: Size(60.w, 20.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                onPressed: () {
                  Get.back();
                },
                child: Wrap(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: white,
                      size: 10.sp,
                    ),
                    Text(
                      'Back',
                      style: TextStyle(fontSize: 10.sp),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainred,
                  minimumSize: Size(60.w, 20.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                onPressed: onpressed,
                child: Wrap(
                  children: [
                    Text(
                      'Next',
                      style: TextStyle(fontSize: 10.sp),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: white,
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
  }
}
