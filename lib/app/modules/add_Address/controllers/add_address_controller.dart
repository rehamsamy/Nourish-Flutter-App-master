import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/subscription_detail_model.dart';

import 'package:nourish_sa/app/data/services/analytics_service.dart';

class AddAddressController extends GetxController {
  TextEditingController addressName = TextEditingController();
  @override
  void onInit() {
    AnalyticsService.instance.logEvent("Add_Address_View");
    super.onInit();
    Address? address;

    setAddressData(newAddress) {
      address = newAddress;
      update();
    }
  }
}
