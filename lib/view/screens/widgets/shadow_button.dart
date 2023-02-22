import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:fps/view/style/style.dart';

Widget CustomShadowButton({
  required VoidCallback? onTap,
  
  required Color buttonColor,
  required double width,
  required double height,
  required Widget title,
}) {
  return InkWell(
    onTap: onTap,
    child: Ink(
      //color: mainred,
          height: height,
        width: width,
      decoration:  BoxDecoration(
      color: buttonColor,
            borderRadius: BorderRadius.circular(50.r),
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
      child:Center(
            child:title,
        //      Text(
        // titl,
        //   style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        //   textAlign: TextAlign.center,
        // ),
        ),
      //  Container(
      //   height: height,
      //   width: width,
      //   decoration: BoxDecoration(
      //       color: buttonColor,
      //       borderRadius: BorderRadius.circular(50.r),
      //       boxShadow: const [
      //         BoxShadow(
      //           color: grey,
      //           offset: Offset(4, 4),
      //           blurRadius: 2,
      //           spreadRadius: 1,
      //         ),
      //         BoxShadow(
      //           color: white,
      //           offset: Offset(-4, -4),
      //           blurRadius: 2,
      //           spreadRadius: 1,
      //         ),
      //       ]),
      //   child: 
      // ),
    ),
  );
}
Widget butenText({
  required String title,required Color textColor,
}){
  return 
       Text(
      title,
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      );

}