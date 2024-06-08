import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/extensions/context_extension.dart';
import 'package:real_state/core/utils/color_helper.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor; // Optional background color
  final String? title; // Optional background color
  final double? tileSpacing; // Optional background color
  final VoidCallback? onBackTap; // Optional ontap else will pop back
  final IconData? icon;
  final Widget? trailingIcon;
  final bool enableBackButton;

  const CustomAppBar({
    this.backgroundColor,
    this.title,
    super.key,
    this.tileSpacing,
    this.onBackTap,
    this.icon,
    this.trailingIcon,
    this.enableBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0.h),
      child: AppBar(
        centerTitle: false,
        title: Padding(
          padding: EdgeInsetsDirectional.only(top: 4.h, start: 2.w),
          child: Container(
            width: context.width / 1.5,
            child: Text(
              title!,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 20.sp,
                  color: ColorHelper.white,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
        backgroundColor: backgroundColor,
        elevation: 0,
        titleSpacing: tileSpacing,
        leading: enableBackButton ? Padding(
          padding: EdgeInsetsDirectional.only(start: 16.w,top: 4.h),
          child: Container(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
              color: ColorHelper.lightNavy,
              borderRadius: BorderRadius.circular(12.h),
            ),
            child: IconButton(
              alignment: Alignment.center,
              padding: icon != null ? EdgeInsets.zero : EdgeInsetsDirectional.only(start: 8.w),
              iconSize: 20.w,
              onPressed: () {
                onBackTap != null ? onBackTap!() : Navigator.of(context).pop();
              },
              icon:  Icon(
                icon ?? Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
        ) : null,
        actions: trailingIcon != null  ? [Padding(
          padding: EdgeInsetsDirectional.only(end: 16.w,top: 4.h),
          child: trailingIcon!,
        )] : null,
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 50.h);
}
