import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fps/controller/image_capture_controller/image_controller.dart';
import 'package:fps/controller/service/dioclint/token/token.dart';
import 'package:fps/controller/service/image_uplod/image_service.dart';
import 'package:fps/view/screens/camerScreen/camera_shop.dart';
import 'package:fps/view/screens/widgets/double_tapp.dart';
import 'package:fps/view/screens/witness_screen/withness_1_screen.dart';
import 'package:fps/view/screens/widgets/custom_appbar.dart';
import 'package:fps/view/screens/widgets/shadow_button.dart';
import 'package:fps/view/style/style.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CameraSignature extends StatelessWidget {
  CameraSignature({super.key});
  final imageuplodController = Get.put(ImageUplodController());
  String cdate = DateFormat("dd-MM-yyy").format(DateTime.now());
  String? fpsNo = GetLocalStorage.getfpsId('fps_no');
  DateTime? lastpressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: CustomAppbar(height: 200.h),
      body: DoubleTapBackPress(
        lastpressed: lastpressed,
        widget: GetBuilder<ImageUplodController>(
            initState: (state) {},
            builder: (controller) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Image of Signature',
                      style: fontZ_14_Grey,
                    ),
                    h10,
                    Stack(
                      children: [
                        Container(
                          height: 330.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(color: lightblack),
                            image: const DecorationImage(
                                image: AssetImage('assets/statement.jpg'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        Positioned(
                            top: 99.h,
                            left: 154.w,
                            child: Container(
                              height: 13.h,
                              width: 26.w,
                              color: white,
                              child: Text(
                                fpsNo!,
                                style: TextStyle(
                                  fontSize: 6.sp,
                                ),
                              ),
                            )),
                        Positioned(
                          top: 100.h,
                          left: 25.w,
                          child:
                              //Text('1234567')

                              Container(
                            height: 13,
                            width: 34,
                            color: white,
                            child: Text(
                              cdate,
                              style: TextStyle(
                                fontSize: 6.sp,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 70.h,
                            right: 45.w,
                            child: controller.siganatureImagePath != null
                                ? Stack(
                                    children: [
                                      Container(
                                        height: 25.h,
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                          // border: Border.all(color: lightblack),
                                          //  borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: FileImage(
                                                File(
                                                  controller.siganatureImagePath
                                                      .toString(),
                                                ),
                                              ),
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                      Positioned(
                                        right: 0,
                                        //  top: .01,

                                        child: IconButton(
                                          onPressed: () {
                                            controller.sinaturePicImage();
                                          },
                                          icon: const Icon(
                                            CupertinoIcons.camera_circle,
                                            color: white,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      controller.sinaturePicImage();
                                    },
                                    child: Container(
                                      //  color: red,
                                      height: 25.h,
                                      width: 100.w,
                                      child: const Icon(
                                        CupertinoIcons.camera_circle,
                                        color: yellow,
                                      ),
                                      //color:yellow,
                                    )))
                      ],
                    ),
                    h25,
                    CustomShadowButton(
                      onTap: () async {
                        Get.offAll(CameraShop(),
                            transition: Transition.noTransition,
                            duration: const Duration(seconds: 1));
                      },
                      buttonColor: mainred,
                      title: butenText(title: "SUBMIT", textColor: bg),
                      height: 40.h,
                      width: double.infinity,
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
