import 'package:flutter/material.dart';
import 'package:fps/controller/controller/splash_controller.dart';
import 'package:fps/view/style/style.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (_) {
        return Scaffold(
          body: Column(
            children: [
              Container(
                width: double.infinity,
                height: 430.h,
                decoration: BoxDecoration(
                  color: mainred,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(100.r)),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 40.h, horizontal: 50.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 150.h,
                        width: 150.w,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/7.png'),
                          ),
                        ),
                      ),
                      Text(
                        'CIVIL SUPPLIES',
                        style: headText,
                      ),
                    ],
                  ),
                ),
              ),
              h40,
              Text(
                'Mobile apps for inspection\nof ration shops',
                textAlign: TextAlign.center,
                style: headline,
              ),
            ],
          ),
        );
      },
    );
  }
}
