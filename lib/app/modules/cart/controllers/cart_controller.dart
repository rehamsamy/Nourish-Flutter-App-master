import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/subscription_detail_model.dart';

import '../../../data/services/analytics_service.dart';

class CartController extends GetxController {
  bool isSubscribtion = true;
  Map args = Get.arguments ?? {};
  SubscriptionDetailModel? detailModel;
  @override
  void onInit() {
    super.onInit();
    AnalyticsService.instance.logEvent("Cart_View");
    detailModel = args['detailModel'] as SubscriptionDetailModel;
    isSubscribtion = args['isSubscribtion'] as bool;
    String name = detailModel?.data?.order?.package?.name ?? '';
    update();
    Get.log('cccccccccc   ' + name.toString());
  }
}
