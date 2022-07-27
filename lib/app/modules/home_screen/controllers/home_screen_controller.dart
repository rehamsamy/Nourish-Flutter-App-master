import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/profile_model.dart';
import 'package:nourish_sa/app/data/remote_data_sources/profile_apis.dart';

import '../../../data/services/analytics_service.dart';

class HomeScreenController extends GetxController {
  GlobalKey<ScaffoldState>? scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController search = TextEditingController();
  ProfileModel? profileModel;
  bool isLoading = false;

  @override
  void onInit() async {
    super.onInit();
    AnalyticsService.instance.logEvent("Home_View");

    profileModel = await ProfileApis().getProfileInfo();
    handleIsLoading(true);
  }

  handleIsLoading(bool val) {
    isLoading = val;
    update();
  }
}
