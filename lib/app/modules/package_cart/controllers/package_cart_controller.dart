import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/coupon_discount_model.dart';
import '../../../data/services/analytics_service.dart';

class PackageCartController extends GetxController {
  Map args = Get.arguments;
  Map<String, dynamic> cartSelectedMeals = {};
  Map selectedDaysMap = {};
  List selectedDays = [];
  int isMealSelected = 0;
  int total = 0;
  double packageDiscountPrice = 0;
  String currentDay = '';
  CouponDiscountModel? discountData;
  TextEditingController couponController = TextEditingController();
  @override
  void onInit() {
    AnalyticsService.instance.logEvent("Cart_View");
    cartSelectedMeals = args['selectedMeals'];
    selectedDays = args['selectedDays'];
    Get.log("SELECTED DAYS : " + selectedDays.toString());
    total = args['total'];
    super.onInit();
  }

  changeMealSelected(int index, String day) {
    isMealSelected = index;
    currentDay = day;
    Get.log('current date is  ' + currentDay);
    update();
  }
}
