import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService extends GetxService {
  final SharedPreferences prefs;
  SharedPrefService({required this.prefs});
  String? token;

  Future<String> saveToken(String token) async {
    return await prefs.setString("token", token).then((value) async {
      this.token = "";
      this.token = token;
      await prefs.reload();
      return token;
    });
  }

  String? getToken() {
    final String? accessToken = prefs.getString("token");
    if (accessToken != null && accessToken.isNotEmpty) {
      token = accessToken;

      return accessToken;
    } else {
      return null;
    }
  }

  Future<bool> removeToken() async {
    token = null;
    return prefs.remove("token");
  }

  Future<bool> saveLocale(String langCode) async {
    return await prefs.setString("lang", langCode).then((value) async {
      await prefs.reload();
      return value;
    });
  }

  String loadLocale() {
    return prefs.getString("lang") ?? "en";
  }

  Future<bool> saveIsFirstTime() async {
    return await prefs.setBool("FirstTime", false).then((value) async {
      await prefs.reload();
      return value;
    });
  }

  bool loadIsFirstTime() {
    return prefs.getBool("FirstTime") ?? true;
  }
}
