import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/home_package_model.dart';

import '../../../data/services/analytics_service.dart';

class SearchController extends GetxController {
  TextEditingController searchController = TextEditingController();
  Map map = Get.arguments;
  List<PackageItem>? packagesList=[];
  List<PackageItem>? searchList=[];

  @override
  void onInit() {
    AnalyticsService.instance.logEvent("Search_View");
    packagesList = map['packagesList'] as List<PackageItem>?;
    super.onInit();
  }

  onSearchTextChanged(String text) async {
    searchList?.clear();
    if (text.isEmpty) {
      update();
      return;
    }

   searchList= packagesList?.where((element) => ((element.name) as String).toLowerCase().contains(text.toLowerCase())).toList();

    // packagesList?.forEach((package) {
    //   if (package.name!.contains(text)) {
    //     searchList?.add(package);
         Get.log('cc    '+text.toString()+'      lllll     '+(packagesList?.length).toString());
    //   }
    // });
  Get.log('cc    '+text.toString());
    update();
  }
}
// return allProducts
//     .where((element) => element.name.contains(text))
// .toList();