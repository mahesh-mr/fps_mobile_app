import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fps/controller/controller/controller.dart';
import 'package:fps/view/screens/widgets/double_tapp.dart';
import 'package:fps/view/style/style.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpScreen extends StatelessWidget {
   OtpScreen({super.key});
 DateTime? lastpressed;
  @override
  Widget build(BuildContext context) {
    final splashController = Get.put(ControllerC());
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0.0,
        title: Text(
          "CIVIL SUPPLIES",
          style: appText,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: mainred,
          ),
        ),
      ),
       body: DoubleTapBackPress(lastpressed: lastpressed, widget:  SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 70.w, vertical: 40.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 170.h,
                      width: 240.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 170.h,
                            width: 150.w,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/5.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 15.h,
                      child: Text(
                        "Forgot\nPassword",
                        style: welcomeText,
                      ),
                    )
                  ],
                ),
                h30,
                const Text(
                  "Enter recovery code\nwe have sent to your Email",
                  style: TextStyle(fontWeight: FontWeight.bold, color: grey),
                ),
                h30,
                const Text(
                  "test@gmail.com",
                  style: TextStyle(fontWeight: FontWeight.bold, color: mainred),
                ),
                h30,
                PinCodeTextField(
                  appContext: context,
                  length: 4,
                  enableActiveFill: true,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                      disabledColor: red,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10.r),
                      borderWidth: 0,
                      fieldHeight: 40.h,
                      fieldWidth: 40.w,
                      selectedFillColor: lightred,
                      activeFillColor: lightred,
                      inactiveFillColor: lightred,
                      inactiveColor: black),
                  onChanged: (String value) {
                    splashController.startTime();
                  },
                ),
                h20,
                Obx(() {
                  return RichText(
                    text: TextSpan(
                      text: "This code will expire in ",
                      style: const TextStyle(
                        color: grey,
                      ),
                      children: [
                        TextSpan(
                          text: '00:${splashController.start.value}',
                          style: const TextStyle(
                            color: mainred,
                          ),
                          recognizer: TapGestureRecognizer(),
                        ),
                        TextSpan(
                          text: ' Seconds',
                          style: const TextStyle(
                            color: grey,
                          ),
                          recognizer: TapGestureRecognizer(),
                        )
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
