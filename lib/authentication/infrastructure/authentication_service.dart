import 'package:dio/dio.dart';
import 'package:gymlogger/authentication/domain/user.dart';

class AuthenticationService {
  final Dio _dio;

  const AuthenticationService(this._dio);
  static const loginEndPoint = 'login';
  static const registerEndPoint = 'register';
  static const updateUserEndPoint = 'update_user';
  static const logoutEndPoint = 'logout';
  static const port = '8080';
  static const base = 'http://127.0.0.1:$port';

  Future<Response> login({
    required String username,
    required String password,
  }) async {
    final response = await _dio.post(
      '$base/$loginEndPoint',
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
      '$base/$registerEndPoint',
      data: {
        'username': username,
        'password': password,
      },
    );
    return response;
  }

  Future<Response> forgotPassword() {
    final response = _dio.post(
      '$base$loginEndPoint',
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
    var userData = updatedUser.toJson();
    userData.addAll({"password": password});
    print(userData);
    final response = await _dio.post(
      '$base/$updateUserEndPoint',
      data: userData,
    );
    return response;
  }

  Future<void> logout({required String token}) async {}
}
