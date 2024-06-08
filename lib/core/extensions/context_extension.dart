import 'package:flutter/material.dart';

extension MediaQueryValues on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  bool get localeIsEnglish => Localizations.localeOf(this).languageCode.toLowerCase() == "en";
  bool get localeIsArabic => Localizations.localeOf(this).languageCode.toLowerCase() == "ar";
  String get currentLocale => Localizations.localeOf(this).languageCode.toLowerCase();
}
