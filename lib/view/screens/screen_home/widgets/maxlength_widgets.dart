
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:fps/view/style/style.dart';

class MaxlengthTextFormWidget extends StatelessWidget {
  const MaxlengthTextFormWidget({
    Key? key,
    required this.controller,
    required this.counterColor,
    required this.textinputType,
    required this.validator,
    required this.borderColor,
    required this.filledColor,
  }) : super(key: key);
  final TextEditingController controller;
  final FormFieldValidator validator;
  final TextInputType textinputType;
  final Color counterColor;
  final Color borderColor;
  final Color filledColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 7,
      keyboardType: textinputType,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
          counterStyle: TextStyle(color: counterColor),
          contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.r),
              borderSide: BorderSide(color: borderColor)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.r),
            borderSide: BorderSide(color: borderColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.r),
            borderSide: const BorderSide(color: red),
          ),
          fillColor: filledColor,
          focusColor: filledColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.r),
          )),
    );
  }
}
