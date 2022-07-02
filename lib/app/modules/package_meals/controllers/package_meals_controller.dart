import 'package:get/get.dart';

import '../../../data/services/analytics_service.dart';

class PackageMealsController extends GetxController {
  @override
  void onInit() {
    AnalyticsService.instance.logEvent("Package_Meals_View");
    super.onInit();
  }
}
