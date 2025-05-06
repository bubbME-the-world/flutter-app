import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../../config/environment_config.dart';
import '../../constants/session.dart';
import '../../routes/app_pages.dart';

Dio dioServices() {
  Dio dio = Dio(BaseOptions(baseUrl: EnvironmentConfig.baseUrl));
  dio.interceptors.add(LoggingInterceptor().getDioInterceptor());

  return dio;
}

class LoggingInterceptor {
  var logger = Logger(
    printer: PrettyPrinter(
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  final box = GetStorage();

  getDioInterceptor() => InterceptorsWrapper(
        onRequest: (options, handler) {
          try {
            String token = box.read(Session.token);
            options.headers = {
              'Content-Type': Headers.jsonContentType,
              'Accept': Headers.jsonContentType,
              'Authorization': 'Bearer $token',
            };
            logger.i('--> ${options.method} ${options.uri}');
            logger.i('Headers: ${options.headers}');
            logger.i('Body: ${options.data}');

            return handler.next(options);
          } catch (e) {
            logger.e("$options");
            return handler.next(options);
          }
        },
        onResponse: (response, handler) {
          try {
            logger.i(
                '<-- ${response.statusCode} ${response.statusMessage} ${response.requestOptions.uri}');
            logger.i('Headers: ${response.headers}');
            logger.i('Body: ${response.data}');
            return handler.next(response);
          } catch (e) {
            logger.e("$response");
            return handler.next(response);
          }
        },
        onError: (DioException err, handler) {
          logger.i(
              '<-- ${err.response?.statusCode} ${err.response?.statusMessage} ${err.response?.requestOptions.uri}');
          logger.i('Headers: ${err.response?.headers}');
          logger.i('Error: ${err.response?.data}');
          String token = box.read(Session.token);
          if (token.isNotEmpty && err.response?.data['code'] == 4000061) {
            box.remove(Session.token);
            Get.offAllNamed(Routes.LOGIN_V2);
          }
          return handler.next(err);
        },
      );
}
