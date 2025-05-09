import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gymlogger/authentication/domain/auth_failure.dart';
import 'package:gymlogger/authentication/domain/user.dart';
import 'package:gymlogger/authentication/infrastructure/authentication_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'authentication_notifier.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.loading() = _Loading;
  const factory AuthState.unauthenticated(AuthFailure? failure) =
      _UnAuthenticated;
  const factory AuthState.authenticated(User user, AuthFailure? failure) =
      _Authenticated;
}

class AuthStateNotifier extends StateNotifier<AuthState> {
  final AuthenticationRepository _repository;
  AuthStateNotifier(this._repository)
      : super(const AuthState.unauthenticated(null));
  User? getUserFromState() {
    return state.maybeMap(
      orElse: () => null,
      authenticated: (_) => _.user,
    );
  }

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
  }

  Future<void> updateUser({
    required String token,
    required String username,
    String? sex,
    String? name,
    String? surname,
    String? photoUrl,
    String? email,
  }) async {
    // TODO: CHANGE PASSWORD
    final user = getUserFromState();
    state = const AuthState.loading();
    final updateOrFailure = await _repository.updateUser(
      token: token,
      username: username,
      photoUrl: photoUrl,
      email: email,
      name: name,
      surname: surname,
      sex: sex,
    );
    updateOrFailure.fold(
      (l) => null,
      (r) => state = AuthState.authenticated(
        User(
          username: username,
          token: token,
          photo_url: user?.photo_url,
          email: user?.email,
          name: user?.name,
          surname: user?.surname,
          sex: sex ?? user?.sex,
        ),
        null,
      ),
    );
  }

  Future<void> logout({required String token}) async {
    final user = getUserFromState();
    state = const AuthState.loading();
    final logoutOrFailure = await _repository.logout(token: token);
    state = logoutOrFailure.fold(
      (l) => AuthState.authenticated(user!, null),
      (r) => const AuthState.unauthenticated(null),
    );
  }
}
