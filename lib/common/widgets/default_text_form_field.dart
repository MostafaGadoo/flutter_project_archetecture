import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  final bool isPassword;
  final String hintText;
  double? fontSize;
  FontWeight? fontWeight;
  VoidCallback? onTap;
  TextInputType keyboardType;
  DefaultTextFormField({
    Key? key,
    required this.isPassword,
    required this.hintText,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.onTap,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
