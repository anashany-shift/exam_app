import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../../core/routes/routes.dart';
import '../../view_model/login_cubit.dart';

class LoginListener extends StatelessWidget {
  const LoginListener({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        switch (state) {
          case LoginSuccess():
            Navigator.of(context).pop();
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.success(message: "Login successful!"),
            );
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.mainLayout,
              (route) => false,
            );
            break;


          case LoginLoading():
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
          case LoginError():
            Navigator.of(context).pop(); // Close loading dialog
            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.error(message: state.errorMessage),
            );
            print(state.errorMessage);
          case LoginInitial():
          // Do nothing (state at cubit init).
            break;

          case LoginRememberme():
          // Do nothing (UI will rebuild using BlocBuilder).
            break;
        }
      },

      child: widget,
    );
  }
}

