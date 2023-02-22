// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';

class TostClass {
  static successTost(
    BuildContext context,
    String title,
  ) {
    MotionToast.success(
      description: Text(title),
      title: Text('success'),
    ).show(context);
  }

  static errorTost(
    BuildContext context,
    String description,
    String title,
  ) {
    MotionToast.error(
      description: Text(title),
      title: Text(description),
    ).show(context);
  }

  static warningTost(
    BuildContext context,
  ) {
    MotionToast.warning(
      description: Text("Please fill the all feilds"),
      title: Text("Warning"),
    ).show(context);
  }

  static customWarningTost(BuildContext context, String message) {
    MotionToast.warning(
      description: Text("Please select ${message}"),
      title: Text("Warning"),
    ).show(context);
  }
  static customWarningTostCamera(BuildContext context, String message) {
    MotionToast.warning(
      description: Text("Please capture ${message}"),
      title: Text("Warning"),
    ).show(context);
  }

  static Future <bool>willPopp(
    DateTime? lastpressed,
       BuildContext context) async {
        final now = DateTime.now();
          final maxDuration = Duration(seconds: 2);
          final isWarning =
              lastpressed == null || now.difference(lastpressed) > maxDuration;
          if (isWarning) {
            lastpressed = DateTime.now();
            final snackBar = SnackBar(
              content: Text(
                'Duble Tap to close app',
              ),
              duration: maxDuration,
            );
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(snackBar);
              return false;
          }else{
            return true;
          }
        
}
}
// class BackScope {
//   DateTime? lastpressed;
//   BackScope({
//     required this.lastpressed,
//   });
//   final now = DateTime.now();
//           final maxDuration = Duration(seconds: 2);
//           final isWarning =
//               lastpressed == null || now.difference(lastpressed!) > maxDuration;
//           if (isWarning) {
//             lastpressed = DateTime.now();
//             final snackBar = SnackBar(
//               content: Text(
//                 'Duble Tap to close app',
//               ),
//               duration: maxDuration,
//             );
//             ScaffoldMessenger.of(context)
//               ..removeCurrentSnackBar()
//               ..showSnackBar(snackBar);
//               return false;
//           }else{
//             return true;
//           }
  


     

// }
