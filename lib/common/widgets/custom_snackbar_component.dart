import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/navigation_service/navigation_service.dart';
import '../../core/utils/color_helper.dart';
import 'custom_snackbar_widget.dart';

class SnackBarComponent extends SnackBar {
  static void show({
    required String content,
    required SnackBarType type,
    EdgeInsets margin = EdgeInsets.zero,
  }) {
    ScaffoldMessenger.of(NavigationService.context).hideCurrentSnackBar();
    ScaffoldMessenger.of(NavigationService.context)
        .showSnackBar(SnackBarComponent(
      NavigationService.context,
      type,
      content,
      margin: margin,
    ));
  }

  SnackBarComponent(
    BuildContext context,
    SnackBarType type,
    String content, {
    super.key,
    EdgeInsets margin = EdgeInsets.zero,
  }) : super(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                type.getMessage, // Updated method name
                style: TextStyle(fontSize: 20.sp, color: ColorHelper.white),
              ),
              SizedBox(height: 12.h),
              Text(
                content,
                style: TextStyle(fontSize: 12.sp, color: ColorHelper.white),
              ),
            ],
          ),
          backgroundColor: type.color,
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(bottom: 48.h),

          // behavior: SnackBarBehavior.floating,
        );
}

extension SnackbarTypeExtension on SnackBarType {
  String get getMessage {
    final context = NavigationService.context;
    switch (this) {
      case SnackBarType.success:
        return 'success';
      // return tr(context).success;

      case SnackBarType.error:
        // return tr(context).error;
        return 'error';
      case SnackBarType.warning:
        // return tr(context).warning;
        return 'warning';

      case SnackBarType.info:
        // return tr(context).info;
        return 'info';
      default:
        return '';
    }
  }

  Color get color {
    switch (this) {
      case SnackBarType.success:
        return ColorHelper.greenSuccessColor;
      case SnackBarType.error:
        return ColorHelper.redErrorColor;
      case SnackBarType.warning:
        return ColorHelper.yellow;
      case SnackBarType.info:
        return ColorHelper.blue;
      default:
        return Colors.transparent;
    }
  }
}
