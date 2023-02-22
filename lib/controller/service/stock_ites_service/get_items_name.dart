import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fps/controller/service/dioclint/dio_clint.dart';
import 'package:fps/controller/service/dioclint/token/token.dart';
import 'package:fps/model/get_items_model/get_item.dart';

class GetItemsNameService {
  static Future<List<Rows>?> getItemName() async { String? token = GetLocalStorage.getUserIdAndToken('token');
    try {
      var response = await DioClient.dio.get('/getAll_items',options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      GetItemModel? items =GetItemModel.fromJson(response.data);
      return items.data!.rows;
     } on DioError catch (e) {
      
      print("6656566565656556565  dist");
      print("${e.response!.data}===========");
      print("${e.message}=fdsfg=fd");
    } catch (e) {
      print("$e");
    }
    return null;
  }
}
