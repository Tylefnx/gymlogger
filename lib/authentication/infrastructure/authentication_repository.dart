import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gymlogger/authentication/domain/auth_failure.dart';
import 'package:gymlogger/authentication/domain/user.dart';
import 'package:gymlogger/authentication/infrastructure/authentication_service.dart';

class AuthenticationRepository {
  final AuthenticationService _service;

  const AuthenticationRepository(this._service);

  Future<Either<AuthFailure, User>> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _service.login(
        username: username,
        password: password,
      );
      final json = response.data as Map<String, dynamic>;
      print(json);
      return Right(User.fromJson(json));
    } on DioException catch (e) {
      return left(
        AuthFailure.storage(e.message),
      );
    }
  }

  Future<Either<AuthFailure, String>> register({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _service.register(
        username: username,
        password: password,
      );
      final uid = response.data['token'] as String;
      return Right(uid);
    } on DioException catch (e) {
      return left(
        AuthFailure.storage(e.message),
      );
    }
  }

  Future<Either<String, void>> logout({
    required String token,
  }) async {
    try {
      return const Right(null);
      // final response = await _service.logout(
      //   token: token,
      // );
      // print(response.data);
      // return const Right(null);
    } on DioException {
      return left(
        token,
      );
    }
  }

  Future<Either<AuthFailure, String>> updateUser({
    required String username,
    required String token,
    required String password,
    String? email,
    String? name,
    String? surname,
    String? photoUrl,
  }) async {
    try {
      final response = await _service.updateUser(
        username: username,
        token: token,
        email: email,
        name: name,
        surname: surname,
        photoUrl: photoUrl,
        password: password,
      );
      final json = response.data as Map<String, dynamic>;
      return Right(json['message'].toString());
    } on DioException catch (e) {
      return left(
        AuthFailure.storage(e.message),
      );
    }
  }
}
