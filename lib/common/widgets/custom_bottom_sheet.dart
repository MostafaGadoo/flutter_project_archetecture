import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/common/widgets/custom_text.dart';
import 'package:real_state/core/navigation_service/navigation_service.dart';
import 'package:real_state/core/utils/color_helper.dart';



class CustomModalBottomSheet extends StatelessWidget {
  final List<String> stringList;
  final String? headerName;
  final Function(String) onItemSelected;
  final double? height;

  const CustomModalBottomSheet({
    required this.stringList,
    required this.onItemSelected,
    this.headerName,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7, tileMode: TileMode.clamp),
      child: Container(
        height: height,
        decoration: BoxDecoration(
            color: ColorHelper.primary,
            borderRadius: BorderRadius.circular(16.h)),
        child: Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 15.h,
              ),
              CustomText(
                text: headerName!,
                color: ColorHelper.greyLight,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
              ),
              SizedBox(
                height: 60.h,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: stringList.length,
                  itemBuilder: (context, index) {
                    final String item = stringList[index];
                    return ListTile(
                      onTap: () {
                        onItemSelected(item);
                        NavigationService().back();
                      },
                      title: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: item,
                              color: ColorHelper.greyMid,
                              fontSize: 14.sp,
                            ),
                            Divider(
                              thickness: 0.8,
                              color: ColorHelper.grey,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
