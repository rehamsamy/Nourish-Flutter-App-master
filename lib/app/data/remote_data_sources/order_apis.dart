import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/change_order_period_model.dart';
import 'package:nourish_sa/app/data/services/network_service.dart/dio_network_service.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';

class OrderApis{
  Future<ChangeOrderPeriodModel?> changeOrderPeriod(
      int ? orderId,int ? periodId) async {
    ChangeOrderPeriodModel orderPeriodModel=ChangeOrderPeriodModel();
    final String? token = Get.find<SharedPrefService>().getToken() ?? '';

    Map<String, dynamic>? map = {
      'order_id': orderId,
      'period_id': periodId,

    };
    final request = NetworkRequest(
      type: NetworkRequestType.POST,
      path: 'changeOrderPeriod',
      data: NetworkRequestBody.json(map),
        headers: {
          'Authorization':'Bearer $token',
        }
    );
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      ChangeOrderPeriodModel.fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(
        ok: (response) {
          orderPeriodModel=response;
          return orderPeriodModel;
        },
        badRequest: (info) {},
        orElse: () {});

    return orderPeriodModel;
  }

}