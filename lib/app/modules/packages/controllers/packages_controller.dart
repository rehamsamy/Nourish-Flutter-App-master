import 'package:get/get.dart';

import '../../../data/services/analytics_service.dart';

class PackagesController extends GetxController {
  //TODO: Implement PackagesController
  RxInt selectedPackageType = 0.obs;

  changeSelectedPackageType(index) {
    selectedPackageType.value = index;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    AnalyticsService.instance.logEvent("Packages_View");
  }
}
