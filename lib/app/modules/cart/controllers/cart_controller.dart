import 'dart:convert';

import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
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
  List<String> daysList=[];
  Map<String, dynamic> decoded = {};
  @override
  void onInit() {
    super.onInit();
    AnalyticsService.instance.logEvent("Cart_View");
      isSubscribtion = args['isSubscribtion'] as bool;
   if(isSubscribtion ==true){
     Get.log('cccc  '+isSubscribtion.toString());
     detailModel = args['detailModel'] as SubscriptionDetailModel;
     sundayList=detailModel?.data?.meals?.sunday;
     saturdayList=detailModel?.data?.meals?.saturday;
     mondayList=detailModel?.data?.meals?.monday;
     tuesdayList=detailModel?.data?.meals?.tuesday;
     for (int i=0;i<AppConstants.days.length;i++){
       // "[\"1\",\"2\",\"3\"]"
       // if(i==){
       //   daysList.add(AppConstants.days[i]);
       // }

     }
     AppConstants.days..

      String name = detailModel?.data?.order?.package?.name ?? '';
    }

    update();
  }
}
