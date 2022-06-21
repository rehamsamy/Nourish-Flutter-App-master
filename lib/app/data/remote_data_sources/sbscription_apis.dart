import 'package:get/get_core/src/get_main.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/subscription_model.dart';
import 'package:nourish_sa/app/data/services/network_service.dart/dio_network_service.dart';

class  SubscriptionApis{
  Future<List<SubscriptionItem>?> getSubscriptionAccordingType(String subscriptionType) async {
    List<SubscriptionItem>? list=[];
    const   String token1='eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpLmVhdC1ub3VyaXNoLmNvbVwvYXBpXC9hdXRoXC92ZXJpZnlNb2JpbGVPVFAiLCJpYXQiOjE2NTU4NDA4ODQsImV4cCI6MTY1NTg0NDQ4NCwibmJmIjoxNjU1ODQwODg0LCJqdGkiOiJKaDRBWVdUaFY4UllGT0VlIiwic3ViIjo0LCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.upAtipt4siOdS_MatWb_zh0JX85kHkGZo_j_2rtMM0s';
    final request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: '$subscriptionType',
      data:  NetworkRequestBody.json(
        {},
      ),
        headers: {'Authorization':'Bearer $token1'}
    );
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      SubscriptionModel
          .fromJson, // <- Function to convert API response to your model
      onReceiveProgress: (count, total) {},
      onSendProgress: (count, total) {},
    );

    response.maybeWhen(
        ok: (response) {
          SubscriptionModel model=response;
          list=model.data?.subscriptiondata;
          // Get.log('size of package  ee'+list!.length.toString()??'');
          return list;
        },
        orElse: () {});
    return list;
  }

}