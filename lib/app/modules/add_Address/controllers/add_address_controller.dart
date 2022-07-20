import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/subscription_detail_model.dart';

import 'package:nourish_sa/app/data/services/analytics_service.dart';

class AddAddressController extends GetxController {
  TextEditingController addressName = TextEditingController();
  String addressType = "Home";
  TextEditingController area = TextEditingController();
  TextEditingController building = TextEditingController();
  TextEditingController flat = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  TextEditingController additionalNumber = TextEditingController();
  TextEditingController deliveryInstructions = TextEditingController();

  Address? address;

  Position? location;
  setAddressData(newAddress) {
    address = newAddress;
    update();
  }

  @override
  void onInit() {
    AnalyticsService.instance.logEvent("Add_Address_View");
    super.onInit();
  }
}
