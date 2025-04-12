import 'package:dio/dio.dart';

Dio dealWithDio() {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://127.0.0.1:8080',
    ),
  );
  return dio;
}

Options Authenticator(String token) {
  return Options(
    headers: {
      "Authorization": "Bearer $token",
    },
  );
}

final dio = dealWithDio();
Options authenticator({required String token}) {
  return Authenticator(token);
}
