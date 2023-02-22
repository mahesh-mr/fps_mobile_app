// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:fps/view/screens/dummy/dummy.dart';
// import 'package:get/get.dart';
// class TestModel2 {
//   int? code;
//   List<Taluk>? data;
//   bool? success;

//   TestModel2({this.code, this.data, this.success});

//   TestModel2.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     if (json['data'] != null) {
//       data = <Taluk>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//     success = json['success'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['code'] = this.code;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['success'] = this.success;
//     return data;
//   }
// }

// class Data {
//   int? id;
//   String? name;
//   int? districtId;

//   Data({this.id, this.name, this.districtId});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     districtId = json['district_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['district_id'] = this.districtId;
//     return data;
//   }
// }



// class ApiService {
//   static Future<dynamic?> testService() async {
//     try {
//       var response =
//           await Dio().get('http://192.168.1.9:8080/api/get_allTaluk');
//       TestModel2 model = TestModel2.fromJson(response.data);
//       print("${model.data}--00---00");
//       print("${model}---====");
//       return model;
//     } on DioError catch (e) {
//       print(e);
//       print(e.error);
//       print(e.message);
//       print(e.response);
//       print(e.type);
//     } catch (e) {
//       print(e);
//     }
  

//     SocketException(e) {
//       print(e);
//     }

//     return null;
//   }
// }

// class ApiController extends GetxController {

//   TestModel2 testmodel2 = TestModel2();
//   var isloding =true.obs;
//   Future<TestModel2?> testController() async {
//     try {
//       var data = await ApiService.testService();
//       testmodel2 = data!;
//       isloding.value=false;

//       return testmodel2;
//     } catch (e) {
//       print(e);
//             isloding.value=false;
//     }
//   }

//   @override
//   void onInit() {
//     testController().then((value) => testmodel2=value!);
//     super.onInit();
//   }
// }

// class ApiClass2 extends StatelessWidget {
//   const ApiClass2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final apiController = Get.put(ApiController());

//     return  Scaffold(
//       body: Obx(
//        () {
//         if (apiController.isloding.value) {
//           Center(child: CircularProgressIndicator(),);
          
//         }
//           return ListView.builder(
//                 itemCount:
//               //  10,
//               apiController.testmodel2.data!.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(apiController.testmodel2.data![index].name!),
//                   );
//                 },
//               );
//         }
//       ),
//     );
  
//   }
// }
