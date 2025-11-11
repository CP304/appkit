import 'package:dio/dio.dart';
import 'interceptors.dart';

class ApiClient {
  final Dio dio;
  ApiClient._(this.dio);

  factory ApiClient({String baseUrl = "https://api.example.com"}) {
    final dio = Dio(BaseOptions(baseUrl: baseUrl, connectTimeout: const Duration(seconds: 10)));
    dio.interceptors.addAll([
      AppLogInterceptor(),
      RetryInterceptor(dio: dio),
    ]);
    return ApiClient._(dio);
  }
}
