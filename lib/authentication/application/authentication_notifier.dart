import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gymlogger/authentication/domain/auth_failure.dart';
import 'package:gymlogger/authentication/infrastructure/authentication_repository.dart';

part 'authentication_notifier.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.loading() = _Loading;
  const factory AuthState.unauthenticated(AuthFailure? failure) =
      _UnAuthenticated;
  const factory AuthState.authenticated(String uid, AuthFailure? failure) =
      _Authenticated;
}

class AuthStateNotifier extends StateNotifier<AuthState> {
  final AuthenticationRepository _repository;
  AuthStateNotifier(this._repository)
      : super(const AuthState.unauthenticated(null));

  // Future<void> checkAndUpdateAuthStatus() async {
  //   final cachedcredentials = await _storage.read();
  //   if (cachedcredentials != null) {
  //     print('authencitaceede');
  //     state = AuthState.authenticated(cachedcredentials, null);
  //   } else {
  //     print('unauth');
  //     state = const AuthState.unauthenticated(null);
  //   }
  // }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    state = const AuthState.loading();
    final loginOrFailure = await _repository.login(
      username: username,
      password: password,
    );
    state = loginOrFailure.fold(
      (l) => AuthState.unauthenticated(l),
      (r) => AuthState.authenticated(r, null),
    );
  }

  Future<void> register({
    required String username,
    required String password,
  }) async {
    state = const AuthState.loading();
    final registerOrFailure = await _repository.register(
      username: username,
      password: password,
    );
    state = await registerOrFailure.fold(
      (l) => AuthState.unauthenticated(l),
      (r) => const AuthState.unauthenticated(null),
    );
    await login(
      username: username,
      password: password,
    );
  }

  Future<void> logout({required String token}) async {
    state = const AuthState.loading();
    final logoutOrFailure = await _repository.logout(token: token);
    state = logoutOrFailure.fold(
      (l) => AuthState.authenticated(token, null),
      (r) => const AuthState.unauthenticated(null),
    );
  }
}
