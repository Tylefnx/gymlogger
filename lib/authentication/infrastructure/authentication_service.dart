import 'package:dio/dio.dart';
import 'package:gymlogger/authentication/domain/user.dart';
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
    required String password,
    String? email,
    String? photoUrl,
    String? name,
    String? surname,
  }) async {
    final updatedUser = User(
      token: token,
      username: username,
      email: email,
      photo_url: photoUrl,
      name: name,
      surname: surname,
    );
    // ignore: prefer_final_locals
    var userData = updatedUser.toJson();
    userData.addAll({"password": password});
    userData.removeWhere((key, value) => key == 'token');
    final response = await _dio.post(
      updateUserEndPoint,
      data: userData,
      options: authenticator(token: token),
    );
    return response;
  }

  Future<void> logout({required String token}) async {}
}
