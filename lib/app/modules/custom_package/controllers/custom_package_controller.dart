import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/data/models/create_package_model.dart';
import 'package:nourish_sa/app/data/models/experience_model.dart';

import '../../../data/services/analytics_service.dart';

class CustomPackageController extends GetxController {
  TextEditingController heightTextEditingController = TextEditingController();
  final TextEditingController weightTextEditingController =
      TextEditingController();
  final TextEditingController targetWeightTextEditingController =
      TextEditingController();
  bool isMaleSelected = false;
  bool isFemaleSelected = false;
  String mainGoal = '';
  List<int> selectedMeals = [];
  String? birtdate;
  double? height;
  String? heightType;
  RxBool isCmSelected = true.obs;
  RxBool isFeetSelected = false.obs;
  RxBool isPoundSelected = true.obs;
  RxBool isKilogramSelected = false.obs;
  List<ExperienceItem> experiencesList = [
    ExperienceItem(id: 1, key: LocalKeys.kNoExperience.tr),
    ExperienceItem(id: 2, key: LocalKeys.kLightExercise.tr),
    ExperienceItem(id: 3, key: LocalKeys.kModerateExercise.tr),
    ExperienceItem(id: 4, key: LocalKeys.kHardExercise.tr),
    ExperienceItem(id: 5, key: LocalKeys.kExtremelyActive.tr),
  ];
  List<bool>? isExperienceSelected;
  int experienceIndex = 0;
  CreatePackageModel? packageModel;
  @override
  void onInit() async {
    super.onInit();

    AnalyticsService.instance.logEvent("Gender_View");
    // experiencesList = await ExperienceApis().getExperience();
  }

  void changeMale(bool newVal) {
    isMaleSelected = newVal;
    update();
  }

  void changeFemale(bool newVal) {
    isFemaleSelected = newVal;
    update();
  }

  void setBirthdate(String newVal) {
    birtdate = newVal;
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

  void setMealsNeeded(int i) {
    if (selectedMeals.contains(i)) {
      selectedMeals.remove(i);
    } else {
      selectedMeals.add(i);
    }
    update();
  }
}
