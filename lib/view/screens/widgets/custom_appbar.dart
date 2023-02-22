import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fps/controller/controller/qustion_pagae_controller/qustion_controller.dart';
import 'package:fps/controller/controller/survey_controller/position_controller.dart';
import 'package:fps/controller/service/dioclint/token/token.dart';
import 'package:fps/model/qustion_model.dart';
import 'package:fps/view/screens/navebar_screen/navbar.dart';
import 'package:fps/view/screens/widgets/popup_menu/popup_menu.dart';
import 'package:fps/view/style/style.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppbar({super.key, required this.height});
  String? userId = GetLocalStorage.getUserIdAndToken('id');
  final positionController = Get.put(PositionController());
  final storageController = Get.put(GetLocalStorage());
  double height;
  String cdate = DateFormat("dd-MM-yyy").format(DateTime.now());
  String? fpsId = GetLocalStorage.getfpsId('fps_no');
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
            padding: EdgeInsets.only(
              bottom: 140.h,
            ),
            child: Popups(color: bg))
      ],
      centerTitle: true,
      title: Padding(
        padding: EdgeInsets.only(bottom: 140.h),
        child: Column(
          children: [
            Text(
              "CIVIL SUPPLIES",
              style: appTextWhite,
            ),
            h5,
            Text(
              "FPS Inspection Application",
              style: appTextWhite,
            ),
          ],
        ),
      ),
      leading: Padding(
        padding: EdgeInsets.only(
          bottom: 140.h,
        ),
        child: IconButton(
            onPressed: () {
              positionController.switchValue.value = false;
             print("$userId  ==== id 666");
             print("1");
            

             print("$userId  ==== token 666");

              Future.delayed(Duration(microseconds: 30))
                  .then((value) => storageController.removeUserremovedSId());
              qustionsList = qustionsList
                  .map((e) => QustionModel(
                      text: e.text,
                      headaLine: e.headaLine,
                      bar: e.bar,
                      number: e.number))
                  .toList();
              Get.offAll(NavBarScreen(),
                  transition: Transition.noTransition,
                  duration: const Duration(seconds: 1),);
            },
            icon: Icon(
              Icons.home,
              color: bg,
            )),
      ),
      toolbarHeight: 230.h,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      flexibleSpace: ClipPath(
        clipper: Customshape(),
        child: Stack(
          children: [
            Container(
              height: 270.h,
              width: MediaQuery.of(context).size.width,
              color: mainred,
            ),
            Positioned(
              bottom: 70.h,
              left: 50.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'FPS Number',
                    style: fontZ_16White2,
                  ),
                  h5,
                  Text(
                    //"1234567",
                    fpsId!,
                    style: fontZ_16White,
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 70.h,
                right: 40.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Inspection Date',
                      style: fontZ_16White2,
                    ),
                    h5,
                    Text(
                      cdate,
                      style: fontZ_16White,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(
        double.infinity,
        height,
      );
}

class CustomAppbarProfile extends StatelessWidget
    implements PreferredSizeWidget {
  CustomAppbarProfile({super.key, required this.height, required this.widget});
  double height;
  Widget widget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: EdgeInsets.only(bottom: 150.h),
          child: widget,
        )
      ],
      leading: Padding(
        padding: EdgeInsets.only(
          bottom: 0.h,
        ),
      ),
      centerTitle: true,
      // title: Padding(
      //   padding: EdgeInsets.only(bottom: 130.h),
      //   child: Text(
      //     "CIVIL SUPPLIES",
      //     style: appTextWhite,
      //   ),
      // ),
      toolbarHeight: 200.h,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      flexibleSpace: ClipPath(
        clipper: Customshape(),
        child: Stack(
          children: [
            Container(
              height: 250.h,
              width: MediaQuery.of(context).size.width,
              color: mainred,
            ),
            Positioned(
              left: 130.w,
              top: 40.h,
              child: Container(
                height: 90.h,
                width: 90.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/log.png'),
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(9, 9),
                        spreadRadius: -6,
                        blurRadius: 5,
                        color: Color.fromARGB(255, 183, 182, 182),
                      )
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(
        double.infinity,
        height,
      );
}

@immutable
// ignore: must_be_immutable
class CustomAppbarsupport extends StatelessWidget
    implements PreferredSizeWidget {
  CustomAppbarsupport({super.key, required this.height, required this.widget});
  double height;
  Widget widget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: EdgeInsets.only(
            bottom: 130.h,
          ),
          child: widget,
        )
      ],
      leading: Padding(
        padding: EdgeInsets.only(
          bottom: 180.h,
        ),
      ),
      title: Padding(
        padding: EdgeInsets.only(bottom: 100.h),
        child: Column(
          children: [
            Text(
              "CIVIL SUPPLIES",
              style: appTextWhite,
            ),
            h5,
            Text(
              "FPS Inspection Application",
              style: appTextWhite,
            ),
          ],
        ),
      ),
      centerTitle: true,
      toolbarHeight: 230.h,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      flexibleSpace: ClipPath(
        clipper: Customshape(),
        child: Stack(
          children: [
            Container(
              height: 300.h,
              width: MediaQuery.of(context).size.width,
              color: mainred,
            ),
            // Positioned(
            //   left: 140,
            //   top: 90,

            // )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(
        double.infinity,
        height,
      );
}

class Customshape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();
    //  path.arcToPoint(arce)
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
