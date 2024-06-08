import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/common/widgets/custom_material_button.dart';
import 'package:real_state/common/widgets/custom_material_button_transparent.dart';
import 'package:real_state/common/widgets/custom_text.dart';
import 'package:real_state/core/extensions/context_extension.dart';
import 'package:real_state/core/navigation_service/named_routes.dart';
import 'package:real_state/core/navigation_service/navigation_service.dart';
import 'package:real_state/core/utils/color_helper.dart';

import '../../../../core/utils/local_storage.dart';

class CustomChangeLanguageWidget extends StatefulWidget {
  final bool navigateToHome;

  const CustomChangeLanguageWidget({super.key, required this.navigateToHome});

  @override
  State<CustomChangeLanguageWidget> createState() =>
      _CustomChangeLanguageWidgetState();
}

class _CustomChangeLanguageWidgetState
    extends State<CustomChangeLanguageWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 44.w),
      child: Column(
        children: [
          SizedBox(
            height: 44.h,
          ),
          CustomText(
              // text: tr(context).appLanguageWillChangeTo,
              text: 'App Language Will Change To',
              color: ColorHelper.white,
              fontSize: 18.sp),
          SizedBox(
            height: 20.h,
          ),
          CustomMaterialButton(
              buttonColor: ColorHelper.secondary,
              label: 'Language',
              // label: tr(context).language,
              onPressed: () async {
                widget.navigateToHome
                    ? NavigationService()
                        .pushAndRemoveUntil(NamedRoutes.homeRoute)
                    : Navigator.pop(context, true);
                context.currentLocale == "en"
                    ? {
                        // MyApp.of(context)?.setLocale(
                        //     const Locale.fromSubtags(languageCode: 'ar')),
                        // setLanguageLocalStorage('ar'),
                        // languageLabel = "English",
                      }
                    : {
                        // MyApp.of(context)?.setLocale(
                        //     const Locale.fromSubtags(languageCode: 'en')),
                        // setLanguageLocalStorage('en'),
                        // languageLabel = "العربية",
                      };
              }),
          SizedBox(
            height: 8.h,
          ),
          CustomMaterialButtonTransparent(
              label: "dismiss",
              // label: tr(context).dismiss,

              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }

  Future<void> setLanguageLocalStorage(String languageCode) async {
    await LocalStorage().setLanguage(value: languageCode);
  }
}
