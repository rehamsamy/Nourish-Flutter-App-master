import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nourish_sa/app_theme.dart';

class SelectionCard extends StatelessWidget {
  const SelectionCard({
    required this.title,
    required this.image,
    required this.isSelected,
    required this.onTap,
    this.isWithCheckBox = false,
    this.isWithBG = false,
    this.endIcon,
    Key? key,
  }) : super(key: key);
  final String title;
  final bool isSelected;
  final String image;
  final VoidCallback onTap;
  final Widget? endIcon;
  final bool isWithCheckBox;
  final bool isWithBG;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 358.w,
        padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 14.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isSelected ? primaryColor : greyColor,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            isWithCheckBox
                ? Padding(
                    padding: EdgeInsetsDirectional.only(end: 6.3.w),
                    child: SizedBox(
                      width: 19.w,
                      height: 19.h,
                      child: Checkbox(
                        value: isSelected,
                        onChanged: (value) {
                          onTap();
                        },
                        activeColor: isSelected ? primaryColor : blackColor,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            Container(
              width: 56.w,
              height: 56.h,
              padding: EdgeInsets.all(8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: !isWithBG
                    ? Colors.transparent
                    : const Color(0xff786CFF).withOpacity(0.16),
              ),
              child: SvgPicture.asset(
                image,
                color: isWithCheckBox ? primaryColor : isWithBG
                    ? null
                    : isSelected
                        ? primaryColor
                        : greyColor,
              ),
            ),
            SizedBox(
              width: isWithCheckBox ? 11.w : 28.w,
            ),
            Text(
              title,
              style: isSelected
                  ? Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: primaryColor)
                  : Theme.of(context).textTheme.bodyText2,
            ),
            if (endIcon != null)
              Expanded(
                child: Row(
                  children: [
                    const Spacer(),
                    endIcon!,
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
