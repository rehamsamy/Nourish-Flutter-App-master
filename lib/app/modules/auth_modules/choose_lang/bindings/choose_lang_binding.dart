import 'package:get/get.dart';

import '../controllers/choose_lang_controller.dart';

class ChooseLangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChooseLangController>(
      () => ChooseLangController(),
    );
  }
}
