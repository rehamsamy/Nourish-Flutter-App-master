import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/subscription_detail_model.dart';

class AddAddressController extends GetxController {
  TextEditingController addressName = TextEditingController();
  Address? address;

  setAddressData( newAddress){
 address=newAddress;
 update();
  }
}
