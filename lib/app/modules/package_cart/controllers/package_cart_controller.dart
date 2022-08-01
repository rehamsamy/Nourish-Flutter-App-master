import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/package_detail_model.dart';
import 'package:nourish_sa/app/data/models/subscription_detail_model.dart';
import 'package:nourish_sa/app/modules/package_details/views/package_details_view.dart';
import 'package:nourish_sa/app/modules/package_meals/controllers/package_meals_controller.dart';
import '../../../data/services/analytics_service.dart';

class PackageCartController extends GetxController {
  bool isSubscribtion = true;
  Map args = Get.arguments;

  PackageDetailModel? detailModel;
  List<MealDay>? sundayList;
  List<MealDay>? saturdayList;
  List<MealDay>? mondayList;
  List<MealDay>? tuesdayList;
  List<MealDay>? _newMealsList;
  String? selectedDay;
  List<String> daysList = [];
  int isMealSelected = 0;
  int total = 0;
  String currentDay = PackageMealsController.selectedDays1.keys.elementAt(0);
  List<String>? productsList;
  List<String>? dinnerProductsList;
  List<String>? breakfastProductsList;
  List<String>? lunchProductsList;

  Map<String, dynamic> decoded = {};

  @override
  void onInit() {
    super.onInit();
    AnalyticsService.instance.logEvent("Cart_View");
    PackageMealsController.selectedDays1.forEach((key, value) {
      if (key == 'saturday') {
        value.forEach((key, value) {
          if (key == 'dinner') {
            Get.log('map value  =>' + value.toString());
            dinnerProductsList?.add(value);
          }
          if (key == 'breakfast') {
            Get.log('map value  =>' + value.toString());
            breakfastProductsList?.add(value);
          }
          if (key == 'lunch') {
            Get.log('map value  =>' + value.toString());
            lunchProductsList?.add(value);
          }
        });
      }
    });
    isSubscribtion = args['isSubscribtion'] as bool;
    total = args['total'] as int;
    detailModel = PackageDetailsView.packageDetailModel;
    currentDay = PackageMealsController.selectedDays.keys.first;
    // if(isSubscribtion ==false){
    //   Get.log('cccc  '+isSubscribtion.toString());
    //   detailModel = args['detailModel'] as SubscriptionDetailModel;
    //   sundayList=detailModel?.data?.meals?.sunday;
    //   saturdayList=detailModel?.data?.meals?.saturday;
    //   mondayList=detailModel?.data?.meals?.monday;
    //   tuesdayList=detailModel?.data?.meals?.tuesday;
    //   _newMealsList=sundayList;
    //   getDaysList();
    //    String name = detailModel?.data?.order?.package?.name ?? '';
    //  }else{
    //
    // }
    if (isSubscribtion == false) {
      // saturdayList=PackageMealsController.selectedDays['saturday'];
      Get.log('xxxxxxx  ' + PackageMealsController.selectedDays.toString());
      getDaysList();
    }

    update();
  }

  List<MealDay>? get newMealsList {
    return _newMealsList;
  }

  getList(String date) {
    // _newMealsList=PackageMealsController.selectedDays1.values[date]
    // if (index == 0) {
    //   _newMealsList = sundayList;
    // } else if (index == 1) {
    //   _newMealsList = mondayList;
    // } else if (index == 2) {
    //   _newMealsList = tuesdayList;
    // }else if (index == 3) {
    //   _newMealsList = saturdayList;
    // }
    update();
  }

  changeMealSelected(int index, String day) {
    isMealSelected = index;
    selectedDay = day;
    getList(day);
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

  selectDay(String day) {
    currentDay = day;
    update();
  }
}
