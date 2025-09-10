import 'package:exam_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/config/di.dart';
import 'core/routes/routes.dart';
import 'core/theme/app_theme.dart';


final RouteObserver<ModalRoute<void>> routeObserver =
RouteObserver<ModalRoute<void>>();
void main() {
  configureDependencies();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Exam',
        theme: AppTheme.lightTheme,
        navigatorObservers: [routeObserver],
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: Routes.login,
      ),
    );
  }
}