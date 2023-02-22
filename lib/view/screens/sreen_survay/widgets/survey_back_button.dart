import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fps/view/style/style.dart';

class SurvayBackButton extends StatelessWidget {
  const SurvayBackButton({
    Key? key,
    required this.width,
    required this.child,
    required this.height,
    required this.onPressed,
    required this.bg,
  }) : super(key: key);

  final double width;
  final Color bg;
  final VoidCallback onPressed;
  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,width: width,
        decoration: BoxDecoration(
          color: bg,
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
          child:Center(child: child) ,
      ),
    );




    // return ElevatedButton(
    //   style: ElevatedButton.styleFrom(
    //     backgroundColor: bg,
    //     minimumSize: Size(width, 20.h),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(20.r),
    //     ),
    //   ),
    //   onPressed: onPressed,
    //   child: child,
    // );
  }
}
