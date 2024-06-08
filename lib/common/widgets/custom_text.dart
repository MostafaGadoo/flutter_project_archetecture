import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final double height;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextDirection? textDirection;


  const CustomText(
      {required this.text,
      required this.color,
      required this.fontSize,
      this.fontWeight = FontWeight.normal,
      this.textAlign = TextAlign.start,
      this.height = 0.0,
        this.textDirection,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      textDirection: textDirection,
      style:
          TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight,height: height),
    );
  }
}
