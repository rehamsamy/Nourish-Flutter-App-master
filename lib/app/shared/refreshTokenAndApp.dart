import 'package:get/get.dart';

import '../data/remote_data_sources/auth_apis.dart';

Future refreshAppWithNewToken() async {
  return AuthApis().refreshToken().then((value) => Get.forceAppUpdate());
}
