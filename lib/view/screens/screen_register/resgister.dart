// import 'package:clay_containers/clay_containers.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// import 'package:fps/view/screens/screen%20_login/login_screen.dart';
// import 'package:fps/view/screens/screen_register/widgets/custombutton.dart';
// import 'package:fps/view/screens/sreen_survay/widgets/survey_form_wiidget.dart';
// import 'package:fps/view/screens/test/test.dart';
// import 'package:fps/view/style/style.dart';
// import 'package:get/get.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class RegisteScreen extends StatelessWidget {
//   RegisteScreen({super.key});
//   final phone = TextEditingController();
//   final _passwodController = TextEditingController();
//   final username = TextEditingController();
//   final _fomkey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     phone.text='1234567823';
//     _passwodController.text="123456";
//     username.text ="mahesfhwe";

//     return Scaffold(
//       backgroundColor: bg,
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 40.w),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 70.h,
//               ),
//               const Text(
//                 "Register",
//                 style: TextStyle(fontWeight: FontWeight.bold, color: grey),
//               ),
//               Container(
//                 height: 180.h,
//                 width: 200.w,
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage('assets/3.png'),
//                   ),
//                 ),
//               ),
//               h20,
//               Text(
//                 "Welcome",
//                 style: welcomeText,
//               ),
//               h20,
//               const Text(
//                 "Hello there, Sign in",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: grey,
//                 ),
//               ),
//               h20,
//               Form(
//                 key: _fomkey,
//                 child: Column(
//                   children: [
//                     emailForm(),
//                   ],
//                 ),
//               ),
//               h20,
//               passwordForm(),
//               ClayContainer(
//                   color: white,
//                   borderRadius: 50.r,
//                   depth: 40,
//                   parentColor: white,
//                   spread: 2,
//                   child: CustomSurveyTextForm(
//                     controller: phone,
//                     textinputType: TextInputType.emailAddress,
//                     title: 'Phone',
//                     validator: (value) {
//                       if (value == null) {
//                         return "Required Field";
//                       } else if (!RegExp(r'^([0-9])$').hasMatch(value)) {
//                         return "Enter a valid email";
//                       } else {
//                         return null;
//                       }
//                     },
//                   )),
//               h30,
//               RichText(
//                 text: TextSpan(
//                   text: "You Have Already an Account ? ",
//                   style: const TextStyle(color: grey),
//                   children: [
//                     TextSpan(
//                         text: ' Login',
//                         style: const TextStyle(
//                             color: mainred, fontWeight: FontWeight.bold),
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = () => Get.to(LoginScreen()))
//                   ],
//                 ),
//               ),
//               h30,
//               CustomButton(
//                   btncolor: mainred,
//                   textColor: white,
//                   onPressed: () {
//                     bool isValid = _fomkey.currentState!.validate();

//                     if (isValid) {
//                       ApiService.login(name:username.text , password: _passwodController.text, phone: phone.text,).then((value) {
//                         if (value=='success') {

//                              Get.to(
//                       LoginScreen(),
//                     );
//                         }
//                       });
                      
//                     }
                  
                 
//                     // bool isValid = _fomkey.currentState!.validate();
//                     // if (isValid) {
//                     //   Get.to(
//                     //     LoginScreen(),
//                     //   );
//                     // }
//                   },
//                   title: 'Register')
//             ],
//           ),
//         ),
//       ),
//     );
//   }

// //PASSWORD============================================
//   ClayContainer passwordForm() {
//     return ClayContainer(
//       color: white,
//       borderRadius: 50.r,
//       depth: 40,
//       parentColor: white,
//       spread: 2,
//       child: CustomSurveyTextForm(
//         controller: _passwodController,
//         // maxline: 1,
//         textinputType: TextInputType.text,
//         title: 'Password',
//         validator: (value) {
//           // if (value!.isEmpty) {
//           //   return "Password minimum  1 length";
//           // } else if (!RegExp(r'(^[a-z A-Z]+$)').hasMatch(value)) {
//           //   return 'valid Passsworsd';
//           // } else {
//           //   return null;
//           // }
//         },
//       ),
//     );
//   }

//   //EMAIL===========================================================

//   ClayContainer emailForm() {
//     return ClayContainer(
//       color: white,
//       borderRadius: 50.r,
//       depth: 40,
//       parentColor: white,
//       spread: 2,
//       child: CustomSurveyTextForm(
//         controller: username,
//         textinputType: TextInputType.emailAddress,
//         title: 'name',
//         validator: (value) {
//           if (value!.length == 0) {
//             return "Enter your name";
//           } else if (!RegExp(r'(^[a-z A-Z]+$)').hasMatch(value)) {
//             return 'Please enter a valid name';
//           } else {
//             return null;
//           }
//         },
//       ),
//     );
//   }
// }
