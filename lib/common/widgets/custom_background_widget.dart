import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/color_helper.dart';

class CustomBackgroundWidget extends StatelessWidget {
  final Widget child;

  const CustomBackgroundWidget({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.w),
          color: ColorHelper.lightNavy,
        ),
        child: child);
  }
}