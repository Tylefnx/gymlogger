import 'package:gymlogger/authentication/application/authentication_notifier.dart';
import 'package:gymlogger/authentication/infrastructure/authentication_repository.dart';
import 'package:gymlogger/authentication/infrastructure/authentication_service.dart';
import 'package:gymlogger/core/shared/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authServiceProvider = Provider(
  (ref) => AuthenticationService(dio),
);

final authRepoProvider = Provider(
  (ref) => AuthenticationRepository(
    ref.watch(authServiceProvider),
  ),
);

final authStateNotifierProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>(
  (ref) => AuthStateNotifier(
    ref.watch(authRepoProvider),
  ),
);
