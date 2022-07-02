import 'package:get/get.dart';

import '../../../data/services/analytics_service.dart';

class SubscriptionController extends GetxController {
  RxInt selected = 0.obs;
  @override
  void onInit() {
    AnalyticsService.instance.logEvent("Subscription_View");
    super.onInit();
  }
}
