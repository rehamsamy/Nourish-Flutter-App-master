import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/data/models/package_detail_model.dart';
import 'package:nourish_sa/app/data/remote_data_sources/package_apis.dart';
import 'package:nourish_sa/app/shared/search_item.dart';
import 'package:nourish_sa/routes/app_pages.dart';

import '../../../../app_theme.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
      builder: (_) => Scaffold(
//        appBar: AppBar(
//          titleSpacing: 0,
//          leading: IconButton(
//            onPressed: () {
//              Get.back();
//            },
//            icon: Icon(
//              Icons.arrow_back_rounded,
//              size: 30.r,
//              color: Colors.black,
//            ),
//          ),
//          title: SizedBox(
//            height: 48.h,
//            child: TextFormField(
//              controller: controller.searchController,
//              decoration: InputDecoration(
//                contentPadding:
//                    EdgeInsets.symmetric(horizontal: 8.w, vertical: 15.h),
//                isDense: true,
//                hintText: LocalKeys.kSearch.tr,
//              ),
//              style: Theme.of(context).textTheme.bodyText2,
//              onChanged: (val) {
//                controller.onSearchTextChanged(val);
//              },
//            ),
//          ),
//          centerTitle: true,
//          shadowColor: const Color(0xff000000).withOpacity(0.3),
//          actions: [
//            Container(
//              height: 48.h,
//              constraints: BoxConstraints.tightFor(height: 48.h, width: 70.w),
//              child: InkWell(
//                onTap: () {},
//                child: Container(
//                  height: 48.h,
//                  margin: EdgeInsetsDirectional.only(
//                    end: 27.w,
//                    start: 6.w,
//                  ),
////                  padding: EdgeInsets.symmetric(
////                    horizontal: 8.w,
////                    vertical: 8.h,
////                  ),
//                  decoration: BoxDecoration(
//                    color: primaryColor,
//                    borderRadius: BorderRadius.circular(10.r),
//                  ),
//                  child: SvgPicture.asset(
//                    Assets.kSearch,
//                    color: Colors.white,
//                    width: 23.w,
//                    height: 23.h,
//                  ),
//                ),
//              ),
//            )
//          ],
//        ),
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              SizedBox(
                height: 46.h,
              ),
              SizedBox(
                height: 60.h,
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        size: 30.r,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 52.h,
                        child: TextFormField(
                          controller: controller.searchController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 15.h,
                            ),
                            isDense: true,
                            hintText: LocalKeys.kSearch.tr,
                          ),
                          style: Theme.of(context).textTheme.bodyText2,
                          onChanged: (val) {
                            controller.onSearchTextChanged(val);
                          },
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 52.w,
                        height: 52.h,
                        padding: EdgeInsets.all(12.w),
                        margin: EdgeInsetsDirectional.only(
                          end: 27.w,
                          start: 6.w,
                        ),
//                  padding: EdgeInsets.symmetric(
//                    horizontal: 8.w,
//                    vertical: 8.h,
//                  ),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: SvgPicture.asset(
                          Assets.kSearch,
                          color: Colors.white,
                          width: 23.w,
                          height: 23.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GetBuilder<SearchController>(
                  builder: (_) => SizedBox(
                    width: Get.width,
                    height: Get.height,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 27.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: controller.searchList?.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () async {
                                    PackageDetailModel? model =
                                        await PackageApis().getPackageDetail(
                                            controller.searchList?[index].id ??
                                                0);
                                    if (model?.data != null) {
                                      Get.toNamed(Routes.PACKAGE_DETAILS,
                                          arguments: {
                                            'packageDetailModel': model
                                          });
                                    }
                                  },
                                  child: SearchItem(
                                    text: controller.searchList?[index].name ??
                                        ' ',
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
