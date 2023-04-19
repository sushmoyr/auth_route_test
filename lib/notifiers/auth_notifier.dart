import 'dart:async';

import 'package:auth_route_test/notifiers/app_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authNotifierProvider =
    AsyncNotifierProvider<AuthNotifier, void>(() => AuthNotifier());

class AuthNotifier extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<void> login() async {
    return ref.read(authRepositoryProvider).login();
  }
}
