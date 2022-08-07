import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService extends GetxService {
  static late SharedPreferences _prefs;

  static Future init() async => _prefs = await SharedPreferences.getInstance();

  static Future<bool> saveToken(String token) async =>
      await _prefs.setString("token", token);
  static String? getToken() => _prefs.getString("token");
  static Future<bool> removeToken() async => await _prefs.remove("token");

  static Future<bool> saveLocale(String locale) async =>
      await _prefs.setString("lang", locale);
  static String? getLocale() => _prefs.getString("lang");

  Future<bool> saveIsFirstTime() async {
    return await _prefs.setBool("FirstTime", false).then((value) async {
      //await prefs.reload();
      return value;
    });
  }

  bool loadIsFirstTime() {
    return _prefs.getBool("FirstTime") ?? true;
  }
}
