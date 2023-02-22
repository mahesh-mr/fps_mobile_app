import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fps/controller/service/dioclint/dio_clint.dart';
import 'package:fps/controller/service/dioclint/token/token.dart';
import 'package:fps/view/style/style.dart';
import 'package:get/get.dart';

class RationCardNumbersService {  
  static Future<dynamic?> balanceCard({
    required params,
  }) async { String? token = GetLocalStorage.getUserIdAndToken('token');
    String? cardNo;
    String? surveyId;
    [
      {
        "card_no": cardNo,
        "survey_id": surveyId,
      }
    ];
    var data = json.encode(params);

    try {
      var response = await   DioClient.dio
          .post('/rationCard_numbers', data: data,options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      print(response.data);
      return "success";
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
    } catch (e) {
      print(e);
    } on SocketException {
      throw "no net work";
    }
    return null;
  }
}
