import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../../core/routes/routes.dart';
import '../../view_model/login_cubit.dart';

class LoginListener extends StatelessWidget {
  const LoginListener({
    super.key, required this.widget,

  });

  final Widget widget;


  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit,LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.of(context).pop(); // Close loading dialog
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.success(message: "Login successful!"),
            );
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.mainLayout,
                  (route) => false,
            );
          } else if (state is LoginLoading) {
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
          } else if (state is LoginError) {
            Navigator.of(context).pop(); // Close loading dialog
            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.error(message: state.errorMessage),
            );
            print(state.errorMessage);
          }
        },

        child:widget
    );
  }
}