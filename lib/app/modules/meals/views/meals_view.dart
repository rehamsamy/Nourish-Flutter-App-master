import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/modules/home_page/controllers/home_page_controller.dart';
import 'package:nourish_sa/app/modules/meals/views/widgets/category_product_card.dart';
import 'package:nourish_sa/app/modules/package_meals/views/widgets/meal_info_dialog.dart';
import 'package:nourish_sa/app/shared/headline_with_view_all.dart';
import 'package:nourish_sa/app/modules/meals/views/widgets/selected_menu.dart';

import '../controllers/meals_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealsView extends GetView<MealsController> {
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
              height: 100.h,
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                itemBuilder: (context, index) {
                  return Obx(
                    () => InkWell(
                      onTap: () {
                        controller.changeSelected(index);
                      },
                      child: SelectedMenu(
                        image:
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrKHPsvNDJHY9tWpkHrfkfo8Dkf0LvZU3Hdg&usqp=CAU.png",
                        title: "HEALTH",
                        color: AppConstants.colorsMenu[index],
                        isSelected: controller.selected.value == index,
                      ),
                    ),
                  );
                },
              ),
            ),
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 27.w),
              child: ListView.builder(
                  itemCount: 5,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.dialog(const MealInfoDialog(
                          image: "",
                          title: "dsads",
                          desc: "sssssssssssssssssssssssss",
                          values: {
                            "Carb": "500",
                            "Protein": "500",
                            "Fat": "500",
                            "Calories": "500"
                          },
                        ));
                      },
                      child: const CategoryProductCard(
                        productName: "sdss",
                        productCalories: "250",
                        image:
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrKHPsvNDJHY9tWpkHrfkfo8Dkf0LvZU3Hdg&usqp=CAU.png",
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
