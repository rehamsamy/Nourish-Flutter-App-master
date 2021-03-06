import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/data/models/package_detail_model.dart';
import 'package:nourish_sa/app/data/models/package_model.dart';
import 'package:nourish_sa/app/data/remote_data_sources/package_apis.dart';
import 'package:nourish_sa/app/modules/home_page/controllers/home_page_controller.dart';
import 'package:nourish_sa/app/modules/packages/controllers/packages_controller.dart';
import 'package:nourish_sa/app/modules/packages/views/package_info_card.dart';
import 'package:nourish_sa/app/shared/dialogs/filter_dialog.dart';
import 'package:nourish_sa/app/shared/tab_bar_selector.dart';
import 'package:nourish_sa/routes/app_pages.dart';
import 'package:shimmer/shimmer.dart';

class AllPackagesBody extends GetView<PackagesController> {
  const AllPackagesBody({this.isWithFilter = true, Key? key}) : super(key: key);
  final bool isWithFilter;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 35.h,
            bottom: 15.h,
            left: 27.w,
            right: 27.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocalKeys.kAllPackages.tr,
                style: Get.textTheme.headline1,
              ),
              isWithFilter
                  ? InkWell(
                      onTap: () => Get.dialog(const FilterDialog()),
                      child: SvgPicture.asset(
                        Assets.kfilter,
                        width: 19.59.w,
                        height: 18.14.h,
                        fit: BoxFit.cover,
                      ),
                    )
                  : InkWell(
                      onTap: () =>
                          Get.find<HomePageController>().changeIndex(2),
                      child: Text(
                        LocalKeys.kViewAll.tr,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
            ],
          ),
        ),
        Obx(
          () => TabBarSelector(
            firstTitle: LocalKeys.kMonthly.tr,
            secondTitle: LocalKeys.kWeekly.tr,
            selected: controller.selectedPackageType.value,
            onTap: (v) {
              controller.changeSelectedPackageType(v);
              Get.log('tab   ---- ' + v.toString());
            },
          ),
        ),
        SizedBox(
          height: 22.h,
        ),
        Obx(
          () => FutureBuilder(
              future: PackageApis().getPackagesAccordingType(
                  controller.selectedPackageType == 0 ? 'monthly' : 'weekly'),
              builder: (_, snap) {
                if (snap.hasData) {
                  List<PackageItem> packagesList =
                      snap.data as List<PackageItem>;
                  if (packagesList.isNotEmpty) {
                    return ListView.builder(
                      itemCount: packagesList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () async {
                            PackageDetailModel? model = await PackageApis()
                                .getPackageDetail(packagesList[index].id ?? 0);
                            if (model?.data != null) {
                              Get.toNamed(Routes.PACKAGE_DETAILS,
                                  arguments: {'packageDetailModel': model});
                            }
                          },
                          child: PackageInfoCard(
                            image: packagesList[index].image ??
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrKHPsvNDJHY9tWpkHrfkfo8Dkf0LvZU3Hdg&usqp=CAU.png",
                            options: List.generate(
                                packagesList[index].descriptions?.length ?? 0,
                                (index2) =>
                                    packagesList[index]
                                        .descriptions?[index2]
                                        .desc ??
                                    ""),
                            title: packagesList[index].name ?? "BreadFase",
                            priceWithVat:
                                packagesList[index].priceWithTax?.toString() ??
                                    "150",
                          ),
                        );
                      },
                    );
                  } else {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      // height: 300,
                      child: const Center(
                        child: PackageInfoCard(
                            title: "BreadFase",
                            priceWithVat: "150",
                            image: "",
                            options: ["1", "2", "3"]),
                      ),
                    );
                  }
                } else {
                  return const SizedBox(
                    height: 300,
                  );
                }
              }),
        ),
      ],
    );
  }
}
