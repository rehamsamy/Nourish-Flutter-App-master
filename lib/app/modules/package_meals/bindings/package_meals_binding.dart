import 'package:get/get.dart';

import '../controllers/package_meals_controller.dart';

class PackageMealsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PackageMealsController>(
      () => PackageMealsController(),
    );
  }
}
