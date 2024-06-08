import 'package:flutter/material.dart';

import '../../core/navigation_service/navigation_service.dart';

enum SnackBarType {
  success,
  error,
  warning,
  info,
}

class SnackBarMessage {
  final String message;
  final Color color;

  SnackBarMessage(this.message, this.color);
}

extension SnackbarTypeExtension on SnackBarType {
  SnackBarMessage get message {
    final context = NavigationService.context;
    switch (this) {
      case SnackBarType.success:
        return SnackBarMessage('success', Colors.green);
      // return SnackBarMessage(tr(context).success, Colors.green);
      case SnackBarType.error:
        return SnackBarMessage('error', Colors.red);
      // return SnackBarMessage(tr(context).error, Colors.red);
      case SnackBarType.warning:
        return SnackBarMessage('warning', Colors.orange);
      // return SnackBarMessage(tr(context).warning, Colors.orange);
      case SnackBarType.info:
        return SnackBarMessage('info', Colors.blue);
      // return SnackBarMessage(tr(context).info, Colors.blue);
      default:
        return SnackBarMessage('', Colors.transparent);
    }
  }
}
