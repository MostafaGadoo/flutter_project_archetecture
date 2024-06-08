import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMaterialButtonTransparent extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const CustomMaterialButtonTransparent(
      {super.key, required this.label, required this.onPressed,  this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        height: 50.h,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
