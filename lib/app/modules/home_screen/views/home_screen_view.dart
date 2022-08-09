import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/data/models/categories_model.dart';
import 'package:nourish_sa/app/data/models/home_package_model.dart';
import 'package:nourish_sa/app/data/models/package_detail_model.dart';
import 'package:nourish_sa/app/data/remote_data_sources/home_apis.dart';
import 'package:nourish_sa/app/data/remote_data_sources/package_apis.dart';
import 'package:nourish_sa/app/modules/home_page/controllers/home_page_controller.dart';
import 'package:nourish_sa/app/modules/home_screen/views/widgets/meal_loading.dart';
import 'package:nourish_sa/app/modules/packages/views/all_package_body.dart';
import 'package:nourish_sa/app/shared/dialogs/filter_dialog.dart';
import 'package:nourish_sa/app/shared/headline_with_view_all.dart';
import 'package:nourish_sa/app/modules/home_screen/views/widgets/meal_card.dart';
import 'package:nourish_sa/app/modules/home_screen/views/widgets/package_card.dart';
import 'package:nourish_sa/app/shared/custom_appbar.dart';
import 'package:nourish_sa/app/shared/range_slider.dart';
import 'package:nourish_sa/app_theme.dart';
import 'package:nourish_sa/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/home_screen_controller.dart';
import 'widgets/drawer.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  HomeScreenView({Key? key}) : super(key: key);
  List<CategoryItem> categoriesList = [];
  static List<PackageItem> homePackagesList = [];

  @override
  Widget build(BuildContext context) {
    controller.filterSelected=false;
    Get.log('home  ==>'+controller.filterSelected.toString());
    return GetBuilder<HomeScreenController>(
      builder: (_) =>
          Scaffold(
            key: controller.scaffoldKey,
            appBar: CustomAppBar(
              scaffoldKey: controller.scaffoldKey,
            ),
            drawer: const MainDrawer(),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*  Padding(
                padding: EdgeInsets.only(
                    top: 35.h, bottom: 15.h, left: 27.w, right: 27.w),
                child: Text(
                  LocalKeys.kPerfectPackages.tr,
                  style: Get.textTheme.headline1,
                ),
              ), */
                  const SizedBox(height: 16),
                  SearchBar(homePackagesList: homePackagesList),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 26.h, bottom: 8.h),
                        child: HeadlineWithViewAll(
                          title: LocalKeys.kMenus.tr,
                          withViewAll: true,
                          onTap: () {
                            Get.find<HomePageController>().changeIndex(1);
                          },
                        ),
                      ),
                      FutureBuilder(
                          future: HomeApis().getHomeCategories(),
                          builder: (_, snapshot) {
                            if (snapshot.hasData) {
                              categoriesList = snapshot.data as List<CategoryItem>;
                              return SizedBox(
                                  width: Get.width,
                                  height: 100.h,
                                  child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: categoriesList.length,
                                    scrollDirection: Axis.horizontal,
                                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                                    itemBuilder: (context, index) {
                                      return MealCard(
                                          title: categoriesList[index].name ?? '',
                                          color: AppConstants.colorsMenu[index % 5],
                                          image: categoriesList[index].image ?? '');
                                    },
                                  ));
                            } else {
                              return SizedBox(
                                  width: Get.width,
                                  height: 100.h,
                                  child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: categoriesList.length,
                                    scrollDirection: Axis.horizontal,
                                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                                    itemBuilder: (context, index) {
                                      return MealLoading(128.w, 99.h);
                                    },
                                  ));
                            }
                          }),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 31.h, bottom: 20.h),
                    child: HeadlineWithViewAll(
                      title: LocalKeys.kPackages.tr,
                      withViewAll: false,
                      onTap: () {
                        Get.find<HomePageController>().changeIndex(2);
                      },
                    ),
                  ),
                  getHomePackageAndFilter(),

                  // FutureBuilder(
                  //     future:!(controller.filterSelected)?HomeApis().getHomePackages():
                  //     HomeApis().getFilterPackages(controller.packageFilterType, RangeSliderPickerState.selectedRangeValues?.start,
                  //         RangeSliderPickerState.selectedRangeValues?.end),
                  //     builder: (_, snapshot) {
                  //       if (snapshot.hasData) {
                  //         List<PackageItem>   homePackagesList = snapshot.data as List<PackageItem>;
                  //          controller.tooglePackageList(homePackagesList);
                  //         homePackagesList=controller.homeFilterPackagesList as List<PackageItem> ;
                  //         Get.log('list size   ===> '+homePackagesList.length.toString());
                  //         return SizedBox(
                  //             width: Get.width,
                  //             height: 185.h,
                  //             child: buildSwiper(
                  //               homePackagesList.length,
                  //             ));
                  //       } else {
                  //         return SizedBox(
                  //             width: Get.width,
                  //             height: 185.h,.
                  //             child: ListView.builder(
                  //               physics: const BouncingScrollPhysics(),
                  //               scrollDirection: Axis.horizontal,
                  //               itemBuilder: (context, index) =>
                  //                   MealLoading(220.w, 140.h),
                  //             ));
                  //       }
                  //     }),
                  SizedBox(
                    height: 52.h,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.CUSTOM_PACKAGE);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 27.w),
                      child: Center(
                        child: Image.asset(
                          Assets.kOwnPackage,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  const AllPackagesBody(
                    isWithFilter: false,
                  ),
                ],
              ),
            ),
          ),
    );
  }

  buildSwiper(int length,) {
    return Swiper(
      outer: true,
      physics: const BouncingScrollPhysics(),
      itemCount: length,
      autoplay: true,
      itemWidth: 155.h,
      viewportFraction: 0.8,
      itemBuilder: (context, index) {
        return PackageCard(
            title: controller.homeFilterPackagesList[index].name ?? '',
            onTap: () async {
              PackageDetailModel? model = await PackageApis()
                  .getPackageDetail(controller.homeFilterPackagesList[index].id ?? 0);
              if (model?.data != null) {
                Get.toNamed(Routes.PACKAGE_DETAILS,
                    arguments: {'packageDetailModel': model});
              }
            },
            image: controller.homeFilterPackagesList[index].image ?? '');
      },
      pagination: SwiperPagination(
        margin: EdgeInsets.only(top: 10.h),
        builder: SwiperCustomPagination(
          builder: (BuildContext context, SwiperPluginConfig config) {
            final list = <Widget>[];

            for (var i = 0; i < config.itemCount; ++i) {
              final active = i == config.activeIndex;
              list.add(Container(
                key: Key('pagination_$i'),
                margin: EdgeInsets.all(3.w),
                child: ClipOval(
                  child: Container(
                    width: active ? 12.w : 5.h,
                    height: active ? 5.h : 5.h,
                    decoration: BoxDecoration(
                      color: active ? primaryColor : greyColor,
                      borderRadius: active ? BorderRadius.circular(20.r) : null,
                      shape: active ? BoxShape.rectangle : BoxShape.circle,
                    ),
                  ),
                ),
              ));
            }
            return Row(
              key: key,
              mainAxisSize: MainAxisSize.min,
              children: list,
            );
          },
        ),
      ),
    );
  }

  getHomePackageAndFilter() {
    if (!controller.packageLoading) {
      return SizedBox(
          width: Get.width,
          height: 185.h,
          child: buildSwiper(
            controller.homeFilterPackagesList.length,
          ));
    }
    else {
      if (controller.homeFilterPackagesList.isNotEmpty) {
        return SizedBox(
            width: Get.width,
            height: 185.h,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => MealLoading(220.w, 140.h),
            ));
      }
      else {
        return SizedBox(
            width: Get.width,
            height: 185.h,
            child: Center(child: Text('no packages found')));
      }
    }
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.homePackagesList,
  }) : super(key: key);

  final List<PackageItem> homePackagesList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 313.w,
              child: InkWell(
                onTap: () => Get.toNamed(Routes.SEARCH, arguments: {
                  'packagesList': HomeScreenView.homePackagesList
                }),
                child: Container(
                  height: 53.h,
                  width: 374.w,
                  decoration: BoxDecoration(
                    color: const Color(0xffF2F2F2),
                    borderRadius: BorderRadius.circular(9.r),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                          start: 13.w,
                          end: 10.6.w,
                        ),
                        child: SvgPicture.asset(
                          Assets.kSearch,
                          width: 22.h,
                          color: const Color(0xff9C9C9D),
                          height: 22.h,
                        ),
                      ),
                      Text(
                        "${LocalKeys.kSearch.tr} . . . ",
                        style: Get.textTheme.caption!.copyWith(
                          color: greyColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 6.w,
            ),
            InkWell(
              onTap: () {
                Get.dialog(const FilterDialog());
              },
              child: Container(
                width: 52.w,
                height: 53.h,
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: SvgPicture.asset(
                  Assets.kfilter,
                  height: 26.w,
                  width: 26.w,
                  color: Colors.white,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
