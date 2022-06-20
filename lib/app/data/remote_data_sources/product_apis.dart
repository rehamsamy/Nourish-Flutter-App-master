import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/product_model.dart';
import 'package:nourish_sa/app/data/services/network_service.dart/dio_network_service.dart';

class ProductApis{
  Future<List<ProductItem>?> getProducts() async {
    List<ProductItem> products = [];
    const request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: 'products',
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
    response.maybeWhen(
        ok: (model) {
          products=model.data?.categoriesList;
          return model.data?.productsList;
        },
        orElse: () {});
    return products;
  }

}