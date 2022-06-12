import 'package:get/get.dart';

import '../controllers/delivery_time_controller.dart';

class DeliveryTimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeliveryTimeController>(
      () => DeliveryTimeController(),
    );
  }
}
