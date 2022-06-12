import 'package:get/get.dart';

import '../controllers/days_time_controller.dart';

class DaysTimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaysTimeController>(
      () => DaysTimeController(),
    );
  }
}
