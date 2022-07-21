import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class SubscriptionCartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubscriptionCartController>(
      () => SubscriptionCartController(),
    );
  }
}
