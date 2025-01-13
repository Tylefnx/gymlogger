import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gymlogger/authentication/domain/auth_failure.dart';
import 'package:gymlogger/logs/domain/lift_logs.dart';
import 'package:gymlogger/logs/infrastructure/movement_service.dart';

class MovementLogsRepository {
  final MovementLogsService _service;

  const MovementLogsRepository(this._service);

  Future<Either<AuthFailure, LiftLogs>> getUserLifts({
    required String username,
  }) async {
    try {
      final response = await _service.getUserLifts(username: username);
      final json = response.data as Map<String, dynamic>;
      final liftLogs = LiftLogs.fromJson(json);

      return Right(liftLogs);
    } catch (e) {
      return Left(
        AuthFailure.storage(
          e.toString(),
        ),
      );
    }
  }

  Future<Either<AuthFailure, String>> saveUserLifts({
    required String username,
    required String exercize,
    required String date,
    required double weight,
  }) async {
    try {
      final response = await _service.saveUserLifts(
        username: username,
        exercize: exercize,
        date: date,
        weight: weight,
      );
      final successMessage = response.data.toString();
      return Right(successMessage);
    } on DioException catch (e) {
      return left(
        AuthFailure.storage(e.message),
      );
    }
  }

  Future<Either<AuthFailure, String>> updateUserLifts({
    required String username,
    required String exercize,
    required String date,
    required double weight,
  }) async {
    try {
      final response = await _service.updateUserLifts(
        username: username,
        exercize: exercize,
        date: date,
        weight: weight,
      );
      final successMessage = response.data.toString();
      return Right(successMessage);
    } on DioException catch (e) {
      return left(
        AuthFailure.storage(e.message),
      );
    }
  }

  Future<Either<AuthFailure, String>> deleteUserLifts({
    required String username,
    required String exercize,
    required String date,
    required double weight,
  }) async {
    try {
      final response = await _service.deleteUserLifts(
        username: username,
        exercize: exercize,
        date: date,
      );
      final successMessage = response.data.toString();
      return Right(successMessage);
    } on DioException catch (e) {
      return left(
        AuthFailure.storage(e.message),
      );
    }
  }
}
