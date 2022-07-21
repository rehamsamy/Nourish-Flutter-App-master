import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/subscription_detail_model.dart';

import '../../../data/services/analytics_service.dart';

class SubscriptionDetailsController extends GetxController {
  //TODO: Implement SubscriptionDetailsController
  Map args = Get.arguments ?? {};
  SubscriptionDetailModel detailModel = SubscriptionDetailModel();
  int ? remainingDays;

  @override
  void onInit() async {
    super.onInit();
    AnalyticsService.instance.logEvent("Subscription_Details_View");
    detailModel = args['detailModel'] as SubscriptionDetailModel;
    String name = detailModel.data?.order?.package?.name ?? '';
    final endDate=DateTime.parse(detailModel.data?.order?.endDate??'');
    final date2 = DateTime.now();
    final difference = daysBetween(endDate, date2);
    remainingDays = difference;
    update();
    Get.log('cccccccccc   ' + remainingDays.toString());
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    Get.log('from  $from   to  $to');
    return (from.difference(to).inHours / 24).round();
  }

}
