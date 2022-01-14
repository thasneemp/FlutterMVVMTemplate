import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../network/constants/endpoints.dart';
import '../../sharedpref/shared_prefrenses.dart';

abstract class NetWorkModule {
  static Dio provideDioClient(SharedPreferencesHelper sharedPrefHelper) {
    final dio = Dio();
    dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout = Endpoints.receiveTimeout
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ))
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options,
              RequestInterceptorHandler handler) async {
            // getting token
            var token = await sharedPrefHelper.authToken;
            if (token != null) {
              options.headers.putIfAbsent('Authorization', () => token);
            } else {
              if (kDebugMode) {
                print('Auth token is null');
              }
            }

            return handler.next(options);
          },
        ),
      );
    return dio;
  }
}
