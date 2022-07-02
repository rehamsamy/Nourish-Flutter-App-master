import 'package:get/get.dart';

import '../../../data/services/analytics_service.dart';

class NotificationController extends GetxController {
  @override
  void onInit() {
    AnalyticsService.instance.logEvent("Notification_View");
    super.onInit();
  }
}
