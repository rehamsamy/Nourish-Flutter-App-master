import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/subscription_detail_model.dart';

import '../../../data/services/analytics_service.dart';

class SubscriptionStatusController extends GetxController {
  //TODO: Implement SubscriptionStatusController
  Map args = Get.arguments ?? {};
  SubscriptionDetailModel detailModel = SubscriptionDetailModel();
  @override
  void onInit() {
    super.onInit();

    AnalyticsService.instance.logEvent("Subscription_Status_View");
    detailModel = args['detailModel'] as SubscriptionDetailModel;
  }
}
