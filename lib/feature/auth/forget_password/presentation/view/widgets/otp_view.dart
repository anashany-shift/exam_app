import 'package:exam_app/feature/auth/forget_password/presentation/view_model/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../../core/widget/custom_app_bar.dart';
import 'custom_pin_put.dart';
import 'forget_password_screen_instructions.dart';

class OtpView extends StatelessWidget {
  final VoidCallback onContinue;
  final VoidCallback onBack;
 final void Function()? onTap;
  const OtpView({super.key, required this.onContinue, required this.onBack, this.onTap});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgetPasswordCubit>();
    var theme = Theme.of(context);
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        switch (state) {
          case ForgetPasswordInitial():
            break;
          case EnterEmailSuccess(emailEntity:final entity):
          Navigator.of(context).pop();

          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.success(message: entity.info),
          );
          case EnterEmailError():
            Navigator.of(context).pop(); // Close loading dialog
            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.error(message: state.errorMessage),
            );
            break;
          case EnterEmailLoading():
          showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: Center(child: CircularProgressIndicator()),
              );
            },
          );
            break;
          case VerifyCodeSuccess(verifyCodeEntity: final entity):
            Navigator.of(context).pop();

            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.success(message: entity.status),
            );
            onContinue();
            break;
          case VerifyCodeError():
            Navigator.of(context).pop(); // Close loading dialog
            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.error(message: state.errorMessage),
            );
            break;
          case VerifyCodeLoading():
            showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  title: Center(child: CircularProgressIndicator()),
                );
              },
            );
            break;
          case ChangeIndex():
          case ResetPasswordSuccess():
          case ResetPasswordError():
          case ResetPasswordLoading():
           break ;
        }
      },
      child: Column(
        children: [
          CustomAppBar(title: "Password", onTap: onBack),
          SizedBox(height: 40.h),
          const ForgetPasswordScreenInstructions(
            title: "Email verification",
            subTitle:
                "Please enter your code that send to your \nemail address ",
          ),
          SizedBox(height: 32.h),
          CustomPinPut(
            onCompleted:(value) {
              cubit.verifyCode();
            }

           , pinController: cubit.resetCodeController,
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Didn't receive code? ", style: theme.textTheme.bodyLarge),
              GestureDetector(
                onTap:onTap ,
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
      ),
    );
  }
}
