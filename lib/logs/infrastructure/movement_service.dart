import 'package:dio/dio.dart';
import 'package:gymlogger/core/shared/dio.dart';

class MovementLogsService {
  final Dio _dio;

  const MovementLogsService(this._dio);
  static const saveEndpoint = '/save_user_lift';
  static const updateEndPoint = '/update_user_lifts';
  static const deleteEndPoint = '/delete_user_lifts';
  static const getEndPoint = '/get_all_user_lifts';

  Future<Response> getUserLifts({
    required String username,
    required String token,
  }) async {
    final response = await _dio.post(
      getEndPoint,
      data: {
        'username': username,
      },
      options: authenticator(
        token: token,
      ),
    );
    return response;
  }

  Future<Response> saveUserLifts({
    required String username,
    required String exercize,
    required String token,
    required String date,
    required double weight,
  }) async {
    final response = await _dio.post(
      saveEndpoint,
      data: {
        'username': username,
        'exercise': exercize,
        'date': date,
        'weight': weight,
      },
      options: authenticator(
        token: token,
      ),
    );
    return response;
  }

  Future<Response> updateUserLifts({
    required String username,
    required String exercize,
    required String token,
    required String date,
    required double weight,
  }) async {
    final response = await _dio.post(
      updateEndPoint,
      data: {
        'username': username,
        'exercize': exercize,
        'date': date,
        'weight': weight,
      },
      options: authenticator(
        token: token,
      ),
    );
    return response;
  }

  Future<Response> deleteUserLifts({
    required String username,
    required String exercize,
    required String token,
    required String date,
  }) async {
    final response = await _dio.post(
      deleteEndPoint,
      data: {
        'username': username,
        'exercize': exercize,
        'date': date,
      },
      options: authenticator(
        token: token,
      ),
    );
    return response;
  }
}
