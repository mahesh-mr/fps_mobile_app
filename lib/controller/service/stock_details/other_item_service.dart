import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fps/controller/controller/tost/tost.dart';
import 'package:fps/controller/service/dioclint/dio_clint.dart';
import 'package:fps/controller/service/dioclint/token/token.dart';
import 'package:fps/view/style/style.dart';
import 'package:get/get.dart';

class OtherStockDetaisSercive {
  static Future<String?> stockItemService({
    required String survayId,
    required String productName,
    required String assignedQuandity,
    required String physicalStock,
    required String diffrence,
    required String badsStock,
   // BuildContext? context,
  }) async {
    String? token = GetLocalStorage.getUserIdAndToken('token');
    try {
      var response = await DioClient.dio.post(
        '/save_other_items',
        data: {
          "survey_id": survayId,
          'product_name': productName,
          "assigned_quantity": assignedQuandity,
          "physical_stock": physicalStock,
          "differnce": diffrence,
          "bad_stock": badsStock,
        },
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      print(response.data);
      return "success";
    } on DioError catch (e) {
      // print("Dio error");
      // print(e.response!.data);
      // print(e.response!.statusMessage);
     // TostClass.errorTost(context!, 'error', e.response!.data['errorMessage']);
      Get.snackbar(
        'Warning',
        e.response!.data['errorMessage'],
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
