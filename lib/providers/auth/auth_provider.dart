import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import 'package:flutter/foundation.dart';

import '../../repositories/auth_repository.dart';
import 'auth_state.dart';

class AuthProvider with ChangeNotifier {
  AuthState _state = AuthState.unknown();

  AuthState get state => _state;

  final AuthRepository authRepository;

  AuthProvider({
    required this.authRepository,
  });

  void update(fbAuth.User? user) {
    if (user != null) {
      _state = _state.copyWith(
        user: user,
        authStatus: AuthStatus.authenticated,
      );
    } else {
      _state = _state.copyWith(authStatus: AuthStatus.unauthenticated);
    }

    print("state: $state");
    notifyListeners();
  }

  Future<void> signout() async {
    await authRepository.signout();
  }
}
