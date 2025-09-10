import 'package:dio/dio.dart';
import 'package:exam_app/core/constants/api_constant.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/web.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class DioModule {
  @singleton
  Dio get dio {
    final dio = Dio(
      BaseOptions(baseUrl: ApiConstant.baseUrl),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final prefs = await SharedPreferences.getInstance();
          final token = prefs.getString("token");

          if (token != null && token.isNotEmpty) {
            options.headers['token'] = token;
          }

          return handler.next(options);
        },
    
      ),
    );
     dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
        logPrint: (object) => Logger().i(object),
      ),
    );

    return dio;
  }
}
