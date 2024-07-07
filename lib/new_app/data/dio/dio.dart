import 'dart:io';

import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

class NewAppDioFactory {
  late Dio dio;
  NewAppDioFactory() {
    // CancelToken cancelToken = CancelToken();
    BaseOptions options = BaseOptions(
      baseUrl: "https://home-services.ndsegypt.com/api/",
      headers: {"Accept": "application/json"},
      contentType: 'application/json',
      responseType: ResponseType.json,
    );

    dio = Dio(options);

    // ignore: deprecated_member_use
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    if (kDebugMode) {
      dio.interceptors.add(
        AwesomeDioInterceptor(
          // Disabling headers and timeout would minimize the logging output.
          // Optional, defaults to true
          logRequestTimeout: false,
          logRequestHeaders: true,
          logResponseHeaders: true,
          // Optional, defaults to the 'log' function in the 'dart:developer' package.
          logger: debugPrint,
        ),
/*         LogInterceptor(
          // logPrint: (object) => //debugPrint(object.toString()),
          error: true,
          request: true,
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: true,
        ), */
      );
    }

    dio.interceptors.add(
      // RefreshTokenInterceptor(pref, dioClient: dio)
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          handler.next(options);
        },
        onResponse: (response, handler) => handler.next(response),
        onError: (DioException e, handler) async => await _onError(e, handler),
      ),
    );
  }
}

_onError(
  DioException e,
  ErrorInterceptorHandler handler,
) async {
  return handler.next(e);
}
