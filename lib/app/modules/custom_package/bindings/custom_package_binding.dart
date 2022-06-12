import 'package:get/get.dart';

import '../controllers/custom_package_controller.dart';

class CustomPackageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomPackageController>(
      () => CustomPackageController(),
    );
  }
}
