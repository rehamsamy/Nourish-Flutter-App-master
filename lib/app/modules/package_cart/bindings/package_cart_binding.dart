import 'package:get/get.dart';
import 'package:nourish_sa/app/modules/package_cart/controllers/package_cart_controller.dart';


class PackageCartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PackageCartController>(
      () => PackageCartController(),
    );
  }
}
