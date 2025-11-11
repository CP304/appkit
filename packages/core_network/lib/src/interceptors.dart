import 'dart:async';
import 'package:dio/dio.dart';

class AppLogInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // ignore: avoid_print
    print('[HTTP ${response.statusCode}] ${response.requestOptions.method} ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }
}

class RetryInterceptor extends Interceptor {
  final Dio dio;
  RetryInterceptor({required this.dio});

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    final shouldRetry = err.type == DioExceptionType.connectionError || err.type == DioExceptionType.receiveTimeout;
    if (shouldRetry) {
      try {
        final req = await dio.request(
          err.requestOptions.path,
          data: err.requestOptions.data,
          options: Options(method: err.requestOptions.method, headers: err.requestOptions.headers),
          queryParameters: err.requestOptions.queryParameters,
        );
        return handler.resolve(req);
      } catch (e) {
        return handler.next(err);
      }
    }
    return handler.next(err);
  }
}
