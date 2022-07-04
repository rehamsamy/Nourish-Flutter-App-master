
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/add_address_model.dart';
import 'package:nourish_sa/app/data/models/address_model.dart';
import 'package:nourish_sa/app/data/services/network_service.dart/dio_network_service.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';

class AddressApis{
  Future<AddAddressModel?> addAddress(
      {required double lat,
        required double lng ,
        required String name,
        required String address_type,
        required String area,
        required String building,
        required String flat,
        required String street,
        required String postal_code,
        required int additional_number,
        required String delivery_instructions
      }) async {

    Map<String ,dynamic> map={
        'lat':lat,
      'lng' :lng,
      'name':name,
      'address_type':address_type,
      'area':area,
      'building':building,
      'flat':flat,
      'street':street,
      'postal_code':postal_code,
      'additional_number':additional_number,
      'delivery_instructions':delivery_instructions
    };
       AddAddressModel ?addressModel;
    final String? token = Get.find<SharedPrefService>().getToken() ?? '';
    final request =  NetworkRequest(
        type: NetworkRequestType.POST,
        path: 'addAddress',
        data: NetworkRequestBody.json(
         map
        ),
        headers: {'Authorization':'Bearer $token'}
    );
    final response = await networkService.execute(
      request,
      AddAddressModel.fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(
        ok: (response) {
          addressModel = response as AddAddressModel;
        },
        orElse: () {});
    return addressModel;
  }


  Future<List<AddressItem>?> getAddress()async{
    List<AddressItem>?  list = [];
    final String? token = Get.find<SharedPrefService>().getToken() ?? '';
    final request =  NetworkRequest(
        type: NetworkRequestType.GET,
        path: 'getAddresses',
        data: const NetworkRequestBody.json(
            {}),
        headers: {'Authorization':'Bearer $token'}
    );
    final response = await networkService.execute(
      request,
      AddressModel.fromJson, // <- Function to convert API response to your model
    );
    Get.log('ccccccc  3'+response.toString());
    response.maybeWhen(
        ok: (response) {
          AddressModel model=response as AddressModel;
          list = model.data  ;
          Get.log('ccccccc  3'+(list?.length.toString()).toString());
        },
        orElse: () {});
    return list;
  }

}