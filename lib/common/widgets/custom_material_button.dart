import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/common/widgets/custom_circular_progress_indicator.dart';
import 'package:real_state/core/utils/color_helper.dart';


class CustomMaterialButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color buttonColor;
  final bool isLoading;

  const CustomMaterialButton(
      {super.key,
      required this.label,
      required this.onPressed,
      required this.buttonColor,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CustomCircularProgressIndicator()
        : SizedBox(
            width: double.infinity,
            child: MaterialButton(
              height: 50.h,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.w),
              ),
              onPressed: () {
                FocusScope.of(context).unfocus();
                onPressed();
              },
              color: buttonColor,
              child: Text(
                label,
                style: TextStyle(
                    color: ColorHelper.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal),
              ),
            ),
          );
  }
}
