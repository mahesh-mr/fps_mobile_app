import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.btncolor,
    required this.textColor,
  });

  final VoidCallback onPressed;
  final String title;
  final Color btncolor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 10,
          minimumSize: Size(double.infinity, height * .05),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          backgroundColor: btncolor,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ));
  }
}
