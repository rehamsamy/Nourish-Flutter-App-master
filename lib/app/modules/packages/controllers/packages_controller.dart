import 'package:get/get.dart';

class PackagesController extends GetxController {
  //TODO: Implement PackagesController
  RxInt selectedPackageType = 0.obs;

  changeSelectedPackageType(index) {
    selectedPackageType.value = index;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
