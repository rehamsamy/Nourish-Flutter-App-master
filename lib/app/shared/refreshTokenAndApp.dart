import 'package:get/get.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';
import 'package:nourish_sa/routes/app_pages.dart';

Future refreshAppWithNewToken() async {
  //call token service
  String token = SharedPrefService.getToken().toString();
  if (token == "null" || token.toString() == "") {
    Get.offAllNamed(Routes.LOGIN);
    Get.snackbar("Not Authorized".tr, "Please Login");
  } else {
    //return AuthApis().refreshToken().then((value) => Get.forceAppUpdate());
  }
}
