import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/address_model.dart';
import 'package:nourish_sa/app/data/remote_data_sources/address_apis.dart';

class DeliveryAddressesController extends GetxController {
  //TODO: Implement DeliveryAddressesController
  List<bool>? isChecked;
  List<AddressItem> list = [];

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    list = await AddressApis().getAddress() as List<AddressItem>;
    isChecked = List<bool>.filled(list.length, false);
  }

  void changeCheckBoxSelected(bool newVal, int index) {
    Get.log('ccccc   ' + newVal.toString() + index.toString());
    isChecked?[index] = newVal;
    update();
  }
}
