import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/home_setting_model.dart';
import 'package:nourish_sa/app/data/remote_data_sources/home_setting_apis.dart';
import 'package:nourish_sa/app/modules/package_details/controllers/package_details_controller.dart';

import '../../../data/models/package_detail_model.dart';
import '../../../data/services/analytics_service.dart';
import '../../package_details/views/package_details_view.dart';

class DaysTimeController extends GetxController {
  final TextEditingController startDayController = TextEditingController();
  Color? mycolor;
  bool? isSelected;
  int? index;
  List<int> selectedItems = [];

  @override
  void onInit() async {
    super.onInit();
    AnalyticsService.instance.logEvent("Days_Time_View");
    packageDetailModel = PackageDetailsView.packageDetailModel;
    daysCount = packageDetailModel?.data?.daysNumberOfWeek ?? 0;
    branches = packageDetailModel?.data?.branches;
    daysStart = int.parse(packageDetailModel?.data?.daysBeforeStart ?? '');
    await HomeSettingApis().getHomeSetting();
    branchTime.clear();
    int length = packageDetailModel?.data?.branches?.length ?? 0;
    if (length > 0) {
      packageDetailModel?.data?.branches?[0].pickupPeriods
          ?.map((e) => branchTime.add(e.period ?? ''))
          .toList();
      branchTimeIds = packageDetailModel?.data?.branches?[0].pickupPeriods
          ?.map((e) => e.id)
          .toList();
      branchTimeSelectedValue = branchTime[0];
    }
    update();
  }

  String branchTimeSelectedValue = '';
  List branchDays = [
    'sunday',
    'monday',
    'tuesday',
    'wednesday',
    'thursday',
    'friday',
    'saturday',
  ];
  Map<String, dynamic> daysTimeSelectedValues = {};
  List<bool> offDays = List.generate(7, (index) => false);
  Future<List<bool>> getOffDays() async {
    HomeSettingModel? homeSettingsModel =
        await HomeSettingApis().getHomeSetting();
    if (PackageDetailsController.selectedPlanType == "delivery") {
      if (homeSettingsModel?.data?.offDaysDeliverySunday?.toLowerCase() ==
          "true") {
        offDays[0] = true;
      }
      if (homeSettingsModel?.data?.offDaysDeliveryMonday?.toLowerCase() ==
          "true") {
        offDays[1] = true;
      }
      if (homeSettingsModel?.data?.offDaysDeliveryTuesday?.toLowerCase() ==
          "true") {
        offDays[2] = true;
      }
      if (homeSettingsModel?.data?.offDaysDeliveryWednesday?.toLowerCase() ==
          "true") {
        offDays[3] = true;
      }
      if (homeSettingsModel?.data?.offDaysDeliveryThursday?.toLowerCase() ==
          "true") {
        offDays[4] = true;
      }
      if (homeSettingsModel?.data?.offDaysDeliveryFriday?.toLowerCase() ==
          "true") {
        offDays[5] = true;
      }
      if (homeSettingsModel?.data?.offDaysDeliverySaturday?.toLowerCase() ==
          "true") {
        offDays[6] = true;
      }
    } else {
      if (homeSettingsModel?.data?.offDaysPickupSunday?.toLowerCase() ==
          "true") {
        offDays[0] = true;
      }
      if (homeSettingsModel?.data?.offDaysPickupMonday?.toLowerCase() ==
          "true") {
        offDays[1] = true;
      }
      if (homeSettingsModel?.data?.offDaysPickupTuesday?.toLowerCase() ==
          "true") {
        offDays[2] = true;
      }
      if (homeSettingsModel?.data?.offDaysPickupWednesday?.toLowerCase() ==
          "true") {
        offDays[3] = true;
      }
      if (homeSettingsModel?.data?.offDaysPickupThursday?.toLowerCase() ==
          "true") {
        offDays[4] = true;
      }
      if (homeSettingsModel?.data?.offDaysPickupFriday?.toLowerCase() ==
          "true") {
        offDays[5] = true;
      }
      if (homeSettingsModel?.data?.offDaysPickupSaturday?.toLowerCase() ==
          "true") {
        offDays[6] = true;
      }
    }
    return offDays;
  }

  void toggleSelection(int index, String dayName) {
    if (selectedItems.contains(index)) {
      selectedItems.remove(index);
      daysTimeSelectedValues.remove(dayName);
    } else {
      selectedItems.add(index);
      daysTimeSelectedValues[dayName] = {
        'breakfast': [],
        'lunch': [],
        'dinner': [],
        'snack': [],
      };
      Get.log(daysTimeSelectedValues.toString());
    }
    update();
  }

  void toggleBranchTimeSelection(value) {
    if (branchTimeSelectedValue.contains(value)) {
      branchTimeSelectedValue = '';
    } else {
      branchTimeSelectedValue = value;
    }
    update();
  }

  //---------------------------------------------------------------------------------------------------------------------
  PackageDetailModel? packageDetailModel;
  // static List<String> selectedDays = [];
  int daysCount = 0;
  int? daysStart;
  List<Branches>? branches;
  List<String> selectedDays = [];
  List<String> branchTime = [];
  List<int?>? branchTimeIds = [];
  int differenceValue = 0;
  static int? selectedBranchPeriodId;
  static String? startDate;
}
