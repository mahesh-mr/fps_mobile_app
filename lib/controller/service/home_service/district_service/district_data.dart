import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fps/controller/controller/confirm_owner_controller/confirm_owner_controller.dart';
import 'package:fps/controller/service/dioclint/dio_clint.dart';
import 'package:fps/controller/service/dioclint/token/token.dart';
import 'package:fps/model/all_fps_number_model/all_fps_number_model.dart';
import 'package:fps/model/all_fps_numbers_model/all_fps_model_number.dart';

import 'package:fps/model/home_models/distric_model/district_model.dart';
import 'package:fps/model/home_models/firka_model/firka.dart';
import 'package:fps/model/home_models/taluk_model/taluk.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DistrictDataService {
  static districService() async {
    String? token = GetLocalStorage.getUserIdAndToken('token');
    try {
      var response = await DioClient.dio.get(
        "/get_allDistrict",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      DistrictModel districtdata = DistrictModel.fromJson(response.data);
      //  log("${response.data}==============");

      return districtdata;
    } on DioError catch (e) {
      log('errorrrrr=====!');
      log("6656566565656556565  dist");
      log("${e.response!.data}=========== dis no wok");
      log("${e.message}=fdsfg=fd");
    } catch (e) {
      log("$e");
    }
    return null;
  }

  static talukService() async {
    String? token = GetLocalStorage.getUserIdAndToken('token');
    try {
      var response = await DioClient.dio.get(
        "/get_allTaluk"
        //  'http://18.180.86.118:5000/api/v1/taluk',
        ,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      TalukModel talukData = TalukModel.fromJson(response.data);
      //  log("${response.data}==============");

      return talukData;
    } on DioError catch (e) {
      log('errorrrrr=====!');
      log("6656566565656556565");
      log("${e.response!.data}===========");
      log("${e.message}=fdsfg=fd");
    } catch (e) {
      log("$e");
    }
    return null;
  }

  static firkaService() async {
  // 
    String? token = GetLocalStorage.getUserIdAndToken('token');
    try {
      var response = await DioClient.dio.get(
        "/get_allFirka"
        //  'http://18.180.86.118:5000/api/v1/firka',
        ,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      FirkaModel firkaData = FirkaModel.fromJson(response.data);
 
      //  log("${response.data}==============");

      return firkaData;
    } on DioError catch (e) {
      log('errorrrrr=====!');
      log("6656566565656556565");
      log("${e.response!.data}===========");
      log("${e.message}=fdsfg=fd");
    } catch (e) {
      log("$e");
    }
    return null;
  }
}
