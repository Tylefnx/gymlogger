import 'package:dio/dio.dart';
import 'package:gymlogger/core/shared/dio.dart';

class WorkoutService {
  final Dio _dio;

  const WorkoutService(this._dio);
  static const getWorkoutRoutineEndpoint = "/get_workout_routine";
  static const deleteWorkoutRoutineEndpoint = "/delete_workout_routine";
  static const updateWorkoutRoutineEndpoint = "/update_workout_routine";
  static const saveWorkoutRoutineEndpoint = "/save_workout_routine";

  Future<Response> getWorkoutRoutine({
    required String username,
    required String token,
  }) async {
    final response = await _dio.post(getWorkoutRoutineEndpoint,
        data: {"username": username}, options: authenticator(token: token));
    return response;
  }

  Future<Response> deleteWorkoutRoutine({
    required String username,
    required String routineName,
    required String token,
  }) async {
    final response = await _dio.post(
      deleteWorkoutRoutineEndpoint,
      data: {
        'username': username,
        'routine_name': routineName,
      },
      options: authenticator(token: token),
    );
    return response;
  } // TODO:implement

  Future<Response> updateWorkoutRoutine({
    required String username,
    required String routineName,
    required String token,
    required Map<String, List<int>> exercises,
  }) async {
    final response = await _dio.post(
      updateWorkoutRoutineEndpoint,
      data: {
        'username': username,
        'routine_name': routineName,
        'exercises': exercises,
      },
      options: authenticator(token: token),
    );
    return response;
  }

  Future<Response> saveWorkoutRoutine({
    required String username,
    required String routineName,
    required String token,
    required Map<String, List<int>> exercises,
  }) async {
    final response = await _dio.post(
      saveWorkoutRoutineEndpoint,
      data: {
        'username': username,
        'exercise': exercises,
        'routine_name': routineName,
        'exercises': exercises,
      },
      options: authenticator(token: token),
    );
    return response;
  }
}
