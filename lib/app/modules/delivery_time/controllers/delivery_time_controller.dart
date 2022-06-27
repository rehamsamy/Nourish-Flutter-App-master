import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/subscription_detail_model.dart';

class DeliveryTimeController extends GetxController {
  //TODO: Implement DeliveryTimeController
  Map args = Get.arguments ;
 // SubscriptionDetailModel ? detailModel;
  List<DeliveryPeriods> ? workTime =[];
  int ? periodId,orderId;


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    workTime=  args['deliveryPeriods'] as  List<DeliveryPeriods>?;
    orderId =args['orderId'] as int ;
    periodId =args['periodId'] as int ;
    update();
    Get.log('cccccccccc   '+orderId.toString()+periodId.toString());
    Get.log('vvvv  '+workTime.toString());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
