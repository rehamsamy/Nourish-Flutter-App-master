import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nourish_sa/app_theme.dart';

class CustomInput extends StatelessWidget {
  CustomInput({
    required this.hint,
    required this.textEditingController,
    this.isEnabled = true,
    this.isPassword = false,
    this.title,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.textInputType,
    this.secondTitle,
    this.height,
    this.maxLength,
    this.width,
    this.initalValue,
    Key? key,

  }) : super(key: key);
  final String? secondTitle;

  final String? title;
  final String hint;
  final String? prefixIcon;
  final String? suffixIcon;
  final TextEditingController textEditingController;
  final TextInputType? textInputType;
  final bool isEnabled;
  final String? Function(String?)? validator;
  final ValueNotifier<bool> changeObscure = ValueNotifier(true);
  final bool isPassword;
  final double? width;
  final String?initalValue;
 //final  Function(String) onChange;
  final double? height;
  final int? maxLength;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          RichText(
            text: TextSpan(
              text: title,
              style: Theme.of(context).textTheme.headline3,
              children: <TextSpan>[
                if (secondTitle != null)
                  TextSpan(
                    text: " $secondTitle",
                    style: Theme.of(context).textTheme.caption,
                  ),
              ],
            ),
          ),
        Padding(
          padding: EdgeInsets.only(
            top: 7.h,
            bottom: maxLength != null ? 0 : 17.h,
          ),
          child: ValueListenableBuilder<bool>(
            valueListenable: changeObscure,
            builder: (context, value, _) {
              return SizedBox(
                // height: height ?? 50.h,
                width: width ?? double.infinity,
                child: TextFormField(
                  controller: textEditingController,
                  keyboardType: textInputType,
                  enabled: isEnabled,
                  obscureText: !isPassword ? !value : value,
                  style: Theme.of(context).textTheme.bodyText2,
                  maxLength: maxLength,
                  decoration: InputDecoration(
                    hintText: hint,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                    suffixIcon: suffixIcon != null
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: SvgPicture.asset(
                              suffixIcon!,
                              color: lightGreyColor,
                            ),
                          )
                        : !isPassword
                            ? null
                            : GestureDetector(
                                onTap: () {
                                  changeObscure.value = !value;
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Icon(
                                      value ? Icons.lock_open : Icons.lock),
                                ),
                              ),
                    suffixIconConstraints:
                        BoxConstraints(maxHeight: 27.h, maxWidth: 50.w),
                    prefixIconConstraints:
                        BoxConstraints(maxHeight: 27.h, maxWidth: 50.w),
                    prefixIcon: prefixIcon == null
                        ? null
                        : Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: SvgPicture.asset(prefixIcon!),
                          ),
                  ),
                  validator: validator,
               //   onChanged: (val){onChange(value);},
                  inputFormatters: [
                    if (maxLength == 10) FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
