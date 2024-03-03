part of 'auth_cubit.dart';

enum AuthStatus { authenticated, unauthenticated, unknown }

class AuthState {
  final UserModel? user;
  final AuthStatus authStatus;
  final String? errorMessage;
  final bool profileComplete;

  const AuthState(
      {this.user,
      required this.authStatus,
      this.errorMessage,
      required this.profileComplete});

  AuthState copyWith(
      {UserModel? user,
      AuthStatus? authStatus,
      String? errorMessage,
      bool? profileComplete}) {
    return AuthState(
        user: user ?? this.user,
        profileComplete: profileComplete ?? this.profileComplete,
        authStatus: authStatus ?? this.authStatus,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}

final class AuthInitial extends AuthState {
  AuthInitial() : super(authStatus: AuthStatus.unknown, profileComplete: false);
}
