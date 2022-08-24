import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/coupon_discount_model.dart';
import 'package:nourish_sa/app/data/models/package_detail_model.dart';
import 'package:nourish_sa/app/data/models/subscription_detail_model.dart';
import 'package:nourish_sa/app/modules/package_details/views/package_details_view.dart';
import 'package:nourish_sa/app/modules/package_meals/controllers/package_meals_controller.dart';
import '../../../data/services/analytics_service.dart';

class PackageCartController extends GetxController {
  bool isSubscribtion = false;
  Map args = Get.arguments;
  PackageDetailModel? detailModel;
  List<MealDay>? sundayList;
  List<MealDay>? saturdayList;
  List<MealDay>? mondayList;
  List<MealDay>? tuesdayList;
  List<MealDay>? _newMealsList;
  List<String> daysList = [];
  int isMealSelected = 0;
  int total = 0;
  double packageDiscountPrice = 0;
  String currentDay = '';
  List<String>? productsList;
  List<String>? dinnerProductsList;
  List<String>? breakfastProductsList;
  List<String>? lunchProductsList;
  Map<String, Map> selectedMealsProductsData = {};
  PackageMealsController packageMealsController = Get.find();
  Map<String, dynamic> decoded = {};
  CouponDiscountModel? discountData;
  TextEditingController couponController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    currentDay = packageMealsController.selectedDays1.keys.first;
    selectedMealsProductsData = packageMealsController.selectedDays1;
    AnalyticsService.instance.logEvent("Cart_View");
    total = args['total'] as int;
    detailModel = PackageDetailsView.packageDetailModel;
    if (isSubscribtion == false) {
      getDaysList();
    }

    update();
  }

  List<MealDay>? get newMealsList {
    return _newMealsList;
  }

  changeMealSelected(int index, String day) {
    isMealSelected = index;
    currentDay = day;
    Get.log('current date is  ' + currentDay);
    update();
  }

  void getDaysList() {
    daysList.clear();
    if (saturdayList != null) {
      daysList.add('sat');
    }
    if (sundayList != null) {
      daysList.add('sun');
    }
    if (mondayList != null) {
      daysList.add('mon');
    }
    if (tuesdayList != null) {
      daysList.add('tue');
    }

    update();
  }
}
