import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fps/view/screens/widgets/custom_appbar.dart';
import 'package:fps/view/screens/widgets/custom_popupmenu.dart';
import 'package:fps/view/style/style.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class WitnessAppbar extends StatelessWidget implements PreferredSizeWidget {
  WitnessAppbar({super.key,required this.text,required this.subText,
  
  });
final String text;
final String subText;


  String cdate = DateFormat("dd-MM-yyy").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 190,
          ),
          child: PopupmenuButtonWidgets(
            color: bg,
          ),
        )
      ],
      leading: Padding(
        padding: const EdgeInsets.only(
          bottom: 190,
        ),
        child: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: white,
          ),
        ),
      ),
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(bottom: 170),
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
      toolbarHeight: 250,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      flexibleSpace: ClipPath(
        clipper: Customshape(),
        child: Stack(
          children: [
            Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              color: mainred,
            ),
            Positioned(
              bottom: 40.h,
              left: 40.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style:fontZ_30_White ,
                  ),
                  h10,
                  SizedBox(
                   
                    height: 50,
                    width: 300,

                    child: Text(
                     subText,
                      style: fontZ_16White3,textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(
        double.infinity,
        230.h,
      );
}
