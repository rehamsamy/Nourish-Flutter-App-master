import 'package:get/get.dart';

class CustomPackageController extends GetxController {
  //TODO: Implement CustomPackageController
 bool isMaleSelected=false;
 bool isFemaleSelected=false;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void changeMale(bool newVal){
    isMaleSelected=newVal;
    Get.log('cccc '+newVal.toString());
    update();
  }
 void changeFemale(bool newVal){
   isFemaleSelected=newVal;
   Get.log('cccc '+newVal.toString());
   update();
 }
}
