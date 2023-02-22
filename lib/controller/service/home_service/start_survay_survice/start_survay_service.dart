import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fps/controller/controller/tost/tost.dart';
import 'package:fps/controller/service/dioclint/dio_clint.dart';
import 'package:fps/controller/service/dioclint/token/token.dart';
import 'package:fps/view/style/style.dart';
import 'package:get/get.dart';

class StartSurvay {
  static Future<String?> startSuvey({
    required String district,
    required String taluk,
    required String firka,
    required String inspection_date,
    required String user_id,
    required String fps_no,
    required String previous_inspector_name,
    required String last_inspection_date,
    required String previous_inspector_position,
    BuildContext? context,
  }) async {
    String? token = GetLocalStorage.getUserIdAndToken('token');
    try {
      var response = await DioClient.dio.post(
        "/create_survey",
        data: {
          'district': district,
          "taluk": taluk,
          "firka": firka,
          "inspection_date": inspection_date,
          "user_id": user_id,
          'fps_no': fps_no,
          "previous_inspector_name": previous_inspector_name,
          "last_inspection_date": last_inspection_date,
          "previous_inspector_position": previous_inspector_position,
        },
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      //  DioClient.dio.post('/set_survey_step1', data: {
      // 'district': district,
      // "taluk": taluk,
      // "firka": firka,
      // "inspection_date": inspection_date,
      // "user_id": user_id
      // });
      print(response.data);
      Map<String, dynamic> servayId = {
        "fps_no": response.data['data']['fps_no'].toString(),
         'sId': response.data['data']['sId'].toString(),
      };
      // GetLocalStorage.getUserIdAndToken('survayId');
      GetLocalStorage.saveFpsnum(servayId);

      String? tn = GetLocalStorage.getfpsId('sId');
      String? fpsId = GetLocalStorage.getfpsId('fps_no');
       print("${tn}===== surveyId");
      print("${fpsId}===== fps");

      return "success";
    } on DioError catch (e) {
      print("Dio error");
      print(e.response!.data);
      print(e.response!.statusMessage);
      TostClass.errorTost(context!, 'error', e.response!.statusMessage!);
      // TostClass.errorTost(
      //     context, 'error', e.response!.data['errorMessage']);

      // Get.snackbar(
      //   'Warning',
      //   e.response!.data['message'],
      //   backgroundColor: white,
      // );

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
    } catch (e) {
      print(e);
    } on SocketException {
      throw Get.snackbar('Errorr', 'No Network');
    }
    return null;
  }
}
