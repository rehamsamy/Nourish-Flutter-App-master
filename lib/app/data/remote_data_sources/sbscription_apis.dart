import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/pause_subscription_model.dart';
import 'package:nourish_sa/app/data/models/subscription_detail_model.dart';
import 'package:nourish_sa/app/data/models/subscription_model.dart';
import 'package:nourish_sa/app/data/services/network_service.dart/dio_network_service.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';

class  SubscriptionApis{
  Future<List<SubscriptionItem>?> getSubscriptionAccordingType(String subscriptionType) async {
    List<SubscriptionItem>? list=[];
    final String? token = Get.find<SharedPrefService>().getToken() ?? '';
    final request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: subscriptionType,
      data:  const NetworkRequestBody.json(
        {},
      ),
        headers: {'Authorization':'Bearer $token'}
    );
    // Execute a request and convert response to your model:
    Get.log('================  '+token.toString());
    final response = await networkService.execute(
      request,
      SubscriptionModel
          .fromJson, // <- Function to convert API response to your model
      onReceiveProgress: (count, total) {},
      onSendProgress: (count, total) {},
    );
Get.log('subscrip  =>'+response.toString());
    response.maybeWhen(
        ok: (response) {
          SubscriptionModel  model=response;
          list=model.data?.subscriptiondata??[];
          String? length=list?.length.toString();
           Get.log('size of package  ee'+length!);
          return list;
        },
        orElse: () {});
    return list;
  }

  Future<PauseSubscriptionModel> pauseSubscription({required String ?orderId,
                                                    required String ?pauseFrom,
                                                    required String ? resumFrom}) async {
   final Map<String,dynamic> map={
     'order_id':orderId,
     'pause_from':pauseFrom,
     'resume_from':resumFrom
   };
    PauseSubscriptionModel pauseModel=PauseSubscriptionModel();
    final String? token = Get.find<SharedPrefService>().getToken() ?? '';
    Get.log('================  '+token.toString());
      final request = NetworkRequest(
        type: NetworkRequestType.POST,
        path: 'pauseSubscription',
        data:  NetworkRequestBody.json(
           map
        ),
        headers: {'Authorization':'Bearer $token'}
    );
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      PauseSubscriptionModel.fromJson, // <- Function to convert API response to your model
      onReceiveProgress: (count, total) {},
      onSendProgress: (count, total) {},
    );
    Get.log('subscrip  =>'+response.toString());
    response.maybeWhen(
        ok: (response) {
          pauseModel=response;
          return pauseModel;
        },
        orElse: () {});
    return pauseModel;
  }



  Future<SubscriptionDetailModel> subscriptionDetails({required int ?subscripId}) async {

    SubscriptionDetailModel detailModel=SubscriptionDetailModel();
    final request = NetworkRequest(
        type: NetworkRequestType.GET,
        path: 'subscriptionDetails/$subscripId',
        data:  const NetworkRequestBody.json(
         {}
        ),

    );
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      SubscriptionDetailModel.fromJson, // <- Function to convert API response to your model
      onReceiveProgress: (count, total) {},
      onSendProgress: (count, total) {},
    );
    Get.log('subscrip  =>'+response.toString());
    response.maybeWhen(
        ok: (response) {
          detailModel=response;
          return detailModel;
        },
        orElse: () {},);
    return detailModel;
  }

}