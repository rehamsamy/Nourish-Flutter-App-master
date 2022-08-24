import 'package:nourish_sa/app/data/models/coupon_discount_model.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';

import '../../core/values/app_constants.dart';
import '../services/network_service.dart/dio_network_service.dart';

class CartApis {
  static Future<CouponDiscountModel?> getDiscountPrice(
      {required String? coupon,
      required int? branchId,
      required int? packageId,
      required int? totalPrice}) async {
    CouponDiscountModel? couponDiscountModel;

    final String? token = SharedPrefService.getToken() ?? '';
    final request = NetworkRequest(
      type: NetworkRequestType.POST,
      path: 'checkCoupon',
      data: NetworkRequestBody.json(
        {
          "coupon": coupon,
          "branch_id": branchId,
          "package_id": packageId,
          "total": totalPrice
        },
      ),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      CouponDiscountModel
          .fromJson, // <- Function to convert API response to your model
      onReceiveProgress: (count, total) {},
      onSendProgress: (count, total) {},
    );
    response.maybeWhen(
        ok: (model) {
          couponDiscountModel = model.categoryData?.categoriesList;
          return model.categoryData?.categoriesList;
        },
        orElse: () {});
    return couponDiscountModel;
  }
}
