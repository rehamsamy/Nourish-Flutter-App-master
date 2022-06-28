import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/subscription_detail_model.dart';

class SubscriptionStatusController extends GetxController {
  //TODO: Implement SubscriptionStatusController
  Map args = Get.arguments ?? {};
  SubscriptionDetailModel  detailModel= SubscriptionDetailModel();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    detailModel=  args['detailModel'] as SubscriptionDetailModel;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
