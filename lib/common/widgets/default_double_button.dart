import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:real_state/core/utils/color_helper.dart';


class DefaultDoubleButton extends StatelessWidget {
  const DefaultDoubleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorHelper.primaryBlue,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel',
                    style: TextStyle(
                      color: ColorHelper.primaryBlue,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    )),
              )),
        ),
        SizedBox(width: 20.w), // Spacer between buttons
        Expanded(
          child: Container(
              decoration: BoxDecoration(
                color: ColorHelper.primaryBlue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: MaterialButton(
                onPressed: () {
                  Fluttertoast.showToast(msg: 'Data is updated', backgroundColor: ColorHelper.greenSuccessColor, textColor: ColorHelper.white, gravity: ToastGravity.BOTTOM, toastLength: Toast.LENGTH_SHORT);
                },
                child: Text('Save',
                    style: TextStyle(
                      color: ColorHelper.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    )),
              )),
        ),
      ],
    );
  }
}
