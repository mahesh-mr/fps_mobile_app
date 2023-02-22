import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fps/controller/service/dioclint/token/token.dart';
import 'package:fps/model/home_models/home_local_storage/home_local_storage.dart';
import 'package:fps/view/screens/camerScreen/camera_signature.dart';
import 'package:fps/view/screens/items_list/items_list.dart';
import 'package:fps/view/screens/items_list/other_items/other_items.dart';
import 'package:fps/view/screens/navebar_screen/navbar.dart';
import 'package:fps/view/screens/balance_caards/rationcard.dart';
import 'package:fps/view/screens/screen_splash/splash_screen.dart';
import 'package:fps/view/screens/witness_screen/withness_1_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String? token = GetLocalStorage.getUserIdAndToken("token");
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) {
          return GetMaterialApp(
              title: 'FPS Mobileapp',
              theme: ThemeData(
                primarySwatch: Colors.red,
              ),
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''), // English, no country code
                Locale('es', ''), // Spanish, no country code
              ],
//home: OtherItemsList());
//home:RationCardNumbers());
//home: MyTest());
           home: token == null ? SplashScreen() : NavBarScreen());
        });
  }
}
