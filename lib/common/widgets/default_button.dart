import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Color? buttonTextColor;
  final double? buttonTextFont;
  final FontWeight? buttonTextFontWeight;
  final double? buttonBorderRadius;
  final Color? buttonColor;
  VoidCallback? onPressed;
  final double? width;
    DefaultButton({
    Key? key,
    required this.text,
    this.buttonTextColor,
    this.buttonTextFont,
    this.buttonTextFontWeight,
    this.buttonBorderRadius,
    this.buttonColor,
    this.onPressed,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity ?? width,
      height: 54,
      clipBehavior: Clip.antiAlias,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(buttonBorderRadius ?? 16),
        ),
        color: buttonColor ?? Color(0xFFc3c3c3),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: buttonTextColor ?? Colors.white,
            fontSize: buttonTextFont ?? 19,
            fontWeight: buttonTextFontWeight ?? FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
