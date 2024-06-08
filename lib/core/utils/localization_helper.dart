import 'package:flutter/material.dart';

// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../navigation_service/navigation_service.dart';

// bool isRTL(BuildContext context) {
//   return Localizations.localeOf(context).languageCode == AppLocale.arabic.code;
// }
//
// AppLocalizations tr(BuildContext context) {
//   return AppLocalizations.of(context)!;
// }

String get currentLocale {
  // return tr(NavigationService().navigationKey.currentState!.context).localeName;
  return 'tr(NavigationService().navigationKey.currentState!.context).localeName';
}

bool get isLocaleAR {
  return currentLocale == 'ar';
}
