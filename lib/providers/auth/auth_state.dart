import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;

enum AuthStatus {
  unknown,
  unauthenticated,
  authenticated,
}

class AuthState extends Equatable {
  final AuthStatus authStatus;
  final fbAuth.User? user;

  AuthState({
    required this.authStatus,
    this.user,
  });

  factory AuthState.unknown() {
    return AuthState(authStatus: AuthStatus.unknown);
  }

  AuthState copyWith({
    AuthStatus? authStatus,
    fbAuth.User? user,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [authStatus, user];
}