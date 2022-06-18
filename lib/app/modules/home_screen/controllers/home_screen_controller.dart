import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  GlobalKey<ScaffoldState>? scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController search = TextEditingController();
  bool isLoading = false;

  @override
  void onInit() {
    handleIsLoading(true);
    handleIsLoading(true);
  }

  handleIsLoading(bool val) {
    isLoading = val;
    update();
  }
}
