import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fps/controller/service/dioclint/dio_clint.dart';
import 'package:fps/controller/service/dioclint/token/token.dart';
import 'package:fps/view/style/style.dart';
import 'package:get/get.dart';

class RemarkService {
  static Future<dynamic> remarkService({
    required String surveyId,
    required String remarks,
  }) async {
    String? token = GetLocalStorage.getUserIdAndToken('token');
    try {
      var response = await DioClient.dio.post(
        '/save_remark',
        data: {
          "survey_id": surveyId,
          "remarks": remarks,
        },
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

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
       'SocketException',
        backgroundColor: yellow,
      );

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

  static Future<dynamic> addRemarkService({
    required String remark3,
    required String remarks11,
    required String remarks15,
    required String remarks18,
    required String remark23,
  }) async {
    String? survayId = GetLocalStorage.getfpsId('sId');
    String? token = GetLocalStorage.getUserIdAndToken('token');
    try {
      print("${remarks11}==11 11");
      print("${remarks15}==12 12");
      print("${remarks18}==13 13");
      print("${remarks18}==13 3");
      print("${remarks18}==13 23");
      var response = await
          //  DioClient.dio.post(
          //   '/save_remark',

          DioClient.dio.post(
        '/admin/addRemarks',
        data: {
          "survey_id": survayId,
          "remark11": remarks11,
          "remark15": remarks15,
          "remark18": remarks18,
          'remark3': remark3,
          'remark23': remark23
        },
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      print("${remarks11}==11");
      print("${remarks15}==12");
      print("${remarks18}==13");
      print("${remark3}==3");
      print("${remark23}==23");

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
