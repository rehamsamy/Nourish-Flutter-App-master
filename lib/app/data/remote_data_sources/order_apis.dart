import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/add_order_model.dart';
import 'package:nourish_sa/app/data/models/change_order_period_model.dart';
import 'package:nourish_sa/app/data/services/network_service.dart/dio_network_service.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';

class OrderApis{
  Future<ChangeOrderPeriodModel?> changeOrderPeriod(
      int ? orderId,int ? periodId) async {
    ChangeOrderPeriodModel orderPeriodModel=ChangeOrderPeriodModel();
    final String? token = Get.find<SharedPrefService>().getToken() ?? '';

    Map<String, dynamic>? map = {
      'order_id': orderId,
      'period_id': periodId,

    };
    final request = NetworkRequest(
      type: NetworkRequestType.POST,
      path: 'changeOrderPeriod',
      data: NetworkRequestBody.json(map),
        headers: {
          'Authorization':'Bearer $token',
        }
    );
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      ChangeOrderPeriodModel.fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(
        ok: (response) {
          orderPeriodModel=response;
          return orderPeriodModel;
        },
        badRequest: (info) {},
        orElse: () {});

    return orderPeriodModel;
  }


  Future<AddOrderModel?> addOrder({required String start_date,
                                            required int package_id,
                                            required String delivery_type,
                                            required int branch_id,
                                            required int address_id,
                                            required int period_id,
                                            required int payment_id,



                                            }) async {
    AddOrderModel addOrderModel=AddOrderModel();

    Map<String, dynamic>? map = {
      'start_date': start_date,
      'package_id': package_id,
      'delivery_type':delivery_type,
      'branch_id':branch_id,
      'address_id':address_id,
      'period_id':period_id,
      'payment_id':payment_id,
      'days[sunday][breakfast][]':1,
       'days[sunday][lunch][]':1,
      'days[sunday][dinner][]':1,
       'days[monday][breakfast][]':1,
      'days[monday][lunch][]':1,
       'days[monday][dinner][]':1,
        'days[tuesday][breakfast][]':1,
        'days[tuesday][lunch][]':1,
        'days[tuesday][dinner][]':1
    };
    final request = NetworkRequest(
        type: NetworkRequestType.POST,
        path: 'addOrder',
        data: NetworkRequestBody.json(map),

    );
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      AddOrderModel.fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(
        ok: (response) {
          addOrderModel=response;
          return addOrderModel;
        },
        badRequest: (info) {},
        orElse: () {});

    return addOrderModel;
  }

}