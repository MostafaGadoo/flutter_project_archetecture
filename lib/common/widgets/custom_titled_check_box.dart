import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/color_helper.dart';

class CustomTitledCheckBox extends StatefulWidget {
  final Widget label;
  final VoidCallback? onPressed;

  const CustomTitledCheckBox({
    Key? key,
    required this.label,
    this.onPressed,
  }) : super(key: key);

  @override
  _CustomTitledCheckBoxState createState() => _CustomTitledCheckBoxState();
}

class _CustomTitledCheckBoxState extends State<CustomTitledCheckBox> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        setState(() {
          isSelected = !isSelected;
          if (widget.onPressed != null) {
            widget.onPressed!(); // Invoke the onPressed callback
          }
        });
      },
      child: Row(
        children: [
          SizedBox(
            width: 50.w,
          ),
          Container(
            width: 14.w,
            height: 16.h,
            decoration: BoxDecoration(
              color: isSelected ? ColorHelper.secondary : Colors.transparent,
              border: Border.all(color: ColorHelper.white, width: 1),
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Flexible(
            child: DefaultTextStyle.merge(
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              child: widget.label, // Use the provided widget directly
            ),
          ),
        ],
      ),
    );
  }

  // Add this method to expose the isSelected state
  bool getSelectedState() {
    return isSelected;
  }
}
