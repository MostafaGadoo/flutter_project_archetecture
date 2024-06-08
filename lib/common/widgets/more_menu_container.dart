import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_state/core/utils/color_helper.dart';

class MainMenuContainer extends StatelessWidget {
  final String text;
  final String imagePath;
  const MainMenuContainer({
    Key? key,
    required this.text,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: ColorHelper.white,
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            SvgPicture.asset(
              imagePath,
              width: 35.w,
              height: 35.h,
            ),
            SizedBox(
              width: 12.w,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 20.w,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
