import 'package:get/get.dart';

import '../../../data/services/analytics_service.dart';

class PackageMealsController extends GetxController {
  List<String> selectedDays=[];
  Map map=Get.arguments;
  @override
  void onInit() {
    AnalyticsService.instance.logEvent("Package_Meals_View");
    selectedDays=map['selectedDays'];
    super.onInit();
  }
}
