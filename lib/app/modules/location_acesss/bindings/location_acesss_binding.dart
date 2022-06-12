import 'package:get/get.dart';

import '../controllers/location_acesss_controller.dart';

class LocationAcesssBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationAcesssController>(
      () => LocationAcesssController(),
    );
  }
}
