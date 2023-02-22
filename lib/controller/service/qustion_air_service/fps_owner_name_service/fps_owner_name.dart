import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fps/controller/service/dioclint/dio_clint.dart';
import 'package:fps/controller/service/dioclint/token/token.dart';
import 'package:fps/view/style/style.dart';
import 'package:get/get.dart';

class FpsOwnerNameService {
  static Future<String?> fpsOwnerName({
    required String fpsOwnerName,
    required String relation,
  }) async {
    try {
        String? survayId = GetLocalStorage.getfpsId('sId');
      var response =
          await DioClient.dio.put('/fspOwnerName_relation/$survayId',data: {
            "fps_owner_name":fpsOwnerName,
            "fps_relation":relation,
          });
             print("$survayId =======survey ids");
           print(response.data);  return "success";
         
    } on DioError catch (e) {
      print("Dio error");
      print(e.response!.data);
      print(e.response!.statusMessage);

      Get.snackbar(
        'Warning',
        e.response!.data['message'],
        backgroundColor: white,
      );

      if (e.type == DioErrorType.other) {
        Get.snackbar(
          'Warning',
          'No internet connection.',
          backgroundColor: white,
        );
        print("no internet");
        return "No internet connection";
      }

      if (e.response != null) {
        return e.response!.data['message'];
      }
      return "";
    }catch (e){
      print(e);
    }on SocketException {
      throw "no net work";
    }
  }
}
