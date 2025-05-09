import 'package:dio/dio.dart';
import 'package:gymlogger/core/shared/dio.dart';

class AuthenticationService {
  final Dio _dio;

  const AuthenticationService(this._dio);
  static const loginEndPoint = '/login';
  static const registerEndPoint = '/register';
  static const updateUserEndPoint = '/update_user';
  static const logoutEndPoint = '/logout';

  Future<Response> login({
    required String username,
    required String password,
  }) async {
    final response = await _dio.post(
      loginEndPoint,
      data: {
        'username': username,
        'password': password,
      },
    );
    return response;
  }

  Future<Response> register({
    required String username,
    required String password,
  }) {
    final response = _dio.post(
      registerEndPoint,
      data: {
        'username': username,
        'password': password,
      },
    );
    return response;
  }

  Future<Response> forgotPassword() {
    final response = _dio.post(
      loginEndPoint,
      data: {},
    );
    return response;
  }

  Future<Response> updateUser({
    required String username,
    required String token,
    String? sex,
    String? email,
    String? photoUrl,
    String? name,
    String? surname,
  }) async {
    final response = await _dio.post(
      updateUserEndPoint,
      data: {
        'username': username,
        if (sex != null) 'sex': sex,
        if (email != null) 'email': email,
        if (photoUrl != null) 'photo_url': photoUrl,
        if (name != null) 'name': name,
        if (surname != null) 'surname': surname,
      },
      options: Authenticator(token),
    );
    return response;
  }

  Future<void> logout({required String token}) async {}
}
