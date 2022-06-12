
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/modules/home_page/controllers/home_page_controller.dart';
import 'package:nourish_sa/app/modules/packages/views/package_info_card.dart';
import 'package:nourish_sa/app/shared/dialogs/filter_dialog.dart';
import 'package:nourish_sa/app/shared/tab_bar_selector.dart';
import 'package:nourish_sa/routes/app_pages.dart';

class AllPackagesBody extends StatelessWidget {
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
        TabBarSelector(
          firstTitle: LocalKeys.kMonthly.tr,
          secondTitle: LocalKeys.kWeekly.tr,
          selected: 0,
          onTap: (v) {},
        ),
        SizedBox(
          height: 22.h,
        ),
        ListView.builder(
          itemCount: 6,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Get.toNamed(Routes.PACKAGE_DETAILS),
              child: const PackageInfoCard(
                image:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrKHPsvNDJHY9tWpkHrfkfo8Dkf0LvZU3Hdg&usqp=CAU.png",
                options: [
                  "From 1145 to 2125 Calories",
                  "5 Days x 4 Weeks",
                  "Pause anytime",
                  "1750 SAR/Month",
                ],
                title: "BreadFase",
                priceWithVat: "150",
              ),
            );
          },
        ),
      ],
    );
  }
}
