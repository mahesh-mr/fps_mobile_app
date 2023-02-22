import 'package:fps/controller/service/profie_service/profile_service.dart';
import 'package:fps/model/month_wise_model/month_wise_inspection.dart';
import 'package:fps/model/profile/profile_model.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{

  RxBool loding = true.obs;
  ProfileModel? profileModel =ProfileModel();
InspectionMonthwiseModel ?inspectionMonthwiseModel =InspectionMonthwiseModel();
InspectionMonthwiseModel ?inspectionMonthwiseModels =InspectionMonthwiseModel();

  Future <ProfileModel?>getProfileService()async{
try {
  var data =await  ProfileService.profileService();
 loding.value = false;
      return data;
    } catch (e) {
      Get.snackbar('warnig', 'Please check Internet Connection');
      print(e);
      print('catch bloc called');
      loding.value = false;
    }
  return null;
  }
  

  

  Future <InspectionMonthwiseModel?>getInspectionMonth()async{
try {
  var mothwisedata =await  ProfileService.mothInspectionService();
 loding.value = false;
      return mothwisedata;
    } catch (e) {
      Get.snackbar('warnig', 'Please check Internet Connection');
      print(e);
      print('catch bloc called');
      loding.value = false;
    }
  return null;
  }
  Future <InspectionMonthwiseModel?>getInspectios()async{
try {
  var mothwisedata =await  ProfileService.totoelInspection();
 loding.value = false;
      return mothwisedata;
    } catch (e) {
       Get.snackbar('warnig', 'Please check Internet Connection');
      print(e);
      print('catch bloc called');
      loding.value = false;
    }
  return null;
  }



  @override
  void onInit() {
   getProfileService().then((value) => profileModel=value);
   getInspectionMonth().then((value) => inspectionMonthwiseModel=value);
   getInspectios().then((value) => inspectionMonthwiseModels=value);
    super.onInit();
  }
}