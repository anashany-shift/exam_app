import 'package:exam_app/core/helper/validation.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../../../../core/utils/app_colors.dart';

class CustomPinPut extends StatefulWidget {
  const CustomPinPut({super.key, required this.onCompleted});

  final void Function()? onCompleted;

  @override
  State<CustomPinPut> createState() => _CustomPinPutState();
}

class _CustomPinPutState extends State<CustomPinPut> {
  final TextEditingController pinController = TextEditingController();
  String? errorText;

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
        controller: pinController,
        validator: Validation.validatePin,
        onCompleted: _handleCompleted,

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



  void _handleCompleted(String value) {
    if (value == "1234") {
      widget.onCompleted?.call();
    } else {
      setState(() {
        errorText = "Invalid Code";
      });
    }
  }
}
