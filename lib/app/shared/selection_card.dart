import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nourish_sa/app_theme.dart';

class SelectionCard extends StatefulWidget {
  SelectionCard({
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
  bool isSelected;
  final String image;
  final VoidCallback onTap;
  final Widget? endIcon;
  final bool isWithCheckBox;
  final bool isWithBG;

  @override
  State<SelectionCard> createState() => _SelectionCardState();
}

class _SelectionCardState extends State<SelectionCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap();
        widget.isSelected = !widget.isSelected;
        setState(() {});
      },
      child: Container(
        width: 358.w,
        padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 14.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: widget.isSelected ? primaryColor : greyColor,
            width: widget.isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            widget.isWithCheckBox
                ? Padding(
                    padding: EdgeInsetsDirectional.only(end: 6.3.w),
                    child: SizedBox(
                      width: 19.w,
                      height: 19.h,
                      child: Checkbox(
                        value: widget.isSelected,
                        onChanged: (value) {
                          widget.isSelected = value!;
                          setState(() {});
                        },
                        activeColor:
                            widget.isSelected ? primaryColor : blackColor,
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
                color: !widget.isWithBG
                    ? Colors.transparent
                    : const Color(0xff786CFF).withOpacity(0.16),
              ),
              child: SvgPicture.asset(
                widget.image,
                color: widget.isWithCheckBox
                    ? primaryColor
                    : widget.isWithBG
                        ? null
                        : widget.isSelected
                            ? primaryColor
                            : greyColor,
              ),
            ),
            SizedBox(
              width: widget.isWithCheckBox ? 11.w : 28.w,
            ),
            Text(
              widget.title,
              style: widget.isSelected
                  ? Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: primaryColor)
                  : Theme.of(context).textTheme.bodyText2,
            ),
            if (widget.endIcon != null)
              Row(
                children: [
                  const Spacer(),
                  widget.endIcon!,
                ],
              )
          ],
        ),
      ),
    );
  }
}
