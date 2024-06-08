import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:real_state/core/utils/color_helper.dart';

class PhoneNumberField extends StatelessWidget {
  final String countryCode;
  TextEditingController? controller;
  bool isSubmitted = false;

  PhoneNumberField({
    Key? key,
    required this.countryCode,
    this.isSubmitted = false,
    this.controller,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(

      controller: controller,
      decoration:  InputDecoration(
        hintText: 'EX., 120 4567 345',
        border: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorHelper.primaryBlue,
          )
        ),
      ),
      initialCountryCode: countryCode,
      onChanged: (phone) {
        isSubmitted = true;
        debugPrint(phone.completeNumber);
      },
    );
  }
}
