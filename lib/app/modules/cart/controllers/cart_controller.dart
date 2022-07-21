
import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/subscription_detail_model.dart';
import '../../../data/services/analytics_service.dart';

class CartController extends GetxController {
  bool isSubscribtion = true;
  Map args = Get.arguments ;
  SubscriptionDetailModel? detailModel;
  List<MealDay>? sundayList;
  List<MealDay>? saturdayList;
  List<MealDay>? mondayList;
  List<MealDay>? tuesdayList;
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
   if(isSubscribtion !=null){
     Get.log('cccc  '+isSubscribtion.toString());
     detailModel = args['detailModel'] as SubscriptionDetailModel;
     sundayList=detailModel?.data?.meals?.sunday;
     saturdayList=detailModel?.data?.meals?.saturday;
     mondayList=detailModel?.data?.meals?.monday;
     tuesdayList=detailModel?.data?.meals?.tuesday;
     _newMealsList=sundayList;
     getDaysList();
      String name = detailModel?.data?.order?.package?.name ?? '';
    }

    update();
  }


  List<MealDay>? get newMealsList {
    return _newMealsList;
  }

  getList(int index) {
    if (index == 0) {
      _newMealsList = sundayList;
    } else if (index == 1) {
      _newMealsList = mondayList;
    } else if (index == 2) {
      _newMealsList = tuesdayList;
    }else if (index == 3) {
      _newMealsList = saturdayList;
    }
    update();
  }


  changeMealSelected(int index,String day) {
    isMealSelected = index;
    selectedDay=day;
    Get.log('llll  '+index.toString());
    getList(index);
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
