import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultTextButton extends StatelessWidget {
  final String text;
  VoidCallback? onPressed;
  Color? textColor;
  double? fontSize;
  FontWeight? fontWeight;
  DefaultTextButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.textColor,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? Colors.blue,
            fontSize: fontSize ??  14.w ,
            fontWeight: fontWeight ?? FontWeight.w400,
          )
        ));
  }
}
