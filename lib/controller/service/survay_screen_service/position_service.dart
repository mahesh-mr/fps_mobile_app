import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fps/controller/controller/confirm_owner_controller/confirm_owner_controller.dart';
import 'package:fps/controller/service/dioclint/dio_clint.dart';
import 'package:fps/controller/service/dioclint/token/token.dart';
import 'package:fps/model/all_fps_number_model/all_fps_number_model.dart';
import 'package:fps/model/survey_model/position_model.dart';
import 'package:get/get.dart';

class PositionService {
  static positionService() async { 
   
    String? token = GetLocalStorage.getUserIdAndToken('token');
    try {
      var response = await DioClient.dio.get('/get_allRole',options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      PositionModel model = PositionModel.fromJson(response.data);
 
      log("${model.data}--00---00");
      log("$model---====");
      return model;
    } on DioError catch (e) {
      log("$e");
      log(e.error);
      log(e.message);
      log("${e.response}");
      log("${e.type}");
    } catch (e) {
      log("$e");
    }


    return null;
  }
  
  static allFpsNumber() async {
     
      
    
    //  String? token = GetLocalStorage.getUserIdAndToken('token');
    try {
      var response =
          await Dio().get
        
        ("http://18.180.86.118:5000/api/v1/fps_reg_dealerAll");
      print(response.data);
  
      AllFpsNumberModel firkaData = AllFpsNumberModel.fromJson(response.data);
    //  confirmOwner.confirmModel=(await confirmOwner.getConfirmService())!;



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
