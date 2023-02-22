import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fps/view/style/style.dart';

class CustomItemSurveyTextForm extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator validator;
  final String title;
  final TextInputType textinputType;
  void Function(String)? onChanged;
  final String hintText;

   CustomItemSurveyTextForm({
    super.key,
    required this.controller,
    required this.textinputType,
    required this.title,
    required this.validator,required this.onChanged,required this.hintText
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: grey3,
          ),
        ),
        h10,
        ClayContainer(
          color: white,
          borderRadius: 50.r,
          depth: 40,
          parentColor: white,
          spread: 2,
          child: TextFormField(
            onChanged:onChanged ,
            keyboardType: textinputType,
            controller: controller,
            validator: validator,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.all(5.w),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.r),
                borderSide: const BorderSide(color: lightgrey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.r),
                borderSide: const BorderSide(color: lightgrey),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.r),
                borderSide: const BorderSide(color: red),
              ),
              fillColor: white,
              focusColor: white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}



class CustomSurveyTextForm extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator validator;
  final String title;
  final TextInputType textinputType;
  void Function(String)? onChanged;
  final String suffix;

   CustomSurveyTextForm({
    super.key,
    required this.controller,
    required this.textinputType,
    required this.title,
    required this.validator,required this.onChanged,required this.suffix
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: grey3,
          ),
        ),
        h10,
        ClayContainer(
          color: white,
          borderRadius: 50.r,
          depth: 40,
          parentColor: white,
          spread: 2,
          child: TextFormField(
            onChanged:onChanged ,
            keyboardType: textinputType,
            controller: controller,
            validator: validator,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              suffix: Padding(
                padding:  EdgeInsets.only(right: 30.w),
                child: Text(suffix),
              ),
              contentPadding: EdgeInsets.all(5.w),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.r),
                borderSide: const BorderSide(color: lightgrey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.r),
                borderSide: const BorderSide(color: lightgrey),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.r),
                borderSide: const BorderSide(color: red),
              ),
              fillColor: white,
              focusColor: white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
