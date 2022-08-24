import 'package:get/get.dart';

import '../../../data/models/payment_model.dart';
import '../../../data/remote_data_sources/payment_apis.dart';
import '../../../data/services/analytics_service.dart';

class PaymentMethodsController extends GetxController {
  //TODO: Implement PaymentMethodsController
  Map args = Get.arguments ?? {};
  int? total;
  int? selectPaymentId;
  late Future<List<PaymentItem>?> getPayments;
  final count = 0.obs;
  bool hasCashPayment = false;
  PaymentItem? cashOnDeliveryPayment;

  @override
  void onInit() {
    AnalyticsService.instance.logEvent("Packages_View");
    getPayments = PaymentApis().getPaymentMethods();
    super.onInit();
    total = args['total'] as int;
  }

  changeSelectedPaymentIndex(int newVal) {
    selectPaymentId = newVal;
    update();
  }
}
