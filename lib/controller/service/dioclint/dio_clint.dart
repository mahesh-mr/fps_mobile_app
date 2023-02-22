

import 'package:dio/dio.dart';

class DioClient{
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://13.231.84.176:8080/api",
      // http://13.231.84.176:8080/api

    ),
  );
}

class DioClientLogin {
  static Dio dio =
      Dio(BaseOptions(baseUrl: "http://13.231.84.176:8080/pub",));
}