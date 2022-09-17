import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/user.dart';

class AuthController extends StateNotifier<User?> {
  AuthController() : super(null);
  loginUser() {
    state = User(
      name: 'Farmer',
      id: DateTime.now().toString(),
    );
  }
}

final authControllerProvider =
    StateNotifierProvider<AuthController, User?>((ref) {
  return AuthController();
});
