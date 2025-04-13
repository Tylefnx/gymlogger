import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gymlogger/authentication/domain/auth_failure.dart';
import 'package:gymlogger/workout/domain/user_routines.dart';
import 'package:gymlogger/workout/infrastructure/workout_service.dart';

class WorkoutRepository {
  final WorkoutService _service;

  const WorkoutRepository(this._service);

  Future<Either<AuthFailure, UserRoutines>> getUserRoutine({
    required String username,
    required String token,
  }) async {
    try {
      final response = await _service.getWorkoutRoutine(
        username: username,
        token: token,
      );
      final json = response.data as Map<String, dynamic>;
      final userRoutines = UserRoutines.fromJson(json);
      return Right(userRoutines);
    } catch (e) {
      return Left(
        AuthFailure.storage(
          e.toString(),
        ),
      );
    }
  }

  Future<Either<AuthFailure, String>> saveWorkoutRoutine({
    required String username,
    required String routineName,
    required String token,
    required Map<String, List<int>> exercises,
  }) async {
    try {
      final response = await _service.saveWorkoutRoutine(
        username: username,
        routineName: routineName,
        exercises: exercises,
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

  Future<Either<AuthFailure, String>> updateWorkoutRoutine({
    required String username,
    required String routineName,
    required String token,
    required Map<String, List<int>> exercises,
  }) async {
    try {
      final response = await _service.updateWorkoutRoutine(
        username: username,
        routineName: routineName,
        token: token,
        exercises: exercises,
      );
      final successMessage = response.data.toString();
      return Right(successMessage);
    } on DioException catch (e) {
      return left(
        AuthFailure.storage(e.message),
      );
    }
  }

  Future<Either<AuthFailure, String>> deleteWorkoutRoutine({
    required String username,
    required String routineName,
    required String token,
  }) async {
    try {
      final response = await _service.deleteWorkoutRoutine(
        username: username,
        token: token,
        routineName: routineName,
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
