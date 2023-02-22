
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fps/view/screens/screen_otp/otp_screen.dart';
import 'package:fps/view/screens/screen%20_login/widgets/custom_textform.dart';
import 'package:fps/view/screens/widgets/double_tapp.dart';
import 'package:fps/view/screens/widgets/shadow_button.dart';
import 'package:fps/view/style/style.dart';
import 'package:get/get.dart';

class ForgotScreen extends StatelessWidget {
  ForgotScreen({super.key});

  final emailController = TextEditingController();DateTime? lastpressed;
  @override
  Widget build(BuildContext context) {
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
      body: DoubleTapBackPress(lastpressed: lastpressed, widget: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: 250.h,
                    width: 200.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 250.h,
                          width: 140.w,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/4.png'),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 55.h,
                    left: 10.w,
                    child: Text(
                      "Forgot\nPassword",
                      style: welcomeText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Positioned(
                    bottom: 27.h,
                    left: 10.w,
                    child: const Text(
                      "Password Recovery",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: mainred,
                          letterSpacing: .4),
                    ),
                  ),
                ],
              ),
              h40,
              const Text(
                "We will send password recovery\ncode in the Email",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, color: grey),
              ),
              h25,
      
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child:CustomFomField(controller: emailController,
                 textinputType: TextInputType.emailAddress,
                  validator: (value) {
                    
                  },
                   onChanged: (p0) {
                     
                   },
                    maxline: 1,
                     titles: 'Email Address')
                
                
               ,
              ),
      
              // if (value == null) {
              //   return "Required Field";
              // } else if (!RegExp(
              //         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
              //     .hasMatch(value)) {
              //   return "Enter a valid email";
              // } else {
              //   return null;
              // }
      
              h30,
              CustomShadowButton(onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpScreen(),
                        ));
                  },
                  buttonColor: mainred,
                  height: 40.h,
                  width: double.infinity,
             
                  title:butenText(title: 'Send Link For Recovery', textColor:   bg,) )
             
            ],
          ),
        ),
      ),
    );
  }
}
