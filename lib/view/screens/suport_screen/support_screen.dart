import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fps/view/screens/widgets/custom_appbar.dart';
import 'package:fps/view/screens/widgets/double_tapp.dart';
import 'package:fps/view/screens/widgets/popup_menu/popup_menu.dart';
import 'package:fps/view/screens/widgets/shadow_button.dart';
import 'package:fps/view/style/style.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportScreen extends StatelessWidget {
   SupportScreen({super.key});
 DateTime? lastpressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: CustomAppbarsupport(
        height: 150.h,
        widget: PopupHome(
          color: bg,
        ),
      ),
        body: DoubleTapBackPress(lastpressed: lastpressed, widget:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: 200.h,
                    width: 200.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(9, 9),
                            spreadRadius: -6,
                            blurRadius: 2,
                            color: Color.fromARGB(255, 183, 182, 182),
                          )
                        ]),
                  ),
                  Positioned(
                      top: 30,
                      right: 30,
                      child: Container(
                        height: 150.h,
                        width: 150.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/log.png'),
                          ),
                        ),
                      ))
                ],
              ),
              h40,
              Padding(
                padding: EdgeInsets.only(top: 50.h),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Text(
                    'If you have any questions feel free to call in this number',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: black_14,
                  ),
                ),
              ),
              h30,
              Padding(
                padding: EdgeInsets.only(top: 0.h),
                child: GestureDetector(
                  onTap: () {
                    _launchUrl();
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: mainred,
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
                      ],
                      borderRadius: BorderRadius.circular(40.r),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        w15,
                        Icon(
                          CupertinoIcons.phone_fill,
                          color: bg,
                        ),
                        w5,
                        Text(
                          "Toll free number",
                          style: white_30,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    final Uri callUrl = Uri.parse("tel:1234567890");
    await launchUrl(callUrl);
  }
}
