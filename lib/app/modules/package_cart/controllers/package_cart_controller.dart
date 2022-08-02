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
  String currentDay = "";

  List<String>? productsList;
  List<String>? dinnerProductsList;
  List<String>? breakfastProductsList;
  List<String>? lunchProductsList;
  Map<String, Map> selectedMealsProductsData = {};
  PackageMealsController packageMealsController = Get.find();
  Map<String, dynamic> decoded = {};
  @override
  void onInit() {
    super.onInit();
    currentDay = packageMealsController.selectedDays1.keys.first;
    selectedMealsProductsData = packageMealsController.selectedDays1;
    AnalyticsService.instance.logEvent("Cart_View");

    isSubscribtion = args['isSubscribtion'] as bool;
    total = args['total'] as int;
    detailModel = PackageDetailsView.packageDetailModel;
    currentDay = PackageMealsController.selectedDays.keys.first;
    Get.log('mmm   ' + currentDay);
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
    Get.log('llll  ' + index.toString());
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
}
