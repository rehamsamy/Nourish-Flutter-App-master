import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/modules/home_page/controllers/home_page_controller.dart';
import '../controllers/packages_controller.dart';
import 'all_package_body.dart';

class PackagesView extends GetView<PackagesController> {
  const PackagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocalKeys.kPackages.tr,
          style: Get.textTheme.bodyText1,
        ),
        centerTitle: true,
        shadowColor: const Color(0xff000000).withOpacity(0.3),
        leading: InkWell(
            onTap: () {
              Get.find<HomePageController>().changeIndex(0);
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: const SingleChildScrollView(
          child: AllPackagesBody(),
        ),
      ),
    );
  }
}
