
import 'package:exam_app/feature/auth/login/presentation/view/widgets/login_builder.dart';
import 'package:flutter/material.dart';


import 'login_listner.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginListener(widget: LoginBuilder(),);
  }
}



