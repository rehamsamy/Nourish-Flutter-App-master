import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';

class HeadlineWithViewAll extends StatelessWidget {
  const HeadlineWithViewAll({
    required this.title,
    this.withViewAll = true,
    this.padding,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final String title;
  final bool withViewAll;
  final double? padding;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline1,
          ),
          !withViewAll
              ? const SizedBox.shrink()
              : InkWell(
                  onTap: onTap,
                  child: Text(
                    LocalKeys.kViewAll.tr,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
        ],
      ),
    );
  }
}
