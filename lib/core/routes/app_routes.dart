
import 'package:exam_app/presentation/features/auth/login/view/widgets/login_view.dart';
import 'package:exam_app/presentation/features/auth/sign_up/view/widgets/sign_up_view.dart';
import 'package:exam_app/presentation/features/exam/view/widgets/exam_view.dart';
import 'package:exam_app/presentation/features/main_layout/main_layout_view.dart' ;
import 'package:exam_app/presentation/features/subject/view/widgets/subject_view.dart';
import 'package:exam_app/presentation/features/subject_details/view/widgets/subject_details_view.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

abstract class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => SignUpView());
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_) => const Scaffold());
      case Routes.mainLayout:
        return MaterialPageRoute(builder: (_) => MainLayoutView());
      case Routes.subject:
        return MaterialPageRoute(builder: (_) =>SubjectView ());
      case Routes.subjectDetails:
        return MaterialPageRoute(builder: (_) => SubjectDetailsView());
        case Routes.exam:
        return MaterialPageRoute(builder: (_) => ExamView());


      // Define your routes here
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
