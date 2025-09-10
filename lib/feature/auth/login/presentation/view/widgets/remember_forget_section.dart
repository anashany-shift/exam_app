import 'package:flutter/material.dart';

import '../../../../../../core/routes/routes.dart';

class RemeberAndForgetSection extends StatefulWidget {
  const RemeberAndForgetSection({super.key});

  @override
  State<RemeberAndForgetSection> createState() =>
      _RemeberAndForgetSectionState();
}

bool rememberMe = false;

class _RemeberAndForgetSectionState extends State<RemeberAndForgetSection> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Row(
      children: [
        Checkbox(
          value: rememberMe,
          onChanged: (value) {
            setState(() {
              rememberMe = value ?? false;
            });
          },
        ),
        Text('Remember me', style: theme.textTheme.bodyMedium),
       const Expanded(child: SizedBox()),

        InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.forgetPassword);
          },
          child: Text(
            'Forget Password?',
            style: theme.textTheme.bodyMedium?.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
