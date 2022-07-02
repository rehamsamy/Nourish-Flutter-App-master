import 'package:get/get.dart';

import '../../../data/services/analytics_service.dart';

class SuccessOrderController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    AnalyticsService.instance.logEvent("Success_Order_View");
  }
}
