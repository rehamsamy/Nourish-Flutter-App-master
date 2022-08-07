import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/branch_model.dart';
import '../services/network_service.dart/dio_network_service.dart';
import '../services/shared_pref.dart';

class BranchApis {
  Future<List<BranchItem>?> getBranches() async {
    final String? token = SharedPrefService.getToken() ?? '';

    BranchModel? branchModel = BranchModel();
    List<BranchItem>? list;
    var request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: 'branches',
      data: const NetworkRequestBody.json({}),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    final response = await networkService.execute(
      request,
      BranchModel.fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(
        ok: (model) {
          branchModel = model;
          list = branchModel?.data;
          return list;
        },
        conflict: (err) {
          print('err' + err.toString());
        },
        orElse: () {});
    return list;
  }
}
