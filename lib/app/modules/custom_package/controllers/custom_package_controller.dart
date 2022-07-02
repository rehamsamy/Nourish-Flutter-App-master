import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/experience_model.dart';
import 'package:nourish_sa/app/data/remote_data_sources/experience_apis.dart';

import '../../../data/services/analytics_service.dart';

class CustomPackageController extends GetxController {
  //TODO: Implement CustomPackageController
  TextEditingController heightTextEditingController = TextEditingController();
  final TextEditingController weightTextEditingController =
      TextEditingController();
  final TextEditingController targetWeightTextEditingController =
      TextEditingController();
  bool isMaleSelected = false;
  bool isFemaleSelected = false;
  String? birtdate;
  double? height;
  String? heightType;
  RxBool isCmSelected = true.obs;
  RxBool isFeetSelected = false.obs;
  RxBool isPoundSelected = true.obs;
  RxBool isKilogramSelected = false.obs;
  List<ExperienceItem>? experiencesList;
  List<bool>? isExperienceSelected;
  int experienceIndex = 0;
  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();

    AnalyticsService.instance.logEvent("Gender_View");
    experiencesList = await ExperienceApis().getExperience();
    isExperienceSelected =
        List<bool>.filled(experiencesList?.length ?? 0, false);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void changeMale(bool newVal) {
    isMaleSelected = newVal;
    Get.log('cccc ' + newVal.toString());
    update();
  }

  void changeFemale(bool newVal) {
    isFemaleSelected = newVal;
    Get.log('cccc ' + newVal.toString());
    update();
  }

  void setBirthdate(String newVal) {
    birtdate = newVal;
    Get.log('cccc ' + newVal.toString());
    update();
  }

  void setHeightType(String newVal) {
    heightType = newVal;
    update();
  }

  void setHeight(double newVal) {
    height = newVal;
    update();
  }

  void setCmSelected(bool newVal) {
    isCmSelected.value = newVal;
  }

  void setFeetSelected(bool newVal) {
    isFeetSelected.value = newVal;
  }

  void setPoundSelected(bool newVal) {
    isPoundSelected.value = newVal;
  }

  void setKiloGramSelected(bool newVal) {
    isKilogramSelected.value = newVal;
  }

  void setExperienceSelect(bool newVal, int index) {
    isExperienceSelected?[index] = newVal;
    update();
  }

  void setExperienceIndex(int newVal) {
    experienceIndex = newVal;
    update();
  }
}
