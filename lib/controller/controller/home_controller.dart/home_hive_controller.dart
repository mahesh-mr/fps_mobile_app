import 'package:fps/model/home_models/home_local_storage/home_local_storage.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomeHiveModel extends GetxController {
  final box = Hive.box<HomeLocalStorage>(boxname);
  RxList<HomeLocalStorage> homeHiveModel = <HomeLocalStorage>[].obs;

  getHomeHiveStorage() {
    homeHiveModel.value = box.values.toList();
  }

  addTestName(HomeLocalStorage hiveModel) {
    box.add(hiveModel);
    getHomeHiveStorage();
  }

  closeHiveData() {
    box.clear();
    getHomeHiveStorage();
  }
  updateStudent(int index, HomeLocalStorage hiveModel){
  box.putAt(index, hiveModel );
  getHomeHiveStorage();
}

  @override
  void onInit() {
    getHomeHiveStorage();
    super.onInit();
  }
}
