import 'package:dio/dio.dart';

import '../../../core/config/environment.dart';
import 'dio_interceptors.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();

  final Dio dio;
  factory DioClient() => _instance;

  DioClient._internal()
      : dio = Dio(
          BaseOptions(
            baseUrl: Environment.apiUrl,
            contentType: 'application/json',
            responseType: ResponseType.json,
          ),
        )
          ..interceptors.add(DioInterceptors())
          ..interceptors.add(InterceptorsWrapper())
          ..interceptors.add(
            LogInterceptor(
              requestBody: true,
              responseBody: true,
            ),
          );
}
