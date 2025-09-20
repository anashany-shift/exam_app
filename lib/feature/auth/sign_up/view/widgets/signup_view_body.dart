
import 'package:exam_app/feature/auth/sign_up/view/widgets/signup_builder.dart';
import 'package:exam_app/feature/auth/sign_up/view/widgets/signup_listner.dart';
import 'package:flutter/material.dart';



class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    return const SignupListner(widget: SignupBuilder(),);
  }
}

