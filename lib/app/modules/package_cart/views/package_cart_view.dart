import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/core/values/assets.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/data/models/subscription_detail_model.dart';
import 'package:nourish_sa/app/modules/package_meals/controllers/package_meals_controller.dart';
import 'package:nourish_sa/app/shared/custom_button.dart';
import 'package:nourish_sa/app/shared/meals_summery_card.dart';
import 'package:nourish_sa/routes/app_pages.dart';
import '../../../../app_theme.dart';
import '../controllers/package_cart_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PackageCartView extends GetView<PackageCartController> {
  // SubscriptionDetailModel? detailModel;
  @override
  Widget build(BuildContext context) {
     int? total =controller.total;
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalKeys.kCart.tr),
        centerTitle: true,
        shadowColor: const Color(0xff000000).withOpacity(0.3),
      ),
      body: GetBuilder<PackageCartController>(
        builder: (_)=> Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 27.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 24.h, bottom: 13.h),
                  child: Text(LocalKeys.kYourPackages.tr,
                      style: Get.textTheme.headline1),
                ),
                controller.isSubscribtion
                    ? Container(
                        width: 358.w,
                        margin: EdgeInsets.only(bottom: 30.h, top: 11.h),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 16.h),
                        child: Wrap(
                          alignment: WrapAlignment.spaceEvenly,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          spacing: 50.w,
                          runSpacing: 10.h,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  Assets.kBookmark,
                                  width: 9.w,
                                  height: 11.h,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Text(
                                  /* ${product?.carb} */ "26% Carb",
                                  style: Get.textTheme.button!
                                      .copyWith(fontSize: 12.sp),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  Assets.kBookmark,
                                  width: 9.w,
                                  height: 11.h,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Text(
                                  /* ${product?.carb} */ "% Fat",
                                  style: Get.textTheme.button!
                                      .copyWith(fontSize: 12.sp),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  Assets.kBookmark,
                                  width: 9.w,
                                  height: 11.h,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Text(
                                  /* ${product?.carb} */ "% Protein",
                                  style: Get.textTheme.button!
                                      .copyWith(fontSize: 12.sp),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  Assets.kBookmark,
                                  width: 9.w,
                                  height: 11.h,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Text(
                                  /* ${product?.carb} */ "% Calories",
                                  style: Get.textTheme.button!
                                      .copyWith(fontSize: 12.sp),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
                Text(
                  LocalKeys.kDays.tr,
                  style: Get.textTheme.headline1,
                ),
                SizedBox(
                  height: 17.h,
                ),
                SizedBox(
                  width: Get.width,
                  height: 44.w,
                  child: OverflowBox(
                    maxWidth: Get.width,
                    minWidth: Get.width,
                    child: SizedBox(
                      height: 44.w,
                      width: Get.width,
                      child: ListView.builder(
                        itemCount: PackageMealsController.selectedDays1.keys.length,
                        padding: EdgeInsetsDirectional.only(start: 22.w),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.w,
                            ),
                            child: InkWell(
                              onTap: (){
                               controller.changeMealSelected(index,PackageMealsController.selectedDays1.keys.elementAt(index));
                                // controller.selectDay(
                                //     PackageMealsController.selectedDays1.keys.elementAt(index));
                              //  Get.log('ffff   '+controller.daySelected.toString()+'  l  '+controller.daysList[index].toString());
                              },
                              child: Container(
                                width: 44.w,
                                height: 44.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.r),
                                  color: index== controller.isMealSelected
                                      ? primaryColor
                                      : whiteColor,
                                  border: Border.all(
                                  color:  index== controller.isMealSelected
                                        ? primaryColor
                                        : lightGreyColor
                                  ),
                                ),
                                child: Text(
                                    (PackageMealsController.selectedDays1.keys.elementAt(index)).substring(0,3),
                                  style: Get.textTheme.headline3!.copyWith(
                                    color: index ==
                                        controller.isMealSelected
                                        ? whiteColor
                                        : lightGreyColor,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                SizedBox(
                  height: 400,
                  child:
                ListView.builder(
                    itemCount: PackageMealsController.selectedDays1.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, inedx) {
                      Get.log('cccc 22 '+PackageMealsController.selectedDays1['tuesday'].toString());
                      // Get.log('size   '+(controller.detailModel?.data?.meals?.saturday?.length.toString()).toString());
                      return MealsSummeryCard( inedx);
                    },
                  ),
                ),

                controller.isSubscribtion
                    ? const SizedBox.shrink()
                    : Column(
                        children: [
                          CartItem(
                            item: LocalKeys.kSubTotal.tr,
                            value:
                                "${controller.detailModel?.data?.priceWithTax} SAR",
                          ),
                          CartItem(
                            item: "${LocalKeys.kDelivery.tr}:",
                            value:
                                "${'0'} SAR",
                          ),
                          CartItem(
                            item: LocalKeys.kTax.tr,
                            value:
                                "${controller.detailModel?.data?.tax} SAR",
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 21.h, bottom: 15.h),
                            child: TextFormField(
                              maxLines: 1,
                              showCursor: true,
                              cursorHeight: 5.h,
                              keyboardType: TextInputType.text,
                              inputFormatters: [
                                WhiteSpacesInputFormatter(),
                              ],
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: LocalKeys.kEnterCouponCode.tr,
                                contentPadding: EdgeInsets.all(20.h),
                                hintStyle: Theme.of(context).textTheme.caption,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.w),
                                  borderSide: BorderSide(
                                    color: primaryColor,
                                    width: 1.w,
                                  ),
                                ),
                                suffixIcon: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 42.h,
                                    width: 87.06.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.sp),
                                      color: primaryColor,
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      LocalKeys.kApply.tr,
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          CartItem(
                            item: LocalKeys.kDiscount.tr,
                            value: "5,0 SAR",
                          ),
                          CartItem(
                            item: LocalKeys.kTotal.tr,
                            value: "$total SAR",
                            isTotal: true,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 35.h, bottom: 24.h),
                            child: CustomButton(
                              title: LocalKeys.kContinue.tr,
                              onPress: () {
                                Get.toNamed(Routes.PAYMENT_METHODS,
                                    arguments: {'total': total});
                              },
                            ),
                          ),
                        ],
                      ),
                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem(
      {required this.item, required this.value, this.isTotal = false, Key? key})
      : super(key: key);
  final String item, value;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item,
            style: isTotal ? Get.textTheme.headline1 : Get.textTheme.headline3,
          ),
          SizedBox(
            width: 11.w,
          ),
          Text(
            value,
            style: isTotal
                ? Get.textTheme.headline1
                : Get.textTheme.headline3!.copyWith(
                    color: blackColor,
                  ),
          ),
        ],
      ),
    );
  }
}

class WhiteSpacesInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var string = text.trim();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
