import 'package:fps/view/screens/navebar_screen/navbar.dart';
import 'package:fps/view/screens/qution_air/page_view.dart';
import 'package:fps/view/screens/screen_home/home_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GetLocalStorage extends GetxController {
  static final storage = GetStorage();

//save=====================
  static saveToken(Map<String, dynamic> user) {
    storage.write("token", user['token']);
    storage.write('id', user['id']);
  }

  //Get_User_Details=====================
  static String? getUserIdAndToken(String key) {
    String? user = storage.read<String?>(key);
    return user;
  }

  removed(String key) {}

  //<<<<<Remove_User_Details>>>>>//
  removeUserTokenAndUid() {
    storage.remove("id");
    storage.remove("token");

    update();
    //onClose();
  }

  //store survey id and fpsno//==========
  //=====================================
  static saveFpsnum(Map<String, dynamic> newServay) {
    storage.write('sId', newServay['sId']);
    storage.write('fps_no', newServay['fps_no']);
  }

  static String? getfpsId(String key) {
    String? newServay = storage.read<String?>(key);
    return newServay;
  }

  removeUserremovedSId() {
    storage.remove("sId");
    storage.remove("fps_no");

    update();
   // onClose();
  }
// @override
//   void refresh() {
//   NavBarScreen();  print(" refresh called");
//    QustionPage();
//     super.refresh();
//   }
//   @override
  // void onClose() {
  //   removeUserTokenAndUid();
  //   removeUserremovedSId();
  //   // storage.remove("id");
  //   // storage.remove("token");
  //   // storage.remove("sId");
  //   // storage.remove("fps_no");
  //   HomeScreen();
  //   QustionPage();
  //   print(" onClose called");
  //   super.onClose();
  }





// class GetfpsStorage {
//   static final store = GetStorage();

//   static saveFpsnum(Map<String, dynamic> newServay) {
//     store.write('sId', newServay['sId']);
//     store.write('fps_no', newServay['fps_no']);
//   }

  

//   static removedSId(String key) {}

//   //<<<<<Remove_User_Details>>>>>//
 
// // static removedfps(String key){
// //   Future <void>newServay=
// // }
// }

// // class TokenClass {
// //   Future _Getchallenge() async {
// //     String? token;
// //     final prefs = await SharedPreferences.getInstance();
// //     token = prefs.getString('token');

// //     // prefs.setString('token', response.data["token"].toString());
// //   }
// // }
