import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/subscription_detail_model.dart';
import 'package:nourish_sa/app/data/remote_data_sources/sbscription_apis.dart';

class SubscriptionDetailsController extends GetxController {
  //TODO: Implement SubscriptionDetailsController
  Map args = Get.arguments ?? {};
  SubscriptionDetailModel ? detailModel ;


  final count = 0.obs;
  @override
  void onInit() async{
    super.onInit();
    int subscripId=args['subscripId'];
  detailModel=  await SubscriptionApis().subscriptionDetails(subscripId: '23') as SubscriptionDetailModel;
  String ? name=detailModel?.data?.order?.package?.name.toString();
    Get.log('cccccccccc   '+name.toString());

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
