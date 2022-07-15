import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/package_detail_model.dart';
import 'package:nourish_sa/app/modules/package_details/views/package_details_view.dart';

import '../../../data/services/analytics_service.dart';

class PackageMealsController extends GetxController {
  List<String> selectedDays = [];
  Map map = Get.arguments;
  int dinnerSelected = 1;
  int lunchSelected = 1;
  int breakfastSelected = 1;
  int? extraDinnerPrice = 0;
  int? extraBreakfastPrice = 0;
  int? extraLunchPrice = 0;
  int isMealSelected = 0;
  int selectedIndex = 0;
  int addtionalPackagePrice = 0;
  List<MealsModel>? breakfastsList;
  List<MealsModel>? lunchesList;
  List<MealsModel>? dinnersList;
  List<MealsModel>? newMealsList;

  String ? selectedMeal;
  @override
  void onInit() {
    AnalyticsService.instance.logEvent("Package_Meals_View");
    selectedDays = map['selectedDays'];
    extraDinnerPrice =
        PackageDetailsView.packageDetailModel?.data?.extraDinnerPrice;
    extraBreakfastPrice =
        PackageDetailsView.packageDetailModel?.data?.extraBreakfastPrice;
    extraLunchPrice =
        PackageDetailsView.packageDetailModel?.data?.extraLunchPrice;
    breakfastsList=PackageDetailsView.packageDetailModel?.data?.breakfasts;
    lunchesList=PackageDetailsView.packageDetailModel?.data?.lunches;
    dinnersList=PackageDetailsView.packageDetailModel?.data?.dinners;

    Get.log('bbb '+(breakfastsList?.length.toString()).toString());
    super.onInit();
  }

  addMeal(String meal) {
    selectedMeal=meal;
    if (meal == 'dinner') {
      dinnerSelected++;
    } else if (meal == 'breakfast') {
      breakfastSelected++;
    } else if (meal == 'lunch') {
      lunchSelected++;
    }
    addtionalPackagePrice = (extraLunchPrice ?? 0 * lunchSelected) +
        (extraBreakfastPrice ?? 0 * breakfastSelected) +
        (extraDinnerPrice ?? 0 * dinnerSelected);

    update();
  }

  removeMeal(String meal) {
    selectedMeal=meal;
    if (meal == 'dinner') {
      dinnerSelected--;
      if (dinnerSelected == 0) {
        dinnerSelected = 1;
        isMealSelected = 0;
      }
    } else if (meal == 'breakfast') {
      breakfastSelected--;
      if (breakfastSelected == 0) {
        breakfastSelected = 1;

        isMealSelected = 0;
      }
    } else if (meal == 'lunch') {
      lunchSelected--;
      if (lunchSelected == 0) {
        lunchSelected = 1;
        isMealSelected = 0;
      }
    }

    addtionalPackagePrice = (extraLunchPrice ?? 0 * lunchSelected) +
        (extraBreakfastPrice ?? 0 * breakfastSelected) +
        (extraDinnerPrice ?? 0 * dinnerSelected);
    update();
  }

  changeMealSelected(int index) {
    isMealSelected = index;
    getList();
    update();
  }

  // List<MealsModel>? get newMealsList {
  //   if(selectedMeal=='dinner'){
  //     Get.log('bbb '+(dinnersList?.length.toString()).toString());
  //     return dinnersList;
  //   }else if(selectedMeal=='breakfast'){
  //     return breakfastsList;
  //   }else{
  //     return lunchesList;
  //   }
  //
  // }

  List<MealsModel>?  getList(){
  if(selectedMeal=='dinner'){
    Get.log('bbb '+(dinnersList?.length.toString()).toString());
    newMealsList=dinnersList;
    update();
    return newMealsList;
  }else if(selectedMeal=='breakfast'){
    newMealsList=breakfastsList;
    update();
    return breakfastsList;
  }else{
    return lunchesList;
  }

}

}
