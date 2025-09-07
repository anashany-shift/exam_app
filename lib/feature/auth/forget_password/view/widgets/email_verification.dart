import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/widget/custom_app_bar.dart';
import 'custom_pin_put.dart';
import 'forget_password_screen_instructions.dart';

class EmailVerification extends StatelessWidget {
  final VoidCallback onContinue;
  final VoidCallback onBack;
  const EmailVerification({
    super.key,
    required this.onContinue,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        CustomAppBar(title: "Password", onTap: onBack),
        SizedBox(height: 40.h),
        const ForgetPasswordScreenInstructions(
          title: "Email verification",
          subTitle: "Please enter your code that send to your \nemail address ",
        ),
        SizedBox(height: 32.h),
        CustomPinPut(onCompleted: onContinue),
        SizedBox(height: 24.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Didn't receive code? ", style: theme.textTheme.bodyLarge),
            GestureDetector(
              child: Text(
                'Resend ',
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.primaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
