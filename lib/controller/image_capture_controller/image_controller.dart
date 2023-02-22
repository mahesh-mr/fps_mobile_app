import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageUplodController extends GetxController {
  var  isLoding=false.obs;
  GetStorage storage =GetStorage();
  String? imagePath;
  String? siganatureImagePath;
  final ImagePicker imagePicker = ImagePicker();
  final ImagePicker signimagePicker = ImagePicker();

  //plce=================================

  Future placePicImage() async {
    var image = await imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 30,
       );
    if (image == null) return;
    final imageTemporary = image.path;
    imagePath = imageTemporary;
    print("$imageTemporary======= image");
   
    // Get.back();
    update();
  }

  //signature==================================
  Future sinaturePicImage() async {
   var image = await signimagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 30,);
    if (image == null) return;
    final imageTemporarys = image.path;
    siganatureImagePath = imageTemporarys;
    print("$imageTemporarys======= image");
     storage.write('signature', siganatureImagePath);
     print("${ storage.read('signature')}     ===store img11");
    // Get.back();
    update();
  }
}
