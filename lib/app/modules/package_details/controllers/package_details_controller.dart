import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/create_package_model.dart';
import 'package:nourish_sa/app/data/models/package_detail_model.dart';

import '../../../data/services/analytics_service.dart';

class PackageDetailsController extends GetxController {
  //TODO: Implement PackageDetailsController
  Map map = Get.arguments;
  PackageDetailModel? packageDetailModel;
  static PackageDetailModel? x;
  ResponseData? customPackageData;
  final count = 0.obs;
  double calories = 0;
  double protein = 0;
  double carbs = 0;
  double fat = 0;

  static String selectedPlanType = '';
  @override
  void onInit() {
    super.onInit();
    AnalyticsService.instance.logEvent("Package_Details_View");
    packageDetailModel = map['packageDetailModel'];
    customPackageData = map['customPackageData'];
    Get.log('custom  ==> '+customPackageData.toString());
    if (customPackageData != null) {
      calories = customPackageData?.calories ?? 0;
      protein = customPackageData?.protein ?? 0;
      carbs = customPackageData?.carbs ?? 0;
      fat = customPackageData?.fat ?? 0;
    }
    x = packageDetailModel;
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
