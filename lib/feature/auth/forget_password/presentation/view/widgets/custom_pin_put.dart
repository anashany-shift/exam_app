import 'package:exam_app/core/helper/validation.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../../../../core/utils/app_colors.dart';

class CustomPinPut extends StatelessWidget {
  CustomPinPut({
    super.key,
    required this.onCompleted,
    required this.pinController,
  });
  final TextEditingController pinController;
  final void Function(String)? onCompleted;

  final pinStyle = PinTheme(
    height: 80,

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: AppColors.lightBlue,
    ),
    textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  );

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: Pinput(
        length: 6,
        controller: pinController,
        validator: Validation.validatePin,
        onCompleted: (value) {
          onCompleted?.call(value);
        },

        keyboardType: TextInputType.number,
        defaultPinTheme: pinStyle,
        focusedPinTheme: pinStyle.copyDecorationWith(
          border: Border.all(color: theme.colorScheme.primary),
          borderRadius: BorderRadius.circular(8),
        ),
        submittedPinTheme: pinStyle,
      ),
    );
  }
}
