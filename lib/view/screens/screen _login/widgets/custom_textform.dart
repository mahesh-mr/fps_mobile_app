import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:fps/controller/controller/authcontroller/auth_controller.dart';
import 'package:fps/controller/service/auth_service/auth_service.dart';
import 'package:fps/model/auth_model/auth_model.dart';
import 'package:fps/view/style/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//email==========================================================
//===============================================================

class CustomFomField extends StatelessWidget {
  String titles;
  final TextInputType textinputType;
  final int maxline;
  final FormFieldValidator validator;
  final TextEditingController controller;
  final Function(String)? onChanged;

  CustomFomField(
      {super.key,
      required this.controller,
      required this.textinputType,
      required this.validator,
      required this.onChanged,
      required this.maxline,
      required this.titles});

  @override
  Widget build(BuildContext context) {
    return 
    ClayContainer(
      color: white,
      borderRadius: 50.r,
      depth: 40,
      parentColor: white,
      spread: 2,
      child: TextFormField(
        keyboardType: textinputType,
        onChanged: onChanged,
        maxLines: maxline,
        controller: controller,
        validator: validator,
        textAlign: TextAlign.center,
        decoration: InputDecoration( errorStyle: TextStyle(
          
        decorationStyle: TextDecorationStyle.dashed,
            fontFamily: 'SF-Pro-Display',
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
        ),
      //floatingLabelAlignment: FloatingLabelAlignment.center,
         // errorStyle: TextStyle(),
          contentPadding: EdgeInsets.all(5.w),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.r),
              borderSide: const BorderSide(color: lightgrey)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.r),
            borderSide: const BorderSide(color: lightgrey),
          ),
          errorBorder:
          
           OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.r),
          
            borderSide:
                BorderSide(strokeAlign: StrokeAlign.inside, color: Colors.red),
          ),
          hintText: titles,
          fillColor: white,
          focusColor: white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.r),
          ),
        ),
      ),
    );
  }
}

//password========================================================
//================================================================

final _passwodController = TextEditingController();
final authcontoller = Get.put(AuthService());
Widget customPasswordField() {
  return Obx(() {
    return ClayContainer(
      color: white,
      borderRadius: 50.r,
      depth: 40,
      parentColor: white,
      spread: 2,
      child: TextFormField(
        obscureText: authcontoller.isvisible.value,
        controller: _passwodController,
        validator: (value) {
          //  authController.isvisible.value=!authController.isvisible.value;
        },
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              authcontoller.isvisible.value = !authcontoller.isvisible.value;
            },
            child: authcontoller.isvisible.value
                ? const Icon(
                    Icons.visibility,
                    color: mainred,
                  )
                : const Icon(
                    Icons.visibility_off,
                    color: mainred,
                  ),
          ),
          contentPadding: EdgeInsets.all(5.w),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.r),
              borderSide: const BorderSide(color: lightgrey)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.r),
            borderSide: const BorderSide(color: lightgrey),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: red),
          ),
       errorStyle: TextStyle(height: 0.7),
     //  errorText: "ffdfsk hhghg jhghjhj ghjghghg",
          fillColor: white,
          focusColor: white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.r),
          ),
        ),
      ),
    );
  });
}
