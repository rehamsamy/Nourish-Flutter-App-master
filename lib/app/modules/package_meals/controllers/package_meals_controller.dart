import 'package:get/get.dart';
import 'package:nourish_sa/app/modules/package_details/views/package_details_view.dart';

import '../../../data/services/analytics_service.dart';

class PackageMealsController extends GetxController {
  List<String> selectedDays=[];
  Map map=Get.arguments;
  int dinnerSelected=1;
  int lunchSelected=1;
  int breakfastSelected=1;
  int extraDinnerPrice=0;
  int extraBreakfastPrice=0;
  int extraLunchPrice=0;
  bool isMealSelected=false;
  int selectedIndex=0;
  @override
  void onInit() {
    AnalyticsService.instance.logEvent("Package_Meals_View");
    selectedDays=map['selectedDays'];
    extraDinnerPrice=PackageDetailsView.packageDetailModel?.data?.extraDinnerPrice??0;
    extraBreakfastPrice=PackageDetailsView.packageDetailModel?.data?.extraBreakfastPrice??0;
    extraLunchPrice=PackageDetailsView.packageDetailModel?.data?.extraLunchPrice??0;
    super.onInit();
  }


  changeDinnerValue(String flag){
    Get.log('cccc  11  => '+flag);
    if(extraDinnerPrice !=null||extraDinnerPrice!=0){
      Get.log('cccc 11 ');
      if(flag=='plus'){
        dinnerSelected++;
      }else{
        if(dinnerSelected==1){
          dinnerSelected=1;
        }else{
          dinnerSelected--;
        }
      }
    }else{
      dinnerSelected=1;
    }
    update();
  }



changeLunchValue(String flag){
  Get.log('cccc  22  => '+flag);
  if(extraLunchPrice !=null||extraLunchPrice!=0){
    Get.log('cccc 22 ');
    if(flag=='plus'){
      lunchSelected++;
    }else{
      if(lunchSelected==1){
        lunchSelected=1;
      }else{
        lunchSelected--;
      }
    }
  }else{
    lunchSelected=1;
  }
  update();
}



changeBreakfastValue(String flag){
    Get.log('cccc  33  => '+flag);
  if(extraBreakfastPrice !=null||extraBreakfastPrice!=0){
    Get.log('cccc 33 ');
    if(flag=='plus'){
      breakfastSelected++;
    }else{
      if(breakfastSelected==1){
        breakfastSelected=1;
      }else{
        breakfastSelected--;
      }
    }
  }else{
    breakfastSelected=1;
  }
  update();
}
changeMealSelected(int index){
  //  selectedIndex=index;
    Get.log('index =>  '+index.toString()+'sel   '+selectedIndex.toString());
    if(index==selectedIndex){
      isMealSelected=!isMealSelected;
    }else{
      isMealSelected=false;
    }
    update();
}


}
