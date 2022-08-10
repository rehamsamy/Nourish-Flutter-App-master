import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/home_package_model.dart';
import 'package:nourish_sa/app/data/remote_data_sources/package_apis.dart';

import '../../../data/services/analytics_service.dart';

class PackagesController extends GetxController {
  //TODO: Implement PackagesController
  RxInt selectedPackageType = 0.obs;
  List<PackageItem> homeFilterPackagesList=[];
  bool packageLoading=true;
  final count = 0.obs;
  changeSelectedPackageType(index) {
    selectedPackageType.value = index;
    getHomePackagesList();
  }


  @override
  void onInit() {
    super.onInit();
    AnalyticsService.instance.logEvent("Packages_View");
    Get.log('home  ==> init ' );
    getHomePackagesList();

  }

  tooglePackageList(List<PackageItem> value){
    homeFilterPackagesList=value;
    update();

  }

  void getHomePackagesList() {
    packageLoading=true;
    update();
    Get.log('get packages ==>');
    PackageApis().getPackagesAccordingType(
        selectedPackageType.value == 0
            ? 'monthly'
            : 'weekly').then((value) {
      homeFilterPackagesList=value??[];
      packageLoading=false;
      update();
    }
    );

  }


  tooglePackageListLoading( bool newVal){
    packageLoading=newVal;
    update();
  }
}
