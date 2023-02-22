import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fps/controller/service/dioclint/dio_clint.dart';
import 'package:fps/controller/service/dioclint/token/token.dart';
import 'package:fps/view/style/style.dart';
import 'package:get/get.dart';

class WitnessService {
  static Future<dynamic> witnessService({
    required String name,
    required String cardNo,
    required String survayId,
    required String number,
  }) async {String? token = GetLocalStorage.getUserIdAndToken('token');
    try {
      var response = await
     DioClient.dio.post('/save_witness_details',data: { "name": name,
        "card_no": cardNo,
        "survey_id": survayId,
        "mob": number,
      },options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      
      
      //  DioClient.dio.post('save_witness_details', data: {
      //   "name": name,
      //   "card_no": cardNo,
      //   "survey_id": survayId,
      //   "mob": number,
      // });
      print(response.data);

      return "success";
    } on DioError catch (e) {
      print("Dio error");
      print("${e.error}==ii");
      print("${e.message}==ieeei");
      print("${e.response!.data}==errors");
      print(e.response!.statusMessage);

      Get.snackbar(
        'Warning',
        e.response!.data['SocketException'].toString(),
        backgroundColor: yellow,
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
}
