import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fps/controller/service/auth_service/auth_service.dart';
import 'package:fps/view/screens/navebar_screen/navbar.dart';
import 'package:fps/view/screens/screen%20_login/widgets/custom_textform.dart';
import 'package:fps/view/screens/widgets/double_tapp.dart';
import 'package:fps/view/screens/widgets/shadow_button.dart';
import 'package:fps/view/style/style.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fomkey = GlobalKey<FormState>();
  final authController = Get.put(AuthService());

  DateTime? lastpressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: DoubleTapBackPress(
        lastpressed: lastpressed,
        widget: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 100.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 180.h,
                  width: 200.w,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/3.png'),
                    ),
                  ),
                ),
                h20,
                Text(
                  "Welcome",
                  style: welcomeText,
                ),
                h20,
                const Text(
                  "Hello there, Login to Continue",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: grey,
                  ),
                ),
                h20,
                Form(
                  key: _fomkey,
                  child: Column(
                    children: [
                      emailFeild(emailController: _emailController),
                      h20,
                      password(),
                      h30,
                      // GestureDetector(
                      //   onTap: () {
                      //     Get.to(ForgotScreen());
                      //   },
                      //   child: const Text(
                      //     'Forgot Password',
                      //     style: TextStyle(
                      //         color: mainred, fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                      h30,
                      Obx(() {
                        if (authController.isLoading.value) {
                          const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return CustomShadowButton(
                            onTap: authController.isLoading.value
                                ? null
                                : () async {
                                    authController.isLoading.value = true;
                                    await Future.delayed(const Duration(seconds: 1));
                                    authController.isLoading.value = false;
                                    bool isValid =
                                        _fomkey.currentState!.validate();
                                    if (isValid) {
                                      authController
                                          .loginUser(
                                              email: _emailController.text,
                                              password:
                                                  _passwordController.text,
                                              context: context)
                                          .then((value) {
                                        if (value == "success") {
                                          Get.offAll(NavBarScreen(),
                                              transition:
                                                  Transition.noTransition,
                                              duration:
                                                  const Duration(seconds: 1));
                                        }
                                      });
                                    }
                                  },
                            buttonColor: mainred,
                            height: 40.h,
                            width: double.infinity,
                            title: authController.isLoading.value
                                ? const CupertinoActivityIndicator(
                                    animating: true,
                                    color: yellow,
                                    radius: 25,
                                  )
                                : butenText(
                                    title: 'Login to Access', textColor: bg));
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Obx password() {
    return Obx(() {
      return ClayContainer(
        color: white,
        borderRadius: 50.r,
        depth: 40,
        parentColor: white,
        spread: 2,
        child: TextFormField(
          obscureText: authController.isvisible.value,
          controller: _passwordController,
          validator: (value) {
            if (value!.isEmpty) {
              return "        Password minimum  1 length";
            }
            // else if (!RegExp(r'(^[a-z A-Z]+$)').hasMatch(value)) {
            //   return 'valid Passsworsd';
            // }
            else {
              return null;
            }
          },
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                authController.isvisible.value =
                    !authController.isvisible.value;
              },
              child: authController.isvisible.value
                  ? const Icon(
                      Icons.visibility,
                      color: mainred,
                    )
                  : const Icon(
                      Icons.visibility_off,
                      color: mainred,
                    ),
            ),
            contentPadding: EdgeInsets.all(5.w),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.r),
                borderSide: const BorderSide(color: lightgrey)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.r),
              borderSide: const BorderSide(color: lightgrey),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.r),
              borderSide: const BorderSide(color: red),
            ),
            hintText: "Password",
            fillColor: white,
            focusColor: white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.r),
            ),
          ),
        ),
      );
    });
  }
}

class emailFeild extends StatelessWidget {
  const emailFeild({
    Key? key,
    required TextEditingController emailController,
  })  : _emailController = emailController,
        super(key: key);

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return CustomFomField(
        controller: _emailController,
        textinputType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null) {
            return "                 Required Field";
          } else if (!RegExp(
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
              .hasMatch(value)) {
            return "                       Enter a valid email";
          } else {
            return null;
          }
        },
        onChanged: (p0) {},
        maxline: 1,
        titles: 'Email Address');
  }
}
