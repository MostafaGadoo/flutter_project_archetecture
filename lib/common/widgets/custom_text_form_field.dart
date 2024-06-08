import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_state/common/widgets/custom_text.dart';
import 'package:real_state/core/utils/color_helper.dart';


class CustomTextFormField extends StatelessWidget {
  final String label;
  final String? prefixIcon;
  final String? suffixIcon;
  final Color? iconColor;
  final String? hintText;
  final String? initialValue;
  final TextAlign textAlign;
  final VoidCallback? onTap;
  final Function()? suffixIconClick;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;
  final double? suffixIconScale;
  final double? prefixIconScale;
  final TextInputType? inputType;
  final List<TextInputFormatter>? formatter;
  final String? errorText;
  final bool enabled;
  final bool readOnly;
  final bool isMobileNumber;
  final String? language;
  final bool viewMode;

  const CustomTextFormField(
      {this.obscureText = false,
      this.controller,
      required this.label,
      this.prefixIcon,
      this.suffixIcon,
      this.suffixIconScale,
      this.prefixIconScale,
      this.iconColor,
      this.hintText,
      this.initialValue,
      this.textAlign = TextAlign.start,
      super.key,
      this.onTap,
      this.onChanged,
      this.onFieldSubmitted,
      this.validator,
      this.suffixIconClick,
      this.inputType = TextInputType.text,
      this.formatter,
      this.errorText,
      this.enabled = true,
      this.readOnly = false,
      this.isMobileNumber = false,
      this.language = "",
      this.viewMode = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            label,
            textAlign: TextAlign.start,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                color: ColorHelper.greyLight,
                fontSize: 14.h),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 80.h,
          child: TextFormField(
              readOnly: readOnly ? true : false,
              enabled: enabled ? true : false,
              controller: controller,
              onTap: enabled != null || enabled != false ? onTap : null,
              onChanged:
                  onChanged != null ? (value) => onChanged!(value) : null,
              onFieldSubmitted: onFieldSubmitted != null
                  ? (value) => onFieldSubmitted!(value)
                  : null,
              onTapOutside: (value) => FocusScope.of(context).unfocus(),
              obscureText: obscureText,
              obscuringCharacter: '●',
              initialValue: initialValue,
              keyboardType: inputType,
              validator: validator,
              inputFormatters: inputType == TextInputType.number
                  ? [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      // LengthLimitingTextInputFormatter(2),
                    ]
                  : formatter,
              style: TextStyle(
                  color: viewMode ? ColorHelper.greyLight : ColorHelper.greyMid,
                  fontSize: 14.sp),
              decoration: InputDecoration(
                helperText: ' ',
                hintText: hintText,
                filled: true,
                prefixIcon: isMobileNumber && language == "en"
                    ? countryCodeWidget()
                    : null,
                suffixIcon: isMobileNumber && language == "ar"
                    ? countryCodeWidget()
                    : GestureDetector(
                        onTap: suffixIconClick,
                        child: Transform.scale(
                          scale: suffixIconScale,
                          child: SvgPicture.asset(
                            "$suffixIcon",
                          ),
                        ),
                      ),
                fillColor: viewMode ? ColorHelper.navyLight : ColorHelper.white,
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
                labelStyle:
                    TextStyle(fontSize: 14.sp, color: ColorHelper.greyMid),
                errorText: errorText,
                errorMaxLines: 1,
                errorStyle: TextStyle(
                    fontSize: 12.sp,
                    height: 1.1,
                    color: ColorHelper.redErrorColor),
                suffixIconConstraints: BoxConstraints(
                  minWidth: 82.w,
                  minHeight: 56.h,
                ),
                isDense: true,
                // prefixIcon: Transform.scale(
                //   scale: prefixIconScale,
                //   child: SvgPicture.asset(
                //     "$prefixIcon",
                //   ),
                // ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.w),
                  borderSide: BorderSide(
                      color: viewMode ? ColorHelper.navyLight : Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.w),
                  borderSide: BorderSide(
                      color: viewMode ? ColorHelper.navyLight : Colors.white),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.w),
                  borderSide: BorderSide(width: .5, color: ColorHelper.red),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.w),
                  borderSide: BorderSide(
                      color: viewMode ? ColorHelper.navyLight : Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.w),
                  borderSide: BorderSide(
                      color: viewMode ? ColorHelper.navyLight : Colors.white),
                ),
              )),
        ),
      ],
    );
  }

  Widget countryCodeWidget() {
    return Align(
      widthFactor: 1,
      heightFactor: 1,
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: CustomText(
          textDirection: TextDirection.ltr,
          text: "+966 |",
          color: ColorHelper.greyMid,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
