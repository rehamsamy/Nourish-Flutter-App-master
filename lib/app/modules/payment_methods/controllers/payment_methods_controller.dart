import 'package:get/get.dart';

import '../../../data/services/analytics_service.dart';

class PaymentMethodsController extends GetxController {
  //TODO: Implement PaymentMethodsController
  Map args = Get.arguments ?? {};
  int? total;
  int ?selectPaymentId;

  final count = 0.obs;
  @override
  void onInit() {
    AnalyticsService.instance.logEvent("Packages_View");
    super.onInit();
    total = args['total'] as int;
  }


  @override
  void onClose() {}
  void increment() => count.value++;

  changeSelectedPaymentIndex(int newVal)
  {
    selectPaymentId=newVal;
    update();
  }}
