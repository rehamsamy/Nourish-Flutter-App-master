import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/categories_model.dart';
import 'package:nourish_sa/app/data/models/home_package_model.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
class HomeScreenController extends GetxController {
GlobalKey<ScaffoldState>? scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController search = TextEditingController();
  bool isLoading=false;

@override
  void onInit() {
  handleIsLoading(true);
  handleIsLoading(true);
  }


handleIsLoading(bool val){
  isLoading=val;
  update();
}



}
