import 'package:exam_app/feature/auth/forget_password/presentation/view/widgets/reset_pasword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/forget_password_cubit.dart';
import 'otp_view.dart';
import 'enter_email.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ForgetPasswordCubit>();


    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: PageView(
              controller: cubit.pageController,
              physics: const NeverScrollableScrollPhysics(),

              children: [
                EnterEmail(onContinue: cubit.nextPage),
                OtpView(onContinue: cubit.nextPage, onBack: cubit.previousPage,onTap:(){cubit.enterEmail();}),
                ResetPassword(onBack: cubit.previousPage),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
