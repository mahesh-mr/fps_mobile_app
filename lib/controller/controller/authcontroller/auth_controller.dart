// import 'package:fps/controller/service/auth_service/auth_service.dart';
// import 'package:fps/model/auth_model/auth_model.dart';
// import 'package:get/get.dart';

// class AuthController extends GetxController {
//   var isvisible = true.obs;
//   var isLoding = false.obs;
//   AuthModel? loginModel;
//   Future<dynamic> authController(authModel) async {
//     try {
//       var data = AuthService.loginUser(authModel: authModel);
//       isLoding.value = true;
//       AuthModel model = authModelFromJson(data.toString());
//       isLoding.value = true;
//       loginModel = model;
//       isLoding.value = false;
//       print(loginModel);
//       print(data);
//       return "success";
//     } catch (e) {
//       isLoding.value = false;
//       print(e);
//     }
//   }
// }
