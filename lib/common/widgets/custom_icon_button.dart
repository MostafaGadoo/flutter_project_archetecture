import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String iconPath;
  const CustomIconButton({
    Key? key,
    required this.onPressed,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SvgPicture.asset(
        iconPath,
        width: 30.w,
        height: 30.h,
      ),
    );
  }
}
