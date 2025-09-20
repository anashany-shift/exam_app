import 'package:bloc/bloc.dart';
import 'package:exam_app/bloc_observer.dart';
import 'package:exam_app/core/helper/token_storage.dart';
import 'package:exam_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/config/di.dart';
import 'core/routes/routes.dart';
import 'core/theme/app_theme.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();
  bool isLogged = await TokenStorage.getRememberMeFlag();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp(isLogged: isLogged));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLogged});
  final bool isLogged;
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
        initialRoute: isLogged ? Routes.mainLayout : Routes.login,
      ),
    );
  }
}
