import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_theme.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown(
      {required this.hintText,
      required this.items,
      this.values,
      required this.width,
      required this.currentValue,
      required this.onChanged,
      this.isEnabled = true,
      this.title,
      Key? key})
      : super(key: key);
  final double width;
  final List<String> items;
  final List<String>? values;
  final String hintText;
  final String? title;
  final bool isEnabled;
  final String currentValue;
  final Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: EdgeInsets.only(bottom: 9.h),
            child: SizedBox(
              width: width,
              child: Text(
                title!,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
        Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: DropdownButton2<String>(
            hint: SizedBox(
              width: width - 40.w,
              child: Text(
                hintText,
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 14.sp,
                    ),
              ),
            ),
            buttonWidth: width,
            buttonPadding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            buttonDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: lightGreyColor,
              ),
            ),
            underline: const SizedBox.shrink(),
            icon: Icon(
              Icons.keyboard_arrow_down,
              size: 18.r,
              color: blackColor,
            ),
            value: currentValue,
            onChanged: onChanged,
            items: items.map<DropdownMenuItem<String>>((e) {
              return DropdownMenuItem(
                child: SizedBox(
                  width: width - 40.w,
                  child: Text(
                    e,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                value: values != null ? values![items.indexOf(e)] : e,
                enabled: isEnabled,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
