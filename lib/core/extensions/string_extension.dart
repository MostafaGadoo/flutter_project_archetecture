import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../utils/constants.dart';

extension StringExtension on String {
  String get toCapital {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  bool get isValidSelectedRadioButton {
    if (isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool get isValidText {
    if (isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool get isValidMobile {
    if (length == 9) {
      return true;
    } else {
      return false;
    }
  }

  bool get isMaxTwoDigits {
    if (length <= 2 && isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool get isMaxLengthForty {
    if (length >= 2 && length <= 40 && isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool get isValidIBAN {
    if (length == 24 && isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  String dateTimeMonthNamedFormat() {
    DateTime dateTime = DateTime.parse(this);
    return DateFormat('MMM yyyy').format(dateTime);
  }

  String dateTimeFormat() {
    DateTime dateTime = DateTime.parse(this);
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  String formatAsMoney() {
    try {
      final double amount = double.parse(this);
      final formatter = NumberFormat("#,##0.00", "en_US");
      return formatter.format(amount);
    } catch (e) {
      // Handle the case where the string is not a valid number
      print("Error formatting money: $e");
      return this;
    }
  }

  // String formatAsNumber() {
  //   final String newString = this.replaceAll(',', '');
  //   final double number = double.tryParse(newString) ?? 0.0;
  //
  //   final NumberFormat numberFormat = NumberFormat('###,###.##', 'en_US');
  //
  //   return numberFormat.format(number);
  // }
  //
  String formatAsNumber() {
    final String newString = replaceAll(',', '');
    final number = int.tryParse(newString);
    if (number != null) {
      return NumberFormat('###,###.##', 'en_US').format(number);
    } else {
      return this;
    }
  }

  String getCurrencyName(BuildContext context) {
    if (this == "USD") {
      return 'USD';
      // return tr(context).usd;
    } else if (this == "USD") {
      return 'USD';
      // return tr(context).usd;
    } else {
      return "";
    }
  }

  String getLevelName(BuildContext context) {
    if (this == "low") {
      return 'low';
      // return tr(context).low;
    } else if (this == "medium") {
      return 'medium';
      // return tr(context).medium;
    } else if (this == "high") {
      return 'high';
      // return tr(context).high;
    } else {
      return "";
    }
  }

  String getFundTypeName(BuildContext context) {
    if (this == "Open-Ended") {
      return 'Open-Ended';
      // return tr(context).openEnded;
    } else if (this == "Closed-Ended") {
      return 'Closed-Ended';
      // ret urn tr(context).closedEnded;
    } else {
      return "";
    }
  }

  String formatAsNumberForTextField() {
    final numberFormat = NumberFormat('#,##0.00', 'en_US');
    final value = double.tryParse(this.replaceAll(',', ''));
    return value != null ? numberFormat.format(value) : this;
  }

  bool get isValidEmail {
    final regex = RegExp(AppConstants.emailValidationPattern);
    if (regex.hasMatch(this)) {
      return true;
    } else {
      return false;
    }
  }
}
