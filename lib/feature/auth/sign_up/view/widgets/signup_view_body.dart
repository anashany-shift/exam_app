
import 'package:exam_app/feature/auth/sign_up/view/widgets/signup_builder.dart';
import 'package:exam_app/feature/auth/sign_up/view/widgets/signup_listner.dart';
import 'package:flutter/material.dart';



class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  @override
  Widget build(BuildContext context) {
  
    return const SignupListner(widget: SignupBuilder(),);
  }
}

