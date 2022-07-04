import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  AnalyticsService._privateConstructor();

  static final AnalyticsService instance =
      AnalyticsService._privateConstructor();

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  logEvent(String name, [Map<String, String>? params]) {
    analytics.logEvent(
      name: name,
      parameters: params,
    );
  }
}
