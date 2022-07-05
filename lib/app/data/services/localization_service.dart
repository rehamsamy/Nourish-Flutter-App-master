import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';
import 'package:restart_app/restart_app.dart';

class LocalizationService extends GetxService {
  @override
  void onInit() {
    Get.updateLocale(Locale(Get.find<SharedPrefService>().loadLocale()));
    super.onInit();
  }

  setLocale([bool isWithRestart = false]) async {
    await Get.find<SharedPrefService>()
        .saveLocale(Get.locale?.languageCode == 'ar' ? 'en' : 'ar');
    Get.updateLocale(Locale(Get.locale?.languageCode == 'ar' ? 'en' : 'ar'));
    if (isWithRestart) {
      Restart.restartApp();
    }
  }

  bool isAr() {
    return Get.locale?.languageCode == 'ar';
  }
}
