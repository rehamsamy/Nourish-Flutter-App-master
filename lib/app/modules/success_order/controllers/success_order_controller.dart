import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/add_order_model.dart';
import 'package:nourish_sa/app/data/models/package_detail_model.dart';

import '../../../data/services/analytics_service.dart';

class SuccessOrderController extends GetxController {
  Map arguments = {};
  late PackageDetailModel packageDetailModel;
  late AddOrderModel addOrderModel;
  late String selectedPlanType;
  late String startDate;
  @override
  void onInit() {
    arguments = Get.arguments as Map;
    packageDetailModel = arguments['packageDetailModel'];
    addOrderModel = arguments['addOrderModel'] as AddOrderModel;
    selectedPlanType = arguments['selectedPlanType'] as String;
    startDate = arguments['startDate'] as String;
    super.onInit();

    AnalyticsService.instance.logEvent("Success_Order_View");
  }
}
