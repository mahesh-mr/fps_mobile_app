import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fps/view/style/style.dart';

class SmallButtons extends StatelessWidget {
  SmallButtons(
      {Key? key,
      required this.backgroundColor,
      required this.height,
      required this.textColor,
      required this.width,
      required this.text,
      required this.onPressed})
      : super(key: key);
  final Color backgroundColor;
  final Color textColor;
  final double width;
  // final String text;
  final double height;
  final VoidCallback onPressed;
  final Widget text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
      elevation: 8,
        //90,23w.h
        shadowColor: grey,
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        backgroundColor: backgroundColor,
      ),
      child: text,
      //style: TextStyle(color: textColor),
    );
  }
}
