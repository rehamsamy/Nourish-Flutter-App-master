
import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/subscription_detail_model.dart';
import '../../../data/services/analytics_service.dart';

class SubscriptionCartController extends GetxController {
  bool isSubscribtion = true;
  Map args = Get.arguments ;
  SubscriptionDetailModel? detailModel;
  List<MealDay>? sundayList;
  List<MealDay>? saturdayList;
  List<MealDay>? mondayList;
  List<MealDay>? tuesdayList;
  List<MealDay>? fridayList;
  List<MealDay>? thursdayList;
  List<MealDay>? wednesdayList;
  List<MealDay>? _newMealsList;
  String?selectedDay;
  List<String> daysList=[];
  int isMealSelected = 0;

  Map<String, dynamic> decoded = {};
  @override
  void onInit() {
    super.onInit();
    AnalyticsService.instance.logEvent("Cart_View");
      isSubscribtion = args['isSubscribtion'] as bool;
   if(isSubscribtion ==true){
     detailModel = args['detailModel'] as SubscriptionDetailModel;
     sundayList=detailModel?.data?.meals?.sunday;
     saturdayList=detailModel?.data?.meals?.saturday;
     mondayList=detailModel?.data?.meals?.monday;
     tuesdayList=detailModel?.data?.meals?.tuesday;
     fridayList=detailModel?.data?.meals?.friday;
     thursdayList= detailModel?.data?.meals?.thursday;
     wednesdayList= detailModel?.data?.meals?.wednesday;
     _newMealsList=sundayList;
     getDaysList();
      String name = detailModel?.data?.order?.package?.name ?? '';
      Get.log('mmm   '+(sundayList?[0].product?.calories).toString());
    }

    update();
  }


  List<MealDay>? get newMealsList {
    return _newMealsList;
  }

  getList(String selectedDay) {
    Get.log('mmmm  '+selectedDay.toString());
    if (selectedDay == 'sun') {
      _newMealsList = sundayList;
    } else if (selectedDay == 'mon') {
      _newMealsList = mondayList;
    } else if (selectedDay == 'tue') {
      _newMealsList = tuesdayList;
    }else if (selectedDay == 'sat') {
      _newMealsList = saturdayList;
    }else if (selectedDay == 'wed') {
      _newMealsList = wednesdayList;
    }else if (selectedDay == 'thu') {
      _newMealsList = thursdayList;
    }else if (selectedDay == 'fri') {
      _newMealsList = fridayList;
    }
    update();
  }


  changeMealSelected(int index,String day) {
    isMealSelected = index;
    selectedDay=day;
    Get.log('llll  '+index.toString());
    getList(day);
    update();
  }

  void getDaysList() {
    daysList.clear();
    if(saturdayList !=null){
      daysList.add('sat');
    }
    if(sundayList !=null){
      daysList.add('sun');
    }
    if(mondayList !=null){
      daysList.add('mon');
    }
    if(tuesdayList !=null){
      daysList.add('tue');
    }

    update();
  }
}
