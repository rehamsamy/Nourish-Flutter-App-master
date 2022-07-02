import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/subscription_detail_model.dart';

import '../../../data/services/analytics_service.dart';

class SubscriptionDetailsController extends GetxController {
  //TODO: Implement SubscriptionDetailsController
  Map args = Get.arguments ?? {};
  SubscriptionDetailModel detailModel = SubscriptionDetailModel();

  @override
  void onInit() async {
    super.onInit();

    AnalyticsService.instance.logEvent("Subscription_Details_View");
    detailModel = args['detailModel'] as SubscriptionDetailModel;
    String name = detailModel.data?.order?.package?.name ?? '';
    update();
    Get.log('cccccccccc   ' + name.toString());
  }
}
