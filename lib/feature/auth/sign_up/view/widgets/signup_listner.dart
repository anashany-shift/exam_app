import 'package:exam_app/core/routes/routes.dart';
import 'package:exam_app/feature/auth/sign_up/view/view_model/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../core/widget/custom_progress_indicator.dart';

class SignupListner extends StatelessWidget {
  const SignupListner({
    super.key, required this.widget,

  });
  final Widget widget;


  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        
       switch(state) {
         case SignupInitial():
         case SignupSuccess():
         Navigator.of(context).pop();
         showTopSnackBar(
           Overlay.of(context),
           const CustomSnackBar.success(message: "signUp Success"),
         );
         Navigator.pushNamedAndRemoveUntil(
           context,
           Routes.login,
               (route) => false,
         );
         break;
         case SignupLoading():
           showDialog(
             context: context,
             builder: (context) {
               return const AlertDialog(
                 elevation: 0,
                 backgroundColor: Colors.transparent,
                 title: Center(child: CustomProgressIndicator()),
               );
             },
           );
         case SignupError():
           Navigator.of(context).pop(); // Close loading dialog
           showTopSnackBar(
             Overlay.of(context),
             CustomSnackBar.error(message: state.message),
           );
       }
      },
      child:widget
    );
  }
}

