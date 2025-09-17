import 'package:exam_app/core/config/di.dart';
import 'package:exam_app/feature/auth/forget_password/presentation/view_model/forget_password_cubit.dart';
import 'package:exam_app/feature/auth/login/presentation/view_model/login_cubit.dart';
import 'package:exam_app/feature/auth/sign_up/view/view_model/signup_cubit.dart';
import 'package:exam_app/feature/main_layout/explore/presentation/view_model/explore_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/answer/view/answer_view.dart';
import '../../feature/auth/forget_password/presentation/view/forget_password_view.dart';
import '../../feature/auth/login/presentation/view/login_view.dart';
import '../../feature/auth/sign_up/view/sign_up_view.dart';
import '../../feature/exam/exam_soccer/view/exam_score_view.dart';
import '../../feature/exam/view/exam_view.dart';
import '../../feature/main_layout/main_layout_view.dart';
import '../../feature/reset_password/view/reset_password_view.dart';
import '../../feature/subject/presentation/view/subject_view.dart';
import '../../feature/subject_details/view/subject_details_view.dart';
import 'routes.dart';

abstract class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider<LoginCubit>(
              create: (context) => getIt.get<LoginCubit>(),
              child: const LoginView(),
            ));
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => getIt.get<SignupCubit>(),
              child: const SignUpView(),
            ));
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_) => BlocProvider(
          create: (context) => getIt.get<ForgetPasswordCubit>(),
          child: const ForgetPasswordView(),
        ));
      case Routes.mainLayout:
        return MaterialPageRoute(builder: (_) => MultiBlocProvider(
            providers: [
            BlocProvider(
                create: (context) => getIt.get<ExploreCubit>()..getSubjects(),),


            ],
            child: const MainLayoutView()));
      case Routes.subject:
        return MaterialPageRoute(builder: (_) => const SubjectView());
      case Routes.subjectDetails:
        return MaterialPageRoute(builder: (_) => const SubjectDetailsView());
      case Routes.exam:
        return MaterialPageRoute(builder: (_) => const ExamView());
      case Routes.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordView());
      case Routes.answer:
        return MaterialPageRoute(builder: (_) => const AnswerView());
      case Routes.examScore:
        return MaterialPageRoute(builder: (_) => const ExamScoreView());

    // Define your routes here
      default:
        return MaterialPageRoute(
          builder: (_) =>
          const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
