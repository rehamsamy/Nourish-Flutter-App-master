import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/categories_model.dart';
import 'package:nourish_sa/app/data/models/home_package_model.dart';
import 'package:nourish_sa/app/data/models/package_model.dart';

class SearchController extends GetxController {
TextEditingController searchController = TextEditingController();
Map map=Get.arguments;
List<WeeklyItem> ? packagesList ;
List<WeeklyItem> ? searchList ;

@override
  void onInit() {
   packagesList=map['packagesList'] as List<WeeklyItem> ? ;
  }

onSearchTextChanged(String text) async {
  searchList?.clear();
  if (text.isEmpty) {
   update();
    return;
  }

  packagesList?.forEach((package) {
    if (package.name!.contains(text) || package.name!.contains(text))
      searchList?.add(package);
  });

update();
}


}
