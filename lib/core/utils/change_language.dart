import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/common/widgets/custom_change_language_widget.dart';
import 'package:real_state/core/extensions/context_extension.dart';
import 'package:real_state/core/utils/color_helper.dart';



class ChangeLanguageSharedFunction {
  void changeLanguage(BuildContext context,bool  navigateToHome) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(32.w),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        // barrierColor: Colors.white.withOpacity(.1),
        backgroundColor: Colors.transparent,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7,tileMode: TileMode.clamp),
            child: Container(

              height: context.height / 3.8,
              decoration: BoxDecoration(color: ColorHelper.primary),
              child: CustomChangeLanguageWidget(navigateToHome: navigateToHome,),
            ),
          );
        });
  }
}
