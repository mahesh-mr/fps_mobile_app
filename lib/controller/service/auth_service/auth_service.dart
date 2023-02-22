import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fps/controller/controller/tost/tost.dart';
import 'package:fps/controller/service/dioclint/dio_clint.dart';
import 'package:fps/controller/service/dioclint/token/token.dart';
import 'package:fps/view/style/style.dart';
import 'package:get/get.dart';

class AuthService extends GetxController {
  var isvisible = true.obs;
   var isLoading = false.obs;

   Future<String?> loginUser({
    required String email,
    required String password,
    BuildContext? context,
  }) async {
//showLoading();
    try {
   //   isLoading.value=true;

      var response = await DioClientLogin.dio.post("/login", data: {
        "email": email,
        "password": password,
      });

      print(response.data);
      //saving token--
      Map<String, dynamic> user = {
        "token": response.data['data']['token'],
        'id': response.data['data']['user']['id'].toString(),
      };
      GetLocalStorage.saveToken(user);
      String? token = GetLocalStorage.getUserIdAndToken('token');
      String? userId =GetLocalStorage.getUserIdAndToken('id');
      print("${token}======================= tkn");
       print("${userId}======================= uid");
      return "success";
    } on DioError catch (e) {
      print("Dio error");
      print("${e.error}==ii");
      print("${e.message}==ieeei");
      print("${e.response!.data}==errors");
      print(e.response!.statusMessage);
      TostClass.errorTost(
          context!, 'error', e.response!.data['errorMessage']);
           Get.snackbar(
          'Warning',
         e.message,
          backgroundColor: white,
        );
         TostClass.errorTost(
          context, 'error', e.response!.
          
          
          
          
          data);
           Get.snackbar(
          'Warning',
         e.message,
          backgroundColor: white,
        );
          
     

      if (e.type == DioErrorType.other) {
        Get.snackbar(
          'Warning',
          'No internet connection.',
          backgroundColor: white,
        );

        return "No internet connection";
      }

      if (e.response != null) {
        return e.response!.data['message'];
      }
      return "flase";
    } catch (e) {
      print(e);
    } on SocketException {
      throw "no net work";
    }
    return null;
  }
  //   showLoading() {
  //   isLoading.value = true;
  //   Future.delayed(const Duration(seconds: 10), () {
  //     if (isLoading.value == true) {
  //       isLoading.value = false;
  //     }
  //   });
  // }

  // hideLoading() {
  //   isLoading.value = false;
  // }
}
