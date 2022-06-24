import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/add_address_model.dart';
import 'package:nourish_sa/app/data/services/network_service.dart/dio_network_service.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';

class AddressApis{
  Future<AddAddressModel?> addAddress(
      {required double lat,
        required double lng ,
        required String name,
        required String address_type,
        required String area,
        required int building,
        required int flat,
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
    const   String token1='eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpLmVhdC1ub3VyaXNoLmNvbVwvYXBpXC9hdXRoXC92ZXJpZnlNb2JpbGVPVFAiLCJpYXQiOjE2NTU3NDY4NjIsImV4cCI6MTY1NTc1MDQ2MiwibmJmIjoxNjU1NzQ2ODYyLCJqdGkiOiJLMmZ6TWYwZGxaZzk2MGN6Iiwic3ViIjoxNywicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.uezCaWKBlwynQq-CEfIgI1RN8fkcHj5an4NzTMeOlPE';
    AddAddressModel addressModel = AddAddressModel();
    final String? token = Get.find<SharedPrefService>().getToken() ?? '';
    final request =  NetworkRequest(
        type: NetworkRequestType.POST,
        path: 'updateProfile',
        data: NetworkRequestBody.json(
         map
        ),
        headers: {'Authorization':'Bearer $token1'}
    );
    final response = await networkService.execute(
      request,
      AddAddressModel.fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(
        ok: (response) {
          addressModel = response;
        },
        orElse: () {});
    return addressModel;
  }

}