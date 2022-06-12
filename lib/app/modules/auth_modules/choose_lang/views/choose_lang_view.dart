import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app/shared/selection_card.dart';
import 'package:nourish_sa/routes/app_pages.dart';
import '../../../../../app_theme.dart';
import '../controllers/choose_lang_controller.dart';

class ChooseLangView extends GetView<ChooseLangController> {
  const ChooseLangView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 75.h, horizontal: 36.w),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocalKeys.kChooseLanguage.tr,
                style: Get.textTheme.bodyText2,
              ),
              Padding(
                padding: EdgeInsets.only(top: 43.h, bottom: 18.h),
                child: SelectionCard(
                  title: LocalKeys.kArabic,
                  image: Assets.klang,
                  isSelected: controller.isSelected.value,
                  onTap: controller.onChangeLang,
                  endIcon: !controller.isSelected.value
                      ? const SizedBox.shrink()
                      : Container(
                          width: 31.w,
                          height: 31.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: primaryColor, width: 2.w),
                          ),
                          child: Icon(
                            Icons.done,
                            color: primaryColor,
                            size: 25.r,
                          ),
                        ),
                ),
              ),
              SelectionCard(
                title: LocalKeys.kEnglish.tr,
                image: Assets.klang,
                isSelected: !controller.isSelected.value,
                onTap: controller.onChangeLang,
                endIcon: controller.isSelected.value
                    ? const SizedBox.shrink()
                    : Container(
                        width: 31.w,
                        height: 31.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: primaryColor, width: 2.w),
                        ),
                        child: Icon(
                          Icons.done,
                          color: primaryColor,
                          size: 25.r,
                        ),
                      ),
              ),
              const Spacer(),
              CustomButton(
                  title: LocalKeys.kContinue.tr,
                  onPress: () {
                    Get.offNamed(
                      Routes.ON_BOARDING,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
