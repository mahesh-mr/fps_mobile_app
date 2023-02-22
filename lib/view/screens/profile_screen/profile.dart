import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fps/controller/controller/profile_controller/profile_controller.dart';
import 'package:fps/view/screens/widgets/custom_appbar.dart';
import 'package:fps/view/screens/widgets/custom_popupmenu.dart';
import 'package:fps/view/screens/widgets/double_tapp.dart';
import 'package:fps/view/screens/widgets/popup_menu/popup_menu.dart';
import 'package:fps/view/screens/widgets/shadow_button.dart';
import 'package:fps/view/style/style.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final profileController = Get.put(ProfileController());
 DateTime? lastpressed;
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: CustomAppbarProfile(
        widget: PopupHome(
          color: bg,
        ),
        height: 150.h,
      ),
      backgroundColor: bg,
        body: DoubleTapBackPress(lastpressed: lastpressed, widget:  Obx(() {
          if (profileController.loding.value) {
            return const Center(
              child: CupertinoActivityIndicator(
                animating: true,
                color: yellow,
                radius: 25,
              ),
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
                Padding(
                   padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                  child: ClayContainer(
                    color: white,
                    borderRadius: 20.r,
                    depth: 40,
                    parentColor: white,
                    spread: 2,
                    child: Container(
                      height: 240.w,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: white,
                          border: Border.all(color: lightgrey)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 250.h,
                              width: 100.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  confirmText("Name", 15.sp, 1),
                                  h25,
                                  confirmText("Role", 15.sp, 1),
                                  h25,
                                  confirmText("District", 15.sp, 1),
                                  h25,
                                  confirmText("Taluk", 15.sp, 1),
                                  h25,
                                  confirmText("firka", 15.sp, 1),
                                ],
                              ),
                            ),
                            w5,
                            Container(
                              height: 250.h, width: 10.w, //color: red,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                               //   h25,
                                  confirmText(":", 15.sp, 1),
                                  h25,
                                  confirmText(":", 15.sp, 1),
                                  h25,
                                  confirmText(":", 15.sp, 1),
                                  h25,
                                  confirmText(":", 15.sp, 1),
                                  h25,
                                  confirmText(":", 15.sp, 1),
                                ],
                              ),
                            ),
                            w5,
                            Container(
                              height: 250.h,
                              width: 120.w,
                              child: Column( mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  confirmText(
                                      profileController
                                          .profileModel!.data!.user!.name!,
                                      15.sp,
                                      1), h25,
                                  confirmText(
                                      profileController
                                          .profileModel!.data!.user!.role!.role
                                          .toString(),
                                      15.sp,
                                      1), h25,
                                  confirmText(
                                      profileController.profileModel!.data!.user!
                                          .district!.name!,
                                      15.sp,
                                      1),h25,
                                  confirmText(
                                      profileController
                                          .profileModel!.data!.user!.taluk!.name!,
                                      15.sp,
                                      1), h25,
                                  confirmText(
                                      profileController
                                          .profileModel!.data!.user!.firka!.name!,
                                      15.sp,
                                      1),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                h30,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: more(),
                ),
      
                //           survayDetails(),
               // h25,
      
                h25,
              ],
            ),
          );
        }),
      ),
    );
  }

  Column more() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 20.h,
              width: 240.w,
              child: Text(
                'Totel Inspection',
                style: red_16,
              ),
            ),
            Container(
              height: 20.h,
              width: 60.w,
              child: Text(
               profileController.inspectionMonthwiseModels!.data.toString(),
                style: red_16,
              ),
            )
          ],
        ),
        const Divider(
          thickness: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 20.h,
              width: 240.w,
              child: Text(
                'Current month inspection',
                style: red_16,
              ),
            ),
            Container(
              height: 20.h,
              width: 60.w,
              child: Text(
                 profileController.inspectionMonthwiseModel!.data.toString(),
                style: red_16,
              ),
            )
          ],
        ),
        const Divider(
          thickness: 2,
        ),
       
      ],
    );
  }

  Row buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: CustomShadowButton(
            onTap: () {},
            buttonColor: mainred,
            width: 150.w,
            height: 40.h,
            title: butenText(title: "Start new Survey", textColor: bg),
          ),
        ),
       
      ],
    );
  }

  IntrinsicHeight survayDetails() {
    return IntrinsicHeight(
        child: Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 100.w,
          child: Column(
            children: [
              SizedBox(
                width: 100.w,
                height: 70.h,
                child: Text(
                  'Totel Inspection',
                  maxLines: 3,
                  style: red_18,
                ),
              ),
              h5,
              Text(
                'N/A',
                style: red_16,
              ),
            ],
          ),
        ),
        const VerticalDivider(
          color: mainred,
        ),
        SizedBox(
          width: 100.w,
          //  height: 90,
          child: Column(
            children: [
              SizedBox(
                width: 100.w,
                height: 70.h,
                child: Text(
                  'Current month inspection',
                  maxLines: 3,
                  style: red_18,
                ),
              ),
              h5,
              Text(
                'N/A',
                style: red_16,
              ),
            ],
          ),
        ),
        const VerticalDivider(
          color: mainred,
        ),
        SizedBox(
          width: 100.w,
          child: Column(
            children: [
              SizedBox(
                width: 100.w,
                height: 70.h,
                child: Text(
                  'Totel firka',
                  maxLines: 3,
                  style: red_18,
                ),
              ),
              h5,
              Text(
                'N/A',
                style: red_16,
              ),
            ],
          ),
        ),
      ],
    ));
  }

  Row details() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 200.h,
          width: 70.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name", style: red_16),
              h15,
              Text("Position", style: red_16),
              h15,
              Text("District", style: red_16),
              h15,
              Text("Taluk", style: red_16),
              h15,
              Text("Firka", style: red_16),
              h15,
            ],
          ),
        ),
      ],
    );
  }

  ClipPath image() {
    return ClipPath(
      clipper: CustomClipath(),
      child: Stack(
        children: [
          Container(
            height: 250.h,
            width: double.infinity,
            color: mainred,
          ),
          Positioned(
            top: 40.h,
            left: 110.w,
            child: Container(
              height: 150.h,
              width: 150.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/log.png'),
                ),
              ),
            ),
          ),
          Positioned(
            right: 7.w,
            top: 40.h,
            child: PopupmenuButtonWidgets(
              color: bg,
            ),
          )
        ],
      ),
    );
  }
}

class CustomClipath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.lineTo(0, h);
    path.quadraticBezierTo(w * 0.5, h - 100, w, h);
    //path.lineTo(w, h);
    path.lineTo(w, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

Widget confirmText(String title, double size, int maxline) {
  return Text(
    title,
    style: TextStyle(
        fontWeight: FontWeight.w600, color: lightblack, fontSize: size),
    maxLines: maxline,
  );
}
