import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/home_package_model.dart';

import '../../../data/services/analytics_service.dart';

class SearchController extends GetxController {
  TextEditingController searchController = TextEditingController();
  Map map = Get.arguments;
  List<WeeklyItem>? packagesList;
  List<WeeklyItem>? searchList;

  @override
  void onInit() {
    AnalyticsService.instance.logEvent("Search_View");
    packagesList = map['packagesList'] as List<WeeklyItem>?;
    super.onInit();
  }

  onSearchTextChanged(String text) async {
    searchList?.clear();
    if (text.isEmpty) {
      update();
      return;
    }

    packagesList?.forEach((package) {
      if (package.name!.contains(text) || package.name!.contains(text)) {
        searchList?.add(package);
      }
    });

    update();
  }
}
