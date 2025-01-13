import 'package:dio/dio.dart';

Dio dealWithDio() {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://127.0.0.1:8080',
    ),
  );
  return dio;
}

final dio = dealWithDio();
