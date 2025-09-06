
import 'package:exam_app/presentation/features/answer/view/answer_view.dart';
import 'package:exam_app/presentation/features/auth/forget_password/view/forget_password_view.dart';
import 'package:exam_app/presentation/features/auth/login/view/login_view.dart';
import 'package:exam_app/presentation/features/auth/sign_up/view/sign_up_view.dart';
import 'package:exam_app/presentation/features/exam/exam_soccer/view/exam_score_view.dart';
import 'package:exam_app/presentation/features/exam/view/exam_view.dart';
import 'package:exam_app/presentation/features/main_layout/main_layout_view.dart' ;
import 'package:exam_app/presentation/features/reset_password/view/reset_password_view.dart';
import 'package:exam_app/presentation/features/subject/view/subject_view.dart';
import 'package:exam_app/presentation/features/subject_details/view/subject_details_view.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

abstract class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) =>  LoginView());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) =>  SignUpView());
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_) =>  ForgetPasswordView());
      case Routes.mainLayout:
        return MaterialPageRoute(builder: (_) =>  MainLayoutView());
      case Routes.subject:
        return MaterialPageRoute(builder: (_) => SubjectView ());
      case Routes.subjectDetails:
        return MaterialPageRoute(builder: (_) =>  SubjectDetailsView());
        case Routes.exam:
        return MaterialPageRoute(builder: (_) =>  ExamView());
      case Routes.resetPassword:
        return MaterialPageRoute(builder: (_) =>  ResetPasswordView());
        case Routes.answer:
        return MaterialPageRoute(builder: (_) =>  AnswerView());
        case Routes.examScore:
        return MaterialPageRoute(builder: (_) =>  ExamScoreView());


      // Define your routes here
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
