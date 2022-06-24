import 'package:get/get_core/src/get_main.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/product_model.dart';
import 'package:nourish_sa/app/data/services/network_service.dart/dio_network_service.dart';

class ProductApis{
  Future<List<ProductItem>?> getProducts({required  int category_id}) async {
    List<ProductItem> ?products = [];
    String ? x;
    final request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: 'products?category_id=${category_id}',
      data: const NetworkRequestBody.json(
        {},
      ),
    );

    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      ProductModel
          .fromJson, // <- Function to convert API response to your model
      onReceiveProgress: (count, total) {},
      onSendProgress: (count, total) {},
    );
    Get.log('step  2 '+response.toString());
    response.maybeWhen(
        ok: (model) {
          Get.log('step  3 '+response.toString());
          ProductModel ? productModel=model as ProductModel;
           products=productModel.data?.productdata;
           // Get.log('step  3 '+products?.length.toString());
          // return model.data?.productsList;
        },
        orElse: () {
        });
    return products;
  }

}