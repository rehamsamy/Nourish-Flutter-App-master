import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/package_detail_model.dart';
import 'package:nourish_sa/app/modules/package_details/controllers/package_details_controller.dart';
import 'package:nourish_sa/app/modules/package_details/views/package_details_view.dart';

import '../../../data/services/analytics_service.dart';

class PackageMealsController extends GetxController {
  static Map<String, dynamic> selectedDays = {};
  Map<String, Map> selectedDays1 = {};
  Map map = Get.arguments;
  int dinnerSelected = 1;
  int lunchSelected = 1;
  int breakfastSelected = 1;
  int snacksSelected = 1;
  int? extraDinnerPrice = 0;
  int? extraBreakfastPrice = 0;
  int? extraLunchPrice = 0;
  int? extraSnacksPrice = 0;
  int isMealSelected = 0;
  int selectedIndex = 0;
  int addtionalPackagePrice = 0;
  int totalPackagePrice = 0;
  List<MealModel>? breakfastsList;
  List<MealModel>? lunchesList;
  List<MealModel>? dinnersList;
  List<MealModel>? snacksList;
  List<MealModel>? _newMealsList;
  String currentDay = "sun";
  String? selectedMeal;
  int? packagePrice;
  @override
  void onInit() {
    AnalyticsService.instance.logEvent("Package_Meals_View");
    selectedDays = map['selectedDays'];
    currentDay = selectedDays.keys.first;
    selectedDays1 = {};
    extraDinnerPrice =
        PackageDetailsView.packageDetailModel?.data?.extraDinnerPrice;
    extraBreakfastPrice =
        PackageDetailsView.packageDetailModel?.data?.extraBreakfastPrice;
    extraLunchPrice =
        PackageDetailsView.packageDetailModel?.data?.extraLunchPrice;
    extraSnacksPrice =
        PackageDetailsView.packageDetailModel?.data?.extraSnackPrice;
    packagePrice = PackageDetailsView.packageDetailModel?.data?.priceWithTax;
    totalPackagePrice = packagePrice ?? 0;
    //////////////////////
    breakfastsList = PackageDetailsView.packageDetailModel?.data?.breakfasts;
    lunchesList = PackageDetailsView.packageDetailModel?.data?.lunches;
    dinnersList = PackageDetailsView.packageDetailModel?.data?.dinners;
    snacksList = PackageDetailsView.packageDetailModel?.data?.snacks;
    //////////////////////
    dinnerSelected = PackageDetailsView.packageDetailModel?.data?.dinner ?? 0;
    lunchSelected = PackageDetailsView.packageDetailModel?.data?.lunch ?? 0;
    breakfastSelected =
        PackageDetailsView.packageDetailModel?.data?.breakfast ?? 0;
    snacksSelected = PackageDetailsView.packageDetailModel?.data?.snack ?? 0;

    _newMealsList = breakfastsList!.isNotEmpty
        ? breakfastsList
        : lunchesList?.isNotEmpty ?? false
            ? lunchesList
            : dinnersList?.isNotEmpty ?? false
                ? dinnersList
                : snacksList?.isNotEmpty ?? false
                    ? snacksList
                    : [];
    isMealSelected = breakfastsList!.isNotEmpty
        ? 2
        : lunchesList?.isNotEmpty ?? false
            ? 3
            : dinnersList?.isNotEmpty ?? false
                ? 1
                : snacksList?.isNotEmpty ?? false
                    ? 4
                    : 0;
    ;
    Get.log('PackageDetails ==> ' +
        PackageDetailsController.x!.data!.lunches.toString());
    update();
    super.onInit();

    Get.log('SELECTED DAYS ' +
        extraDinnerPrice.toString() +
        ' dinner ' +
        extraSnacksPrice.toString() +
        ' snack  ' +
        extraBreakfastPrice.toString() +
        '  break  ' +
        extraLunchPrice.toString() +
        ' lunch ');
  }

  addMeal(String meal) {
    if (meal == 'dinner') {
      dinnerSelected++;
    } else if (meal == 'breakfast') {
      breakfastSelected++;
    } else if (meal == 'lunch') {
      lunchSelected++;
    } else if (meal == 'snack') {
      snacksSelected++;
    }
    update();
    addtionalPackagePrice = ((extraLunchPrice ?? 0) * (lunchSelected - 1)) +
        ((extraBreakfastPrice ?? 0) * (breakfastSelected - 1)) +
        ((extraDinnerPrice ?? 0) * (dinnerSelected - 1)) +
        ((extraSnacksPrice ?? 0) * (snacksSelected - 1));
    totalPackagePrice = addtionalPackagePrice + (packagePrice ?? 0);
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
    } else if (meal == 'snack') {
      snacksSelected--;
      if (snacksSelected == 0) {
        snacksSelected = 1;
        isMealSelected = 0;
      }
    }
    // if (lunchSelected == 1 ||
    //     breakfastSelected == 1 ||
    //     dinnerSelected == 1 ||
    //     snacksSelected == 1) {
    //   addtionalPackagePrice = 0;
    // } else {
    addtionalPackagePrice = ((extraLunchPrice ?? 0) * lunchSelected) +
        ((extraBreakfastPrice ?? 0) * breakfastSelected) +
        ((extraDinnerPrice ?? 0) * dinnerSelected) +
        ((extraDinnerPrice ?? 0) * snacksSelected) +
        ((extraSnacksPrice ?? 0) * snacksSelected);
    totalPackagePrice = addtionalPackagePrice + (packagePrice ?? 0);
    // }
    update();
  }

  changeMealSelected(int index, String meal) {
    selectedMeal = meal;
    isMealSelected = index;
    getList(index);
    update();
  }

  List<MealModel>? get newMealsList {
    return _newMealsList;
  }

  getList(int index) {
    if (index == 1) {
      _newMealsList = dinnersList;
    } else if (index == 2) {
      _newMealsList = breakfastsList;
    } else if (index == 3) {
      _newMealsList = lunchesList;
    } else if (index == 4) {
      _newMealsList = snacksList;
    }
    update();
  }

  selectDay(String day) {
    currentDay = day;

    // selectedDays1[day] = {
    //   ( extraLunchPrice==null||extraLunchPrice==0)?null:'lunch': '',
    //   ( extraBreakfastPrice==null||extraBreakfastPrice==0)?null:'breakfast': '',
    //   ( extraDinnerPrice==null||extraDinnerPrice==0)?null:'dinner': '',
    //  ( extraSnacksPrice==null||extraSnacksPrice==0)?null:'snack': '',
    // };

    selectedDays1[day] = {
      'breakfast': '',
      'lunch': '',
      'dinner': '',
      'snack': '',
    };
    update();
  }
}
