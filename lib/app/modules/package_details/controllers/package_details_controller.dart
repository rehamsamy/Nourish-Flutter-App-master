import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/package_detail_model.dart';

import '../../../data/services/analytics_service.dart';

class PackageDetailsController extends GetxController {
  //TODO: Implement PackageDetailsController
  Map map = Get.arguments;
  PackageDetailModel? packageDetailModel;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    AnalyticsService.instance.logEvent("Package_Details_View");
    packageDetailModel = map['packageDetailModel'];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
