import 'package:flutter/material.dart';
import 'package:nourish_sa/app/data/services/network_service.dart/dio_network_service.dart';

NetworkService networkService = NetworkService(
  baseUrl: AppConstants.kBaseUrl,
);

class AppConstants {
  const AppConstants._();

  static const String kBaseUrl = "https://api.eat-nourish.com/api/";
  static const String kGoogleMapsApiKey =
      "AIzaSyCXFEuYNLDNZVkJN3SwCeMNYiIbc4AJDG8";
  static const String kImage =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrKHPsvNDJHY9tWpkHrfkfo8Dkf0LvZU3Hdg&usqp=CAU.png";

  static const List<String> days = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
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
