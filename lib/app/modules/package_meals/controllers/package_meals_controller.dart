import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/package_detail_model.dart';
import 'package:nourish_sa/app/modules/package_details/views/package_details_view.dart';

import '../../../data/services/analytics_service.dart';

class PackageMealsController extends GetxController {
 static Map<String, dynamic> selectedDays = {};
 static Map<String, dynamic> selectedDays1 = {};
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
  int totalPackagePrice = 0;
  List<MealsModel>? breakfastsList;
  List<MealsModel>? lunchesList;
  List<MealsModel>? dinnersList;
  List<MealsModel>? _newMealsList;
  String currentDay = "";
  String? selectedMeal;
  int ? packagePrice;
  @override
  void onInit() {
    AnalyticsService.instance.logEvent("Package_Meals_View");
    selectedDays = map['selectedDays'];
    currentDay = selectedDays.keys.first;
    extraDinnerPrice =
        PackageDetailsView.packageDetailModel?.data?.extraDinnerPrice;
    extraBreakfastPrice =
        PackageDetailsView.packageDetailModel?.data?.extraBreakfastPrice;
    extraLunchPrice =
        PackageDetailsView.packageDetailModel?.data?.extraLunchPrice;
    packagePrice=PackageDetailsView.packageDetailModel?.data?.priceWithTax;
    breakfastsList = PackageDetailsView.packageDetailModel?.data?.breakfasts;
    lunchesList = PackageDetailsView.packageDetailModel?.data?.lunches;
    dinnersList = PackageDetailsView.packageDetailModel?.data?.dinners;
    _newMealsList = dinnersList;
    super.onInit();
  }

  addMeal(String meal) {
    if (meal == 'dinner') {
      dinnerSelected++;
    } else if (meal == 'breakfast') {
      breakfastSelected++;
    } else if (meal == 'lunch') {
      lunchSelected++;
    }
    update();
    addtionalPackagePrice = ((extraLunchPrice ?? 0) * lunchSelected) +
        ((extraBreakfastPrice ?? 0 )* breakfastSelected) +
        ((extraDinnerPrice ?? 0 )* dinnerSelected);
    totalPackagePrice=addtionalPackagePrice+(packagePrice ?? 0);
    update();
  }

  removeMeal(String meal) {
    selectedMeal = meal;
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

    addtionalPackagePrice = ((extraLunchPrice ?? 0 )* lunchSelected) +
        ((extraBreakfastPrice ?? 0) * breakfastSelected) +
        ((extraDinnerPrice ?? 0 )* dinnerSelected);
    totalPackagePrice=addtionalPackagePrice+(packagePrice ?? 0);
    update();
  }

  changeMealSelected(int index, String meal) {
    selectedMeal = meal;
    isMealSelected = index;
    getList(index);
    update();
  }

  List<MealsModel>? get newMealsList {
    return _newMealsList;
  }

  getList(int index) {
    if (index == 1) {
      _newMealsList = dinnersList;
    } else if (index == 2) {
      _newMealsList = breakfastsList;
    } else if (index == 3) {
      _newMealsList = lunchesList;
    }
    update();
    Get.log('vvvvv  '+selectedDays1.toString());
  }

  selectDay(String day) {
    selectedDays1.clear();
    currentDay = day;
    selectedDays1[day] = {
      'breakfast': '',
      'lunch': '',
      'dinner': '',
    };
    update();
    Get.log('vv    11 '+ PackageMealsController.selectedDays1[day].keys.toString());

  }



}
