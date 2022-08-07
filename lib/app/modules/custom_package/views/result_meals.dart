import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/create_package_model.dart';
import 'package:nourish_sa/app/data/models/package_detail_model.dart';
import 'package:nourish_sa/app/modules/packages/views/package_info_card.dart';
import 'package:nourish_sa/routes/app_pages.dart';

import '../../../core/values/localization/local_keys.dart';
import '../../../data/remote_data_sources/package_apis.dart';

class MyMealResults extends StatelessWidget {
  const MyMealResults({Key? key, required this.package}) : super(key: key);
  final CreatePackageModel? package;
  @override
  Widget build(BuildContext context) {
    print('package: ${package?.data?.packages.toString()}');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(LocalKeys.kAllPackages.tr),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: package?.data?.packages?.length ?? 0,
            itemBuilder: (context, index) {
              return package?.data?.packages?.isNotEmpty ?? true
                  ? InkWell(
                      onTap: () async {
                        PackageDetailModel? model = await PackageApis()
                            .getPackageDetail(
                                package?.data?.packages?[index].id ?? 0);
                        if (model?.data != null) {
                          Get.toNamed(Routes.PACKAGE_DETAILS, arguments: {
                            'packageDetailModel': model,
                            "customPackageData": package?.data?.responseData
                          });
                        }
                      },
                      child: PackageInfoCard(
                        image: package?.data?.packages?[index].image ??
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrKHPsvNDJHY9tWpkHrfkfo8Dkf0LvZU3Hdg&usqp=CAU.png",
                        options: List.generate(
                            package?.data?.packages?[index].descriptions
                                    ?.length ??
                                0,
                            (index2) =>
                                package?.data?.packages?[index]
                                    .descriptions?[index2].desc ??
                                ""),
                        title:
                            package?.data?.packages?[index].name ?? "BreadFase",
                        priceWithVat: package
                                ?.data?.packages?[index].priceWithTax
                                ?.toString() ??
                            "150",
                      ),
                    )
                  : const Center(
                      child: Text("No packages found"),
                    );
            }),
      ),
    );
  }
}
