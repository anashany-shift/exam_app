import 'package:flutter/material.dart';

import '../../../../../../core/routes/routes.dart';

class RemeberAndForgetSection extends StatelessWidget {
  const RemeberAndForgetSection({super.key,required this.onChanged, required this.isRemember});
final  void Function(bool?)?onChanged; 
final bool isRemember;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Row(
      children: [
        Checkbox(
          value:isRemember,
          onChanged:onChanged
          
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

bool rememberMe = false;
