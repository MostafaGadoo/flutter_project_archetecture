import 'package:flutter/material.dart';

import '../../core/utils/color_helper.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: ColorHelper.secondary,
        strokeWidth: 2,
      ),
    );
  }
}
