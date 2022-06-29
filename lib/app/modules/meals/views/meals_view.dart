import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/data/models/categories_model.dart';
import 'package:nourish_sa/app/data/models/product_model.dart';
import 'package:nourish_sa/app/data/remote_data_sources/home_apis.dart';
import 'package:nourish_sa/app/data/remote_data_sources/product_apis.dart';
import 'package:nourish_sa/app/modules/home_page/controllers/home_page_controller.dart';
import 'package:nourish_sa/app/modules/home_screen/views/widgets/meal_loading.dart';
import 'package:nourish_sa/app/modules/meals/views/widgets/category_product_card.dart';
import 'package:nourish_sa/app/modules/package_meals/views/widgets/meal_info_dialog.dart';
import 'package:nourish_sa/app/shared/headline_with_view_all.dart';
import 'package:nourish_sa/app/modules/meals/views/widgets/selected_menu.dart';

import '../controllers/meals_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealsView extends GetView<MealsController> {
  const MealsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu',
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 35.h, bottom: 15.h, left: 27.w, right: 27.w),
              child: Text(
                LocalKeys.kMenuCategories.tr,
                style: Get.textTheme.headline1,
              ),
            ),
            SizedBox(
                width: Get.width,
                height: 120.h,
                child: FutureBuilder<List<CategoryItem>?>(
                    future: HomeApis().getHomeCategories(),
                    builder: (_, snap) {
                      if (snap.hasData) {
                        List<CategoryItem>? categories = snap.data;
                        return ListView.builder(
                          itemCount: categories?.length ?? 0,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          itemBuilder: (context, index) {
                            return Obx(
                              () => InkWell(
                                  onTap: () {
                                    controller.changeSelected(index);
                                    controller.changeCategoryId(
                                        categories?[index].id);
                                  },
                                  child: SelectedMenu(
                                    image: categories?[index].image ?? '',
                                    title: categories?[index].name ?? '',
                                    color: AppConstants.colorsMenu[index % 5],
                                    isSelected:
                                        controller.selected.value == index,
                                  )),
                            );
                          },
                        );
                      } else {
                        return ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          itemBuilder: (context, index) {
                            return MealLoading(111.w, 99.h);
                          },
                        );
                      }
                    })),
            Padding(
              padding: EdgeInsets.only(top: 26.h, bottom: 8.h),
              child: HeadlineWithViewAll(
                title: "Healthy Category",
                withViewAll: false,
                onTap: () {},
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Obx(
              () => Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 27.w),
                child: FutureBuilder(
                    future: ProductApis()
                        .getProducts(category_id: controller.categoryId.value),
                    builder: (_, snap) {
                      if (snap.hasData) {
                        List<ProductItem>? list =
                            snap.data as List<ProductItem>;
                        Get.log(
                            '****** ' + controller.categoryId.value.toString());
                        if (list.length > 0) {
                          return ListView.builder(
                              itemCount: list.length,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Get.dialog(MealInfoDialog(
                                      image: list[index].image ?? '',
                                      title: list[index].name ?? '',
                                      desc: list[index].description ?? '',
                                      values: {
                                        "Carb": list[index].carb.toString(),
                                        "Protein":
                                            list[index].protein.toString(),
                                        "Fat": list[index].fat.toString(),
                                        "Calories":
                                            list[index].calories.toString()
                                      },
                                    ));
                                  },
                                  child: CategoryProductCard(
                                    productName: list[index].name,
                                    productCalories:
                                        list[index].calories.toString(),
                                    image: list[index].image,
                                  ),
                                );
                              });
                        } else {
                          return const SizedBox(
                              height: 200,
                              child: Center(
                                  child: Text(
                                'no data found',
                              )));
                        }
                      } else {
                        return SizedBox(
                          height: 200,
                        );
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
