import 'package:get/get.dart';

import '../../../data/services/analytics_service.dart';

class LocationAcesssController extends GetxController {
  //TODO: Implement LocationAcesssController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    AnalyticsService.instance.logEvent("Location_Access_View");
  }
}
