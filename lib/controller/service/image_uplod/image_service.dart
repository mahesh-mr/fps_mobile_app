import 'dart:io';

// import 'package:dio/dio.dart';

import "package:async/async.dart";
import 'package:fps/controller/image_capture_controller/image_controller.dart';
import 'package:fps/controller/service/dioclint/dio_clint.dart';
import 'package:fps/controller/service/dioclint/token/token.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http_parser/http_parser.dart';

import 'package:dio/dio.dart';

class ImageService {
  static Future<String?> imageUpolodService(
    String shopimagePath,
    // String sinaturePath,
  ) async {
    ImageUplodController imageuplod = Get.put(ImageUplodController());
    MultipartFile? signatureFilePath;
    GetStorage storeage =GetStorage();
    storeage.read('signature');

    print("${ storeage.read('signature')}     ===store img");

    String? survayId = GetLocalStorage.getfpsId('sId');
    try {
      print("${ storeage.read('signature')}===path");
      //  String? sinaturePaths;
      MultipartFile placeFilePath = await MultipartFile.fromFile(shopimagePath,
          filename: shopimagePath, contentType: MediaType('image', 'jpg'));
       storeage.read('signature') == null
          ? ""
          : signatureFilePath = await MultipartFile.fromFile(
              storeage.read('signature'),
              filename:  storeage.read('signature'),
              contentType: MediaType('image', 'jpg'));
      print("${ storeage.read('signature')}======55");
      FormData formData = FormData.fromMap({
        'shop_image': placeFilePath,
        'signature_image': signatureFilePath,
        'survey_id':survayId
      });

      var response = await DioClient.dio.post(
        '/save_survey_document',
        data: formData,
      );
      print("$survayId === ");
      print("response called");

      print(response.data);
      return "success";
    } on DioError catch (e) {
      print(e);
      print("Dio error");
      print(e.response?.data);
      print("${e.error}==ii");
      print("${e.message}==ieeei");
      print("${e.response!.data}==errors");
      print(e.response!.statusMessage);

      return "flase";
    }
    // return null;
  }

  static Future<String?> imageUpolodService2(
    String shopimagePath,
  ) async {
    String? survayId = GetLocalStorage.getfpsId('sId');
    try {
      MultipartFile placeFilePath = await MultipartFile.fromFile(shopimagePath,
          filename: shopimagePath, contentType: MediaType('image', 'jpg'));

      FormData formData = FormData.fromMap({
        'shop_image': placeFilePath,
        //   'signature_image': signatureFilePath ,
        'survey_id': survayId
      });

      print("${formData}===fomdata");
      print("${placeFilePath}===filepath place");
      // print("${signatureFilePath}===filepath siggnature");
      var response = await DioClient.dio.post(
        '/save_survey_document',
        data: formData,
      );

      print("response called");

      print(response.data);
      return "success";
    } on DioError catch (e) {
      print(e);
      print("Dio error");
      print(e.response?.data);
      print("${e.error}==ii");
      print("${e.message}==ieeei");
      print("${e.response!.data}==errors");
      print(e.response!.statusMessage);

      return "flase";
    }
    // return null;
  }
}

class ImageUplodModelClass {
  File shopImage, signatureImage;
  String sureyId;

  ImageUplodModelClass(
      {required this.shopImage,
      required this.signatureImage,
      required this.sureyId});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["shop_image"] = shopImage.path;
    data["signature_image"] = shopImage.path;
    return data;
  }

  Map<String, dynamic> surveyId() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["survey_id"] = sureyId;

    return data;
  }
}
