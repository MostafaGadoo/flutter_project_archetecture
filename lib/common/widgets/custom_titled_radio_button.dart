import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/color_helper.dart';

class CustomTitledRadioButton extends StatefulWidget {
  final String label;
  final Function(String, String)? onChanged;
  String? selectedValue;
  final String? Function(String?)? validator;

  CustomTitledRadioButton(
      {super.key,
      required this.label,
      this.onChanged,
      this.validator,
      required this.selectedValue});

  @override
  State<CustomTitledRadioButton> createState() =>
      _CustomTitledRadioButtonState();
}

class _CustomTitledRadioButtonState extends State<CustomTitledRadioButton> {
  // String? selectedValue;
  TextEditingController errorTextController = TextEditingController();

  @override
  void initState() {
    errorTextController.text = widget.selectedValue ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          textAlign: TextAlign.start,
          style: TextStyle(
              fontWeight: FontWeight.normal,
              color: ColorHelper.greyLight,
              fontSize: 14.h),
        ),
        Theme(
          data: Theme.of(context).copyWith(
            unselectedWidgetColor: Colors.white,
            primaryColor: Colors.white,
            // radioTheme: Theme.of(context).radioTheme.copyWith(
            //   fillColor: MaterialStateProperty.all(Colors.purple),
            // ),
          ), //),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: RadioListTile<String>(
                          dense: true,
                          visualDensity: const VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                            vertical: VisualDensity.minimumDensity,
                          ),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          contentPadding: EdgeInsets.zero,
                          activeColor: ColorHelper.secondary,
                          title: Text(
                            // tr(context).yes,
                            'yes',
                            style: TextStyle(
                              color: ColorHelper.white,
                              fontSize: 12.sp,
                            ),
                          ),
                          value: "Yes",
                          // value: selectedValue == null
                          //     ? (selectedValue == 'Yes')
                          //         ? 'Yes'
                          //         : (selectedValue == 'No')
                          //             ? 'No'
                          //             : ''
                          //     : '',
                          groupValue: widget.selectedValue,
                          // selected: true,
                          onChanged: (String? value) {
                            errorTextController.text = value!;
                            setState(() {
                              widget.selectedValue = value;
                            });
                            // Call the callback function with the selected value and title
                            widget.onChanged?.call(value ?? '', 'Yes');
                            print(errorTextController.text);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        dense: true,
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        contentPadding: EdgeInsets.zero,
                        activeColor: ColorHelper.secondary,
                        title: Text(
                          // tr(context).no,
                          'no',
                          style: TextStyle(
                            color: ColorHelper.white,
                            fontSize: 12.sp,
                          ),
                        ),
                        value: "No",
                        // value: selectedValue == null
                        //     ? (selectedValue == 'Yes')
                        //         ? 'Yes'
                        //         : (selectedValue == 'No')
                        //             ? 'No'
                        //             : ''
                        //     : '',
                        groupValue: widget.selectedValue,
                        // selected: false,
                        onChanged: (String? value) {
                          errorTextController.text = value!;
                          setState(() {
                            widget.selectedValue = value;
                          });
                          // Call the callback function with the selected value and title
                          widget.onChanged?.call(value ?? '', 'No');
                          print(errorTextController.text);
                        },
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    bottom: 8.h, start: 16.w, top: 2.h),
                child: SizedBox(
                  child: TextFormField(
                    style:
                        const TextStyle(color: Colors.transparent, fontSize: 0),
                    controller: errorTextController,
                    readOnly: true,
                    enableInteractiveSelection: false,
                    enabled: true,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                          color: ColorHelper.redErrorColor, fontSize: 12.sp),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      isDense: true,
                    ),
                    validator: widget.validator,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
// (value) {
// setState(() {
// widget.checked = !widget.checked;
// });
// },
