// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:fps/controller/controller/onbording_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fps/view/screens/screen%20_login/login_screen.dart';
import 'package:fps/view/style/style.dart';
import 'package:get/get.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OnbordingController onbordingcontroller = Get.put(OnbordingController());

    return Scaffold(
      body: PageView.builder(
        controller: onbordingcontroller.pagecontroller,
        onPageChanged: onbordingcontroller.selectedIndex,
        itemCount: onbordingcontroller.onbordingLists.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 190.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 150.h,
                  width: 200.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          onbordingcontroller.onbordingLists[index].image),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70.w),
                  child: SizedBox(
                    height: 110.h,
                    width: double.infinity,
                    child: onbordingcontroller.onbordingLists[index].mainText,
                  ),
                ),
                h30,
                Stack(
                  children: [
                    Container(
                      height: 210.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(150.r),
                          topRight: Radius.circular(150.r),
                        ),
                        color: mainred,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 30.h),
                            child: const Text(
                              'Easy and secure\nas son ss the survey\nis submitted, the date is secure',
                              style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 90.h,
                      left: 170.w,
                      child: Row(
                        children: List.generate(
                          onbordingcontroller.onbordingLists.length,
                          (index) {
                            return Obx(
                              () {
                                return Padding(
                                  padding: EdgeInsets.all(2.0.w),
                                  child: Container(
                                    width: 6.w,
                                    height: 6.h,
                                    decoration: BoxDecoration(
                                    
                                      color:
                                          onbordingcontroller.selectedIndex ==
                                                  index
                                              ? white
                                              : lightgrey.withOpacity(.5),
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 30.h,
                      right: 50.w,
                      child: GestureDetector(
                        onTap: () => onbordingcontroller.forwerdAction(),
                        child: Container(
                          width: 60.w,
                          height: 23.h,
                          decoration: BoxDecoration(
                              color: red,
                              borderRadius: BorderRadius.circular(50.r),
                              boxShadow: const []),
                          child: Center(
                            child: Obx(() {
                              return Text(
                                onbordingcontroller.isLastPage
                                    ? 'Start'
                                    : 'Next',
                                style: const TextStyle(color: white),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                   
                    Positioned(
                        bottom: 30.h,
                        left: 50.w,
                        child:  GestureDetector(
                      onTap: () {
                        Get.offAll(LoginScreen());
                      },
                      child: Container(
                        width: 60.w,
                        height: 23.h,
                        decoration: BoxDecoration(
                            color: red,
                            borderRadius: BorderRadius.circular(50.r),
                            boxShadow: const []),
                        child: const Center(
                          child: Text(
                            'Skip',
                            style: TextStyle(color: white),
                          ),
                        ),
                      ),
                    ),)
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
