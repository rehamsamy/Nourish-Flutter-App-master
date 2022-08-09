import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/home_package_model.dart';
import 'package:nourish_sa/app/data/models/profile_model.dart';
import 'package:nourish_sa/app/data/remote_data_sources/home_apis.dart';
import 'package:nourish_sa/app/data/remote_data_sources/profile_apis.dart';
import 'package:nourish_sa/app/modules/home_screen/views/widgets/meal_loading.dart';
import 'package:nourish_sa/app/shared/dialogs/filter_dialog.dart';
import 'package:nourish_sa/app/shared/range_slider.dart';

import '../../../data/services/analytics_service.dart';

class HomeScreenController extends GetxController {
  GlobalKey<ScaffoldState>? scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController search = TextEditingController();
  ProfileModel? profileModel;
  bool isLoading = false;
  List<PackageItem> homeFilterPackagesList=[];
   String  packageFilterType='weakly';
   bool filterSelected=false;

  @override
  void onInit() async {
    super.onInit();
    AnalyticsService.instance.logEvent("Home_View");
    profileModel = await ProfileApis().getProfileInfo();
    handleIsLoading(true);

    HomeApis().getHomePackages().then((value) {
      homeFilterPackagesList=value??[];
          update();
    }
     );

  }

 tooglePackageList(List<PackageItem> value){
    homeFilterPackagesList=value;
    update();

 }
 changeIsFilterSelected(bool newVal){
    filterSelected=newVal;
    update();
 }
 changePackageFilterType(String newVal){
    packageFilterType=newVal;
    update();
 }
  handleIsLoading(bool val) {
    isLoading = val;
    update();
  }
  //
}
