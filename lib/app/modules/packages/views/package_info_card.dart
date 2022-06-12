import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nourish_sa/app/shared/custom_network_image.dart';
import 'package:nourish_sa/app/core/values/assets.dart';

import '../../../../app_theme.dart';

class PackageInfoCard extends StatelessWidget {
  const PackageInfoCard({
    required this.image,
    required this.options,
    required this.title,
    required this.priceWithVat,
    Key? key,
  }) : super(key: key);
  final String image;
  final String title;
  final List<String> options;
  final String priceWithVat;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 366.w,
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11.r),
        border: Border.all(
          color: lightBlueColor,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff636363).withOpacity(0.17),
            offset: const Offset(0, 5),
            blurRadius: 9,
          )
        ],
      ),
      padding: EdgeInsetsDirectional.only(
          top: 15.h, bottom: 12.9.h, start: 9.w, end: 12.w),
      child: Row(
        children: [
          CustomNetworkImage(
            imageUrl: image,
            height: 120.h,
            width: 120.w,
            radius: 10.r,
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                ListView.builder(
                  itemCount: options.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 11.h),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            Assets.kBookmark,
                            width: 8.w,
                            height: 10.h,
                            color: primaryColor,
                          ),
                          SizedBox(
                            width: 11.w,
                          ),
                          Text(
                            options[index],
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: blueGreyColor),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                RichText(
                  text: TextSpan(
                    text: "$priceWithVat SAR ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: primaryColor),
                    children: <TextSpan>[
                      TextSpan(
                        text: " include 15% VAT",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: blueGreyColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
