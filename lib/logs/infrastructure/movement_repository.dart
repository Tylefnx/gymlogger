import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gymlogger/authentication/domain/auth_failure.dart';
import 'package:gymlogger/logs/domain/lift_logs.dart';
import 'package:gymlogger/logs/domain/movement_log.dart';
import 'package:gymlogger/logs/domain/predictions.dart';
import 'package:gymlogger/logs/infrastructure/movement_service.dart';

class MovementLogsRepository {
  final MovementLogsService _service;

  const MovementLogsRepository(this._service);

  Future<Either<AuthFailure, MovementLogs>> getUserLifts({
    required String username,
    required String token,
  }) async {
    try {
      final response = await _service.getUserLifts(
        username: username,
        token: token,
      );
      final json = response.data as List<dynamic>;
      final logs =
          json.map((a) => LiftLog.fromJson(a as Map<String, dynamic>)).toList();
      return Right(MovementLogs(logs: logs));
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
    required double bodyWeight,
    required String sex,
    required int age,
    required String token,
  }) async {
    try {
      final response = await _service.saveUserLifts(
        username: username,
        exercize: exercize,
        date: date,
        weight: weight,
        token: token,
        bodyWeight: bodyWeight,
        sex: sex,
        age: age,
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
    required String token,
    required double weight,
  }) async {
    try {
      final response = await _service.updateUserLifts(
        username: username,
        exercize: exercize,
        date: date,
        token: token,
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
    required String token,
  }) async {
    try {
      final response = await _service.deleteUserLifts(
        username: username,
        exercize: exercize,
        date: date,
        token: token,
      );
      final successMessage = response.data.toString();
      return Right(successMessage);
    } on DioException catch (e) {
      return left(
        AuthFailure.storage(e.message),
      );
    }
  }

  Future<Either<AuthFailure, Predictions>> getPredictions({
    required String username,
    required String exercise,
    required String token,
  }) async {
    try {
      final response = await _service.getPredictions(
        username: username,
        token: token,
        exercize: exercise,
      );
      final json = response.data as Map<String, dynamic>;
      final predictions = Predictions.fromJson(json);
      return Right(predictions);
    } catch (e) {
      return Left(
        AuthFailure.storage(
          e.toString(),
        ),
      );
    }
  }
}
