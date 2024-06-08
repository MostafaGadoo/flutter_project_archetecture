import 'package:flutter/cupertino.dart';
import 'package:real_state/core/extensions/string_extension.dart';

extension TextEditingControllerExtension on TextEditingController {
  void formatTextAsNumber() {
    final controllerTextValue = text;
    if (controllerTextValue.length > 14 ||
        _isTextContainsMoreThatDot(controllerTextValue)) {
      clear();
      return;
    }
    if (controllerTextValue.contains('.') &&
        _isTextContainsMoreThanTwoDigitsAfterDot(controllerTextValue)) {
      text = text.replaceRange(text.length - 1, null, '');
    }
    final formattedText = controllerTextValue.formatAsNumber();
    if (controllerTextValue != formattedText) {
      value = value.copyWith(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    }
  }

  /// 123.12.12 => Invalid
  /// 123.12 => Valid
  bool _isTextContainsMoreThatDot(String text) {
    return !RegExp(r'^[^.]*\.?[^.]*$').hasMatch(text);
  }

  /// 123.123 => Invalid
  /// 123.12 => Valid
  bool _isTextContainsMoreThanTwoDigitsAfterDot(String text) {
    return RegExp(r'^[^.]*\.\d{3,}$').hasMatch(text);
  }
}
