import 'package:get/get.dart';

import '../../../data/services/analytics_service.dart';

class MealsController extends GetxController {
  RxInt selected = 0.obs;
  RxInt categoryId = 0.obs;
@override
  void onInit() {
    AnalyticsService.instance.logEvent("Meals_View");
    super.onInit();
  }
  changeSelected(index) {
    selected.value = index;
  }

  changeCategoryId(id) {
    categoryId.value = id;
  }
}
