
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fps/view/style/style.dart';

class InspectorNameForm extends StatelessWidget {
  const InspectorNameForm({
    Key? key,
    required this.controller,
    required this.validator,
    required this.onChanged,
  }) : super(key: key);

  final TextEditingController controller;
  final FormFieldValidator validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.w,
      child: TextFormField(
        onChanged:onChanged,
        keyboardType: TextInputType.name,
      
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
            counterStyle: TextStyle(color: bg),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.r),
                borderSide: const BorderSide(color: bg)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.r),
              borderSide: const BorderSide(color: bg),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.r),
              borderSide: const BorderSide(color: red),
            ),
            fillColor: bg,
            focusColor: bg,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.r),
            )),
      ),
    );
  }
}
