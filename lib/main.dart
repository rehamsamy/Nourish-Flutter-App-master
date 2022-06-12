import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/data/services/api_provider.dart';
import 'app/data/services/localization_service.dart';
import 'nourish_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  Get.put(SharedPrefService(prefs: pref));
  Get.put(LocalizationService());

  Get.put(ApiProvider());

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const NourishApp());
  });
}
