import 'package:dio/dio.dart';

class WorkoutService {
  final Dio _dio;

  const WorkoutService(this._dio);
  static const getWorkoutRoutineEndpoint = "/get_workout_routine";
  static const deleteWorkoutRoutineEndpoint = "/delete_workout_routine";
  static const updateWorkoutRoutineEndpoint = "/update_workout_routine";
  static const saveWorkoutRoutineEndpoint = "/save_workout_routine";

  Future<Response> getWorkoutRoutine({
    required String username,
  }) async {
    final response = await _dio.post(
      getWorkoutRoutineEndpoint,
      data: {"username": username},
    );
    return response;
  }

  Future<Response> deleteWorkoutRoutine({
    required String username,
    required String routineName,
  }) async {
    final response = await _dio.post(
      deleteWorkoutRoutineEndpoint,
      data: {
        'username': username,
        'routine_name': routineName,
      },
    );
    return response;
  }

  Future<Response> updateWorkoutRoutine({
    required String username,
    required String routineName,
    required Map<String, List<int>> exercises,
  }) async {
    final response = await _dio.post(
      updateWorkoutRoutineEndpoint,
      data: {
        'username': username,
        'routine_name': routineName,
        'exercises': exercises,
      },
    );
    return response;
  }

  Future<Response> saveWorkoutRoutine({
    required String username,
    required String routineName,
    required Map<String, List<int>> exercises,
  }) async {
    final response = await _dio.post(
      saveWorkoutRoutineEndpoint,
      data: {
        'username': username,
        'exercise': exercises,
        'routine_name': routineName,
      },
    );
    return response;
  }
}
