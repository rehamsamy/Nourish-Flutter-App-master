import 'dart:io';

import 'package:cr_logger/cr_logger.dart';
import 'package:fcm_config/fcm_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intercom_flutter/intercom_flutter.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';

import 'app/data/services/localization_service.dart';
import 'nourish_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // First! Initialize logger
  await CRLoggerInitializer.instance.init(
    theme: ThemeData.dark(),
    levelColors: {
      Level.wtf: const Color.fromARGB(255, 255, 0, 0),
      Level.info: const Color.fromARGB(255, 79, 115, 133),
      Level.warning: const Color.fromARGB(255, 255, 174, 0),
    },
    hiddenFields: [
      'token',
    ],
    logFileName: 'my_logs',
  );
  await Firebase.initializeApp();
  await Intercom.instance.initialize(
    AppConstants.kIntercomAppID,
    iosApiKey: AppConstants.kIntercomIosKey,
    androidApiKey: AppConstants.kIntercomAndroidKey,
  );
  final pref = await SharedPreferences.getInstance();
  Get.put(SharedPrefService(prefs: pref));
  Get.put(LocalizationService());

  final messaging = FCMConfig.instance.messaging;
  late NotificationSettings settings;
  if (Platform.isIOS) {
    settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }
  if (Platform.isAndroid ||
      (Platform.isIOS &&
          settings.authorizationStatus == AuthorizationStatus.authorized)) {
    await FCMConfig.instance.init(
      defaultAndroidChannel: const AndroidNotificationChannel(
        'high_importance_channel',
        'Nourish',
        importance: Importance.high,
        sound: RawResourceAndroidNotificationSound('notification'),
      ),
    );
    final token = await FCMConfig.instance.messaging.getToken();
    debugPrint("token $token");
  }
  //Get.find<LocalizationServices>
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const NourishApp());
  });
}
