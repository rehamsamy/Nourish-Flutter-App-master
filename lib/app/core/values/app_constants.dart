import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/data/services/network_service.dart/dio_network_service.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';

String? token = Get.find<SharedPrefService>().getToken() ?? '';

NetworkService networkService = NetworkService(
  baseUrl: AppConstants.kBaseUrl,
  httpHeaders: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  },
);

class AppConstants {
  const AppConstants._();

  static const String kIntercomAppID = "cagzlkvw";
  static const String kIntercomAndroidKey =
      "android_sdk-7a9cc8c9d823c674daf7b6c34c216607bcf24a68";
  static const String kIntercomIosKey =
      "ios_sdk-9cba07ad4171abee94f60e49083b888264536c61";
  static const String kBaseUrl = "https://api.eat-nourish.com/api/";
  static const String kGoogleMapsApiKey =
      "AIzaSyCXFEuYNLDNZVkJN3SwCeMNYiIbc4AJDG8";
  static const String kImage =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrKHPsvNDJHY9tWpkHrfkfo8Dkf0LvZU3Hdg&usqp=CAU.png";

  static const List<String> days = [
    "mon",
    "tue",
    "wed",
    "thu",
    "fri",
    "sat",
    "sun",
  ];
  static const List<Color> colorsMenu = [
    Color(0xff4CB050),
    Color(0xff014B7A),
    Color(0xffF85E60),
    Color(0xff4CB050),
    Color(0xff014B7A),
    Color(0xffF85E60),
  ];
}
