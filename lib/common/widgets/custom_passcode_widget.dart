import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:real_state/common/widgets/custom_text.dart';
import 'package:real_state/core/utils/color_helper.dart';
import '../../core/navigation_service/named_routes.dart';

class CustomPasscodeWidget extends StatefulWidget {
  CustomPasscodeWidget({super.key});

  @override
  State<CustomPasscodeWidget> createState() => _CustomPasscodeWidgetState();
}

class _CustomPasscodeWidgetState extends State<CustomPasscodeWidget> {
  final List<String> numbers = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "assets/images/delete_icon.svg",
    "0",
    "assets/images/enter_icon.svg"
  ];

  final pinputFocusNode = FocusNode();
  final pinController = TextEditingController();

  @override
  void initState() {
    pinputFocusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    pinController.dispose();
    pinputFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 56.h,
      textStyle: TextStyle(
          fontSize: 30.sp, color: Colors.white, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: ColorHelper.greyWhite),
        borderRadius: BorderRadius.circular(10.w),
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: ColorHelper.primary,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: ColorHelper.lightNavy,
            borderRadius: BorderRadius.circular(10.h),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 46.h,
              ),
              CustomText(
                text:'enterYourPasscode',
                // text: tr(context).enterYourPasscode,
                color: ColorHelper.white,
                fontSize: 18.sp,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30.w, 0.h, 30.w, 16.h),
                child: Pinput(
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  obscuringWidget: Container(
                    width: 15.w,
                    height: 15.h,
                    decoration: BoxDecoration(
                    color: ColorHelper.secondary,
                      borderRadius: BorderRadius.circular(10.h)
                    
                  ),),
                  readOnly: true,
                  // Disable keyboard
                  focusNode: pinputFocusNode,
                  controller: pinController,
                  defaultPinTheme: defaultPinTheme,
                  // focusedPinTheme: focusedPinTheme,
                  // submittedPinTheme: submittedPinTheme,
                  length: 6,
                  validator: (String? value) {
                    if (value?.length != 6) {
                      return 'Pin must be 6 digits';
                    }
                    return null;
                  },
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted: (pin) {
                    debugPrint('onCompleted: $pin');
                  },
                ),
              ),
              SvgPicture.asset(
                "assets/images/visible_icon.svg",
                width: 40.w,
                height: 40.h,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(40.w, 30.h, 40.w, 24.h),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: numbers.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 25.0,
                      mainAxisSpacing: 25.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          if (index == 9) {
                            pinController.delete();
                          } else if (index == 11) {
                            Navigator.pushNamed(context, NamedRoutes.homeRoute);
                          } else {
                            pinController.append(numbers[index], 6);
                            // pinController.setText(numbers[index]);
                          }
                        },
                        child: Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80.h),
                            border: Border.all(
                                color: ColorHelper.secondary, width: 2),
                          ),
                          child: Center(
                              child: index == 9 || index == 11
                                  ? SvgPicture.asset(numbers[index])
                                  : CustomText(
                                      text: numbers[index],
                                      color: ColorHelper.secondary,
                                      textAlign: TextAlign.center,
                                      fontSize: 45.sp,
                                    )),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomText(
                  // text: tr(context).forgetPassword,
                  text: 'forgetPassword',
                  color: ColorHelper.white,
                  fontSize: 14.sp),
              SizedBox(
                height: 25.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
