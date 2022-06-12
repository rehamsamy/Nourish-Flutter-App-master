import 'package:get/get.dart';
import 'package:nourish_sa/app/modules/home_screen/controllers/home_screen_controller.dart';
import 'package:nourish_sa/app/modules/meals/controllers/meals_controller.dart';
import 'package:nourish_sa/app/modules/packages/controllers/packages_controller.dart';
import 'package:nourish_sa/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/home_page_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomePageController>(
      HomePageController(),
    );
    Get.put<HomeScreenController>(
      HomeScreenController(),
    );
    Get.put<MealsController>(
      MealsController(),
    );

    Get.put<PackagesController>(
      PackagesController(),
    );
    Get.put<ProfileController>(
      ProfileController(),
    );
  }
}
