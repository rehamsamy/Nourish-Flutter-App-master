import 'package:get/get.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';
import 'package:nourish_sa/routes/app_pages.dart';

import '../../../data/services/analytics_service.dart';

class SplashController extends GetxController {
  SharedPrefService sharedPrefService = Get.find<SharedPrefService>();

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      AnalyticsService.instance.logEvent("Splash_View");
      if (sharedPrefService.loadIsFirstTime()) {
        navigateToOnBoarding();
      } else {
        navigateToLogin();
      }
    });
    super.onInit();
  }

  void navigateToLogin() {
    Get.offAllNamed(Routes.LOGIN);
  }

  void navigateToOnBoarding() {
    Get.offAllNamed(Routes.CHOOSE_LANG);
  }
}
