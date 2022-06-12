import 'package:get/get.dart';

import '../controllers/subscription_status_controller.dart';

class SubscriptionStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubscriptionStatusController>(
      () => SubscriptionStatusController(),
    );
  }
}
