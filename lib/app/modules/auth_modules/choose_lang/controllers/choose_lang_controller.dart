import 'package:get/get.dart';
import 'package:nourish_sa/app/data/services/localization_service.dart';

import '../../../../data/services/analytics_service.dart';

class ChooseLangController extends GetxController {
  RxBool isSelected =
      Get.find<LocalizationService>().isAr() ? true.obs : false.obs;

  @override
  void onInit() {
    AnalyticsService.instance.logEvent("Choose_Lang_View");
    super.onInit();
  }

  onChangeLang() {
    isSelected.value = !isSelected.value;
    Get.find<LocalizationService>()
        .setLocale(!Get.find<LocalizationService>().isAr() ? "ar" : "en");
  }
}
