import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fps/view/style/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BotosheetForm extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator validator;

  final TextInputType textinputType;
  final void Function(String)? onChanged;
 final int maxLength;



  const BotosheetForm({
    super.key,
    required this.controller,
    required this.textinputType,
    required this.validator,required this.onChanged,required this. maxLength
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength:maxLength ,
      onChanged:onChanged ,
     keyboardType:textinputType ,
      controller: controller,
      validator: validator,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],

      decoration: InputDecoration(errorStyle: TextStyle(color: yellow),
        counterStyle: TextStyle(color:bg),
          contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.r),
              borderSide: const BorderSide(color: bg)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.r),
            borderSide: const BorderSide(color: bg),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.r),
            borderSide: const BorderSide(color: green),
          ),
          fillColor: bg,
          focusColor: bg,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.r),
          )),
    );
  }
}
