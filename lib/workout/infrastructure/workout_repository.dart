import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gymlogger/authentication/domain/auth_failure.dart';
import 'package:gymlogger/workout/domain/routine.dart';
import 'package:gymlogger/workout/infrastructure/workout_service.dart';

class WorkoutRepository {
  final WorkoutService _service;

  const WorkoutRepository(this._service);

  Future<Either<AuthFailure, Routine>> getUserRoutine({
    required String username,
  }) async {
    try {
      final response = await _service.getWorkoutRoutine(username: username);
      final json = response.data as Map<String, dynamic>;
      print(json);
      final routine = Routine.fromJson(json);
      print(routine);
      return Right(routine);
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
    required Map<String, List<int>> exercises,
  }) async {
    try {
      final response = await _service.saveWorkoutRoutine(
        username: username,
        routineName: routineName,
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

  Future<Either<AuthFailure, String>> updateWorkoutRoutine({
    required String username,
    required String routineName,
    required Map<String, List<int>> exercises,
  }) async {
    try {
      final response = await _service.updateWorkoutRoutine(
        username: username,
        routineName: routineName,
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
  }) async {
    try {
      final response = await _service.deleteWorkoutRoutine(
        username: username,
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
