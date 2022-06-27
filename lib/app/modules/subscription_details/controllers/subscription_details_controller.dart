import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/subscription_detail_model.dart';
import 'package:nourish_sa/app/data/remote_data_sources/sbscription_apis.dart';

class SubscriptionDetailsController extends GetxController {
  //TODO: Implement SubscriptionDetailsController
  Map args = Get.arguments ?? {};
   SubscriptionDetailModel  detailModel= SubscriptionDetailModel();


  final count = 0.obs;
  @override
  void onInit() async{
    super.onInit();
  detailModel=  args['detailModel'] as SubscriptionDetailModel;
  String  name=detailModel.data?.order?.package?.name??'';
  update();
    Get.log('cccccccccc   '+name.toString());

  }

  @override
  void onReady() async{
        super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
