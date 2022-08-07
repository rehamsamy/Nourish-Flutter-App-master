import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/payment_model.dart';
import 'package:nourish_sa/app/data/services/network_service.dart/dio_network_service.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';

class PaymentApis {
  Future<List<PaymentItem>?> getPaymentMethods() async {
    final String? token = Get.find<SharedPrefService>().getToken();

    List<PaymentItem>? paymentList = [];
    const request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: 'getPayments',
      data: NetworkRequestBody.json(
        {},
      ),
    );
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      PaymentModel
          .fromJson, // <- Function to convert API response to your model
      onReceiveProgress: (count, total) {},
      onSendProgress: (count, total) {},
    );
    response.maybeWhen(
        ok: (model) {
          PaymentModel paymentModel = model;
          paymentList = paymentModel.data;
          return paymentList;
        },
        orElse: () {});
    return paymentList;
  }
}
