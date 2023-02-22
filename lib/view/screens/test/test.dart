import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fps/view/style/style.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<String?> login({
    required String name,
    required String password,
    required String phone,
  //  required bool vipmaMember,
  }) async {
    try {
      var response = await http
          .post(Uri.parse('http://192.168.1.16:8080/pub/register'), body: {
        "name": name,
        "password": password,
        "phone": phone,
      //  vipmaMember: vipmaMember,
      });

      if (response.statusCode == 201) {
        var data = jsonDecode(response.body);
        //print(data['token']);
        print(data);
        print('Login successfully');
      } else {
        print('failed');
      }
      return 'success';
    } catch (e) {
      print(e.toString());
      print("${e}====");
    }
    return null;
  }

//   static Future<String?> loginUser({
//     required String name,
//     required String password,
//     required String phone,
//   //  required bool vipmaMember,
//   }) async {
//     try {
//       var response = await Dio().post("http://192.168.1.16:8080/pub/register",
//           data: {
//             "name": name,
//             "password": password,
//             "phone": phone,
//            // "vipmaMember": vipmaMember
//           });

//       print(response.data);
//       print(response);
//       return "success";
//     } on DioError catch (e) {
//       print("Dio error");
//       print(e.response!.data);
//       print(e.response!.statusMessage);

//       Get.snackbar(
//         'Warning',
//         e.response!.data['message'],
//         backgroundColor: white,
//       );

//       if (e.type == DioErrorType.other) {
//         Get.snackbar(
//           'Warning',
//           'No internet connection.',
//           backgroundColor: white,
//         );
//         print("no internet");
//         return "No internet connection";
//       }

//       if (e.response != null) {
//         return e.response!.data['message'];
//       }
//       return "";
//     } catch (e) {
//       print(e);
//     } on SocketException {
//       throw "no net work";
//     }
//     return null;
//   }
}
