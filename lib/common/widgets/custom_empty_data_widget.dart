import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class CustomEmptyDataWidget extends StatelessWidget {
  const CustomEmptyDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 18.h,
      ),
      SvgPicture.asset("assets/images/empty_data_icon.svg"),
      SizedBox(
        height: 18.h,
      ),
      Text(
        // tr(context).noDataAvailable,
       'noDataAvailable',
        style: TextStyle(color: Colors.white, fontSize: 16.sp),
      )
    ]);
  }
}
