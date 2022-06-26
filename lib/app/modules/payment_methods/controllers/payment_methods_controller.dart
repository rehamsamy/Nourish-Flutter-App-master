import 'package:get/get.dart';

class PaymentMethodsController extends GetxController {
  //TODO: Implement PaymentMethodsController
  Map args = Get.arguments ?? {};
  int ? total;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    total=args['total'] as int;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
