import 'package:get/get.dart';
import 'package:nourish_sa/app/data/services/localization_service.dart';

class ChooseLangController extends GetxController {
  RxBool isSelected = Get.find<LocalizationService>().isAr() ? true.obs : false.obs;

  onChangeLang() {
    isSelected.value = !isSelected.value;
    Get.find<LocalizationService>()
        .setLocale(!Get.find<LocalizationService>().isAr() ? "ar" : "en");
  }
}
