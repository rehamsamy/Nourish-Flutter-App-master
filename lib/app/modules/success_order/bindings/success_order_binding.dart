import 'package:get/get.dart';

import '../controllers/success_order_controller.dart';

class SuccessOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuccessOrderController>(
      () => SuccessOrderController(),
    );
  }
}
