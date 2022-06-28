import 'package:get/get.dart';

class CustomPackageController extends GetxController {
  //TODO: Implement CustomPackageController
 bool isMaleSelected=false;
 bool isFemaleSelected=false;
 String ? birtdate ;
 double ?height;
 String ?heightType;
 RxBool isCmSelected=true.obs;
 RxBool isFeetSelected=true.obs;

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

 void setBirthdate(String newVal){
   birtdate=newVal;
   Get.log('cccc '+newVal.toString());
   update();
 }

 void setHeightType(String newVal){
    heightType=newVal;
    update();
 }

 void setHeight(double newVal){
   height=newVal;
   update();
 }

 void setCmSelected(bool newVal){
   isCmSelected.value=newVal;
 }

 void setFeetSelected(bool newVal){
   isFeetSelected.value=newVal;
 }



}
