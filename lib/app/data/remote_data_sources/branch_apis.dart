import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/branch_model.dart';
import '../services/network_service.dart/dio_network_service.dart';

class BranchApis {
  Future<List<BranchItem>?> getBranches() async {
    BranchModel? branchModel = BranchModel();
    List<BranchItem>? list;
    const request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: 'branches',
      data: NetworkRequestBody.json({}),
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
